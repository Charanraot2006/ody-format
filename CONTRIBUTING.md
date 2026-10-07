# Contributing to ODY Format

Thanks for wanting to build offline knowledge. You do **not** need to be a developer — the most valuable contributions are domain knowledge in a good format.

## Ways to contribute

| You are | You can |
|---|---|
| A **domain expert** (guide, sailor, medic, geologist, radio amateur…) | Author a pack in your field |
| A **developer** | Improve the toolchain, schemas, or integrations |
| A **reviewer** | Check packs for accuracy, sources and clarity |
| A **user** | Report packs that are wrong, outdated or unclear |

## The review ladder

Every pack carries a `review.status`. It can only move **up**, and each step has meaning:

```
unreviewed ─→ technical_demo ─→ community_reviewed ─→ editor_reviewed ─→ expert_reviewed
```

| Status | Meaning | Who sets it |
|---|---|---|
| `technical_demo` | Format-correct, not yet vouched for | The builder (default) |
| `community_reviewed` | Checked by a community reviewer for sources and clarity | Reviewer |
| `editor_reviewed` | Checked by a project editor for accuracy | Editor |
| `expert_reviewed` | Vouched for by a qualified domain expert | Domain expert |

The toolchain never sets anything above `technical_demo`. Promotion is a **human** decision and is recorded in `review.reviewers`.

## Medical content

Medical content is governed by stricter rules, on purpose:

- Declare `content_class: MEDICAL_ADVISORY` and provide a `medical_governance` block.
- The builder **always** emits `PENDING_MEDICAL_REVIEW` and `ADVISORY_ONLY` — there is no path to auto-promote medical content.
- Non-medical packs are **rejected** if they contain reserved medical terms (`diagnosis`, `dose`, `medication`, …). If your content is medical, declare it honestly.

This is not bureaucracy. It is the difference between a useful tool and a dangerous one.

## Submitting a pack

1. **Fork** and create a branch.
2. **Scaffold** with `ody init my-pack/` and fill in your content.
3. **Validate and build** locally:
   ```bash
   ody validate my-pack/pack.json
   ody build my-pack/pack.json -o build/
   ody inspect build/*.sqlite --verify
   ```
4. **Check your sources.** Every entry needs `source_ids`, and every source needs a real `https://` URL, a `license_status` and an `allowed_use`. If you wrote the content yourself, say so.
5. **Open a pull request** with:
   - What the pack covers and for whom
   - Your sources and their licenses
   - Your own qualification (so reviewers know your background)

## What reviewers look for

- Sources are real, cited per entry, and their license permits this use
- `content_class` and `risk_class` are honest
- Entries are actionable: `actions`, `checklist`, `decision_rules`, `prohibitions` are filled in
- Language and terminology match the target audience
- Nothing is presented as `expert_reviewed` without an expert

## Style guide for entries

- **title**: short, says what the entry is about
- **summary**: one or two sentences, readable at a glance
- **detail**: the full explanation, self-contained
- **actions / checklist**: concrete and in order
- **decision_rules**: "If X, then Y" — the judgment calls
- **prohibitions**: what **not** to do, especially the tempting wrong move
- **keywords**: the words a user would actually search for

## Improving the toolchain

The reference toolchain is `tools/bin/ody`, pure Python 3.8+ standard library. Keep it dependency-free — the whole point is that anyone can run it offline.

Reproducible builds matter: `ody build` supports `SOURCE_DATE_EPOCH` for byte-identical artifacts.

## Reporting problems

- **Wrong or outdated content** → open an issue with the `pack_id` and `entry_id`
- **Security concerns** → see [SECURITY.md](SECURITY.md)
- **Format/schema questions** → open an issue with the `schema` label

## Ground rules

- Be specific and kind in review; cite the reason, not just the verdict
- Never present unreviewed safety-critical advice as reviewed
- Credit every source; attribution is not optional
