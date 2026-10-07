#!/usr/bin/env bash
# Reproducible end-to-end test for the ODY reference toolchain.
# Run from the repository root:  bash tools/test.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ODY="$ROOT/tools/bin/ody"
WORK="$(mktemp -d)"
export SOURCE_DATE_EPOCH=1767225600  # 2026-01-01T00:00:00Z -> reproducible

cleanup() { rm -rf "$WORK"; }
trap cleanup EXIT

pass=0
fail=0

check() {
  local name="$1"; shift
  if "$@" >/dev/null 2>&1; then
    echo "  PASS  $name"
    pass=$((pass+1))
  else
    echo "  FAIL  $name"
    fail=$((fail+1))
  fi
}

echo "== 1. Example packs: validate"
for p in "$ROOT"/examples/*/pack.json; do
  check "validate $(basename "$(dirname "$p")")" "$ODY" validate "$p"
done

echo "== 2. Example packs: build"
mkdir -p "$WORK/build"
for p in "$ROOT"/examples/*/pack.json; do
  check "build $(basename "$(dirname "$p")")" "$ODY" build "$p" -o "$WORK/build"
done

echo "== 3. Built artifacts: inspect --verify"
for f in "$WORK"/build/*.sqlite; do
  check "verify $(basename "$f")" "$ODY" inspect "$f" --verify
done

echo "== 4. Mission bundles: validate"
for m in "$ROOT"/mission-bundles/*.json; do
  check "validate $(basename "$m")" "$ODY" validate "$m"
done

echo "== 5. Hello-world loop"
check "init"   "$ODY" init "$WORK/hello" --pack-id hello-world-en --title "Hello"
check "validate hello" "$ODY" validate "$WORK/hello/pack.json"
check "build hello"    "$ODY" build "$WORK/hello/pack.json" -o "$WORK/hello/build"
check "inspect hello"  "$ODY" inspect "$WORK/hello/build/hello-world-en.sqlite" --verify

echo "== 6. Reproducible builds"
"$ODY" build "$ROOT"/examples/water-basics/pack.json -o "$WORK/r1" >/dev/null 2>&1
"$ODY" build "$ROOT"/examples/water-basics/pack.json -o "$WORK/r2" >/dev/null 2>&1
h1="$(sha256sum "$WORK"/r1/example-water-basics-en.sqlite | cut -d' ' -f1)"
h2="$(sha256sum "$WORK"/r2/example-water-basics-en.sqlite | cut -d' ' -f1)"
if [ "$h1" = "$h2" ]; then
  echo "  PASS  reproducible build ($h1)"
  pass=$((pass+1))
else
  echo "  FAIL  reproducible build ($h1 != $h2)"
  fail=$((fail+1))
fi

echo "== 7. Rejections (must fail)"
mkbad() { python3 - "$@" <<'PY'
import json, sys
src, out, mode = sys.argv[1], sys.argv[2], sys.argv[3]
d = json.load(open(src))
if mode == "no-required":
    d.pop("required_packs", None)
elif mode == "medical-undeclared":
    d["entries"][0]["title"] = "dosage and medication guidance"
elif mode == "unresolved-source":
    d["entries"][0]["source_ids"] = ["src-does-not-exist"]
json.dump(d, open(out, "w"))
PY
}
mkbad "$ROOT"/mission-bundles/example-alpine-crossing.json "$WORK/bad1.json" no-required
check "reject mission without required_packs" bash -c "! '$ODY' validate '$WORK/bad1.json'"
mkbad "$ROOT"/examples/water-basics/pack.json "$WORK/bad2.json" medical-undeclared
check "reject medical terms in non-medical pack" bash -c "! '$ODY' validate '$WORK/bad2.json'"
mkbad "$ROOT"/examples/water-basics/pack.json "$WORK/bad3.json" unresolved-source
check "reject unresolved source lineage" bash -c "! '$ODY' validate '$WORK/bad3.json'"

echo
echo "RESULT: $pass passed, $fail failed"
[ "$fail" -eq 0 ]
