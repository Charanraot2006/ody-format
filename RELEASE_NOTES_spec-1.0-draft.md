# ODY Format — spec-1.0-draft

First public release of **ODY Format**: an open standard for offline knowledge, maps and mission bundles — versioned, source-aware and reviewable.

**Status: early draft.** The toolchain is stable and the format is usable today; the spec is deliberately still open for change. We are looking for the **first external pack builder** — someone who builds a pack with our CLI without our help. That is the milestone this release exists for.

## What's in this release

- **Manifest Schema v2** — identity, capabilities, dependencies, variants, lineage, freshness, confidence, review, integrity, revocation
- **Mission Bundle Schema v1** — required vs. recommended packs, with one non-negotiable rule: `hard_blockers_override_score` (a missing required pack means *not ready*, whatever any percentage says)
- **`ody` CLI** — `init → validate → build → inspect`, Python 3.8+, zero third-party dependencies
- **Three example packs** (water, navigation, signaling) — all marked `technical_demo`
- **Licensing framework** — Apache-2.0 for format and toolchain, per-pack content licenses, trademark policy (claimed, not registered)

## What this is *not*

- Not a knowledge library itself — this repository is the **format and the toolchain**. Content lives in packs, wherever their authors publish them.
- Not medical advice infrastructure: packs declared `MEDICAL_ADVISORY` are permanently emitted as `PENDING_MEDICAL_REVIEW` / `ADVISORY_ONLY`. The builder has no code path that promotes them. On purpose.

## Getting started

The whole loop is four commands and takes about 15 minutes — see the [README](README.md). A first meaningful pack takes under two hours.

Good first tasks are labelled [`good first issue`](../../labels/good%20first%20issue). If the schema gets in your way, open an issue — breaking changes are cheap now and will get expensive later.

> What knowledge should never depend on an internet connection?
