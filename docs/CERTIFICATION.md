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

## License declaration is not license proof

The builder enforces that a license is **declared**. It cannot verify that the
author actually **holds** the rights they declare. A manifest field is a claim,
not a chain of title — the same distinction as above, applied to content rights.

Tier 2 ("Official ODY") therefore includes a **documented rights audit** as part
of the registry review:

| Audit step | What is checked |
|---|---|
| Source compatibility | each source's `license_status` permits redistribution under `allowed_use` |
| Pack license fit | `license_policy` is compatible with every source, using the most restrictive one where licenses mix |
| Provenance record | reviewer, date and sources checked are kept in the registry entry alongside the review record |

A pack with a declared license but without a completed rights audit is Tier 1
("ODY-compatible") at most. **Declaration proves intent; audit establishes
trust.** Reviewers must not treat a filled-in `license_policy` field as proof of
rights.

## Naming rules

| Statement | Who may use it | With logo? |
|---|---|---|
| "ODY-compatible" | anyone whose artifact passes the toolchain | no |
| "built with ody-format" / "reads ODY packs" | anyone, truthfully | no |
| "Official ODY" / "ODY-reviewed" / "ODY certified" | registry-listed packs only, with permission | only with written authorization |
| product/company name containing "ODY" | requires written permission | — |

## Registry neutrality: the standard is open, certifications are scoped

The format must not hard-wire a single registry. Anyone may run a registry for
their own trust community: a mountaineering association can review alpine packs,
a disaster-relief organization can certify emergency content, a device maker can
approve packs for its hardware. A standard that technically only admits one
registry would contradict the goal of an open standard in the long run.

The rules that keep this honest:

- **Schemas carry claims, not authority.** Nothing in the format requires a pack
  to be listed in any specific registry to be valid or buildable.
- **Marks belong to their registries.** "Official ODY" is a certification mark
  of the ODY registry alone. Another registry grants its own marks ("Reviewed by
  <organization>") under its own policy — never under ODY's.
- **Downstream software should support multiple trusted registries** (a
  configurable trust list), not one hardcoded endpoint.
- **The ODY registry is authoritative for exactly one scope:** ODY's own
  certification marks and the tier "Official ODY". That authority is earned by
  review quality, not enforced by the format.

Open standard, scoped certification — that is the whole model.

## Upgrade path for pack authors

```
technical_demo → community_reviewed → editor_reviewed → expert_reviewed
                                        ↑
                          registry audit → Official ODY
```

See [CONTRIBUTING.md](../CONTRIBUTING.md) for how review promotion works.
