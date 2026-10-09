# ODY Format

> **Build knowledge that still works when the internet doesn't.**
>
> ODY Format is an open standard for offline knowledge, maps and mission bundles — versioned, source-aware and reviewable.

No cloud, no account, no runtime service. A pack is a small SQLite file with a manifest that says **where the content came from** and **how much you can trust it**.

---

## Why

The knowledge you need most is the knowledge you can't look up. A guidebook, a map, a checklist, a local expert's notes — all of it should still be on your device when the network is gone, and all of it should be honest about its own limits.

ODY Format gives that content a common shape so anyone can build it, review it, and use it — in an app, on a laptop, or in your own tooling.

## Quickstart (15 minutes or less)

Requires Python 3.8+. No third-party packages.

```bash
git clone https://github.com/ody-format/ody-format.git
cd ody-format
export PATH="$PWD/tools/bin:$PATH"

# 1. Scaffold a pack
ody init my-pack/ --pack-id my-first-pack-en --title "My First Pack"

# 2. Validate it
ody validate my-pack/pack.json

# 3. Build it (SQLite + full-text search + manifest)
ody build my-pack/pack.json -o build/

# 4. Inspect what you made
ody inspect build/my-first-pack-en.sqlite --verify
```

That's the whole loop: **init → validate → build → inspect**.

Now edit `my-pack/pack.json`, replace the example entry with your own knowledge, and rebuild. A first meaningful pack takes under two hours.

## What's in a pack?

| Piece | What it does |
|---|---|
| **pack.json** | Human-editable source: entries, sources, capabilities |
| **`.sqlite`** | Built artifact: `knowledge_entries` + FTS5 index, ready for offline search |
| **`.manifest.json`** | Provenance and trust: who published it, what it covers, hashes, review status |

Every entry keeps its `source_ids`, and every source keeps its `url`, `license_status` and `allowed_use`. The builder **rejects** any entry whose sources can't be resolved — there is no such thing as unsourced knowledge in this format.

## Trust is part of the format

ODY Format separates **what an entry says** from **how much it can be trusted**:

- `content_governance.declared_content_class` — is this a procedure, reference data, or medical advisory?
- `review.status` — `unreviewed` → `technical_demo` → `community_reviewed` → `editor_reviewed` → `expert_reviewed`
- `freshness` — when was the source published, and what happens when the content gets old?
- `confidence` — optional numeric trust per dimension

Medical content is a special case and always will be. A pack declared `MEDICAL_ADVISORY` is **permanently** emitted as `PENDING_MEDICAL_REVIEW` and `ADVISORY_ONLY` — the builder has no code path that promotes it. That's a deliberate constraint: safety-critical claims need qualified human review, not just a schema.

## The three commands

```
ody validate  <pack.json | manifest.json | mission.json>   check against the spec
ody build     <pack.json> [-o DIR]                        build SQLite + FTS5 + manifest
ody inspect   <pack.sqlite> [--verify]                    read it back, verify hashes
```

`--verify` recomputes the SHA-256 and size against the manifest and checks the FTS5 index is present.

## Mission bundles

A **mission bundle** ties packs together for a concrete preparation — what's required, what's recommended, and what hard conditions must hold:

```bash
ody validate mission-bundles/example-alpine-crossing.json
```

See [`schemas/ody-mission-bundle-v1.schema.json`](schemas/ody-mission-bundle-v1.schema.json). One rule is non-negotiable in the schema itself: `readiness.evaluation_contract` is `hard_blockers_override_score`. A missing required pack means the mission is **not ready**, no matter what any percentage says.

## Examples

Three complete, harmless example packs live in [`examples/`](examples/):

| Example | Shows |
|---|---|
| `water-basics` | Procedures with checklists and decision rules |
| `navigation-basics` | Knowledge entries with risk classes |
| `signaling-basics` | Cross-referenced sources and keywords |

They build cleanly and are marked `technical_demo` — they illustrate the format, not expert advice.

## What should never depend on an internet connection?

That's the question this project exists to answer. A mountain guide's alpine knowledge. A sailor's local waters. A geologist's regional hazards. A radio amateur's communication practice. A traveller's notes on a place. If that's you, you don't need to be a developer to contribute — see [CONTRIBUTING.md](CONTRIBUTING.md).

## Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md) for the roles (pack author → reviewer → domain expert → maintainer), the review ladder, and how to submit a pack.

Found a security issue? See [SECURITY.md](SECURITY.md).

## License

**Make the format open. Protect the brand. Build the business around trust.**

| Layer | License |
|---|---|
| Format, toolchain, schemas | **Apache-2.0** — commercial use explicitly welcome |
| Knowledge pack content | **Per pack, declared by the author** — the builder's license never applies to content |
| ODY name, logo, certification marks | **Trademark law** — see [TRADEMARKS.md](TRADEMARKS.md) |

Two trust tiers exist: **ODY-compatible** (passes the open toolchain — usable by
anyone) and **Official ODY** (registry-listed after a documented human review
including a rights audit — permission required). Registries are pluggable:
anyone can run one for their own trust community, and the ODY registry is
authoritative only for ODY's own marks. Marks are claimed (™), not registered —
see [TRADEMARKS.md](TRADEMARKS.md). Full picture:
[docs/CERTIFICATION.md](docs/CERTIFICATION.md),
[docs/LICENSING.md](docs/LICENSING.md), [NOTICE](NOTICE).
