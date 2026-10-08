# Certification: "ODY-compatible" vs. "Official ODY"

Trust in this ecosystem is tiered on purpose. Two labels exist, and they must
never be confused.

## Tier 1 — ODY-compatible

**Meaning:** the artifact passes the open toolchain.

| Requirement | Check |
|---|---|
| Valid against the schema | `ody validate` |
| Builds into a pack | `ody build` |
| Integrity verifiable | `ody inspect --verify` |
| Sources resolvable, license declared | enforced by the builder |

Anyone may state **"ODY-compatible"** for an artifact that passes these checks,
without asking permission. This label describes *interoperability*, not quality.
It must be used without the ODY logo and without implying endorsement.

## Tier 2 — Official ODY / ODY-reviewed

**Meaning:** the artifact passed human review and is listed in the official
ODY registry.

| Requirement | Check |
|---|---|
| Tier 1 (all of the above) | toolchain |
| Review ladder at or above `editor_reviewed` (or `expert_reviewed` for high-risk content) | human reviewers, recorded in `review.reviewers` |
| Provenance and license audited | registry process |
| Listed in the official registry | ODY maintainers |

The marks **"Official ODY"**, **"ODY-reviewed"** and **"ODY certified"** are
certification marks. Their use requires prior written permission and a registry
listing (see [TRADEMARKS.md](../TRADEMARKS.md)).

## Why there is no self-declared "certified" field in the manifest

A field like `"certified": true` in a JSON manifest would be written by whoever
authors the manifest. It would be a claim, not a certificate — and a forgeable
field in a trust model is worse than no field at all. The manifest therefore
carries claims (`review.status`, `publisher.publisher_type`), and the **registry
is the authority** that makes a claim official. Downstream software should
treat manifest claims as self-declared and registry listings as verified.

## Naming rules

| Statement | Who may use it | With logo? |
|---|---|---|
| "ODY-compatible" | anyone whose artifact passes the toolchain | no |
| "built with ody-format" / "reads ODY packs" | anyone, truthfully | no |
| "Official ODY" / "ODY-reviewed" / "ODY certified" | registry-listed packs only, with permission | only with written authorization |
| product/company name containing "ODY" | requires written permission | — |

## Upgrade path for pack authors

```
technical_demo → community_reviewed → editor_reviewed → expert_reviewed
                                        ↑
                          registry audit → Official ODY
```

See [CONTRIBUTING.md](../CONTRIBUTING.md) for how review promotion works.
