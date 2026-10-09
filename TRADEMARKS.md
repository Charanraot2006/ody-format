# ODY Trademarks

The Apache-2.0 license in this repository covers the **software**. It does **not**
grant any trademark rights. The ODY name, the ODY logo, and the ODY certification
marks are **claimed trademarks** of the ODY project, governed by this policy. They
are **not registered trademarks at this time** — see
[Registration status](#registration-status) below. Where a symbol is used at all,
please use **™**, never ® (® misrepresents registration status and is a protected
sign in Germany).

## What is protected

| Mark | Examples | Protection |
|---|---|---|
| **Project name** | "ODY" | Trademark |
| **Logo** | The ODY logo, with or without text | Trademark + copyright |
| **Certification marks** | "Official ODY", "ODY-reviewed", "ODY certified" | Certification marks — only granted through the official registry |

## Registration status

As of October 2026, these marks are **claimed through use, not registered**.
This is a conscious cost/risk trade-off while adoption is being proven — not an
oversight — and this document deliberately does not suggest otherwise.

What that means in practice:

- Unregistered marks do carry rights in some jurisdictions (protection of
  business identifiers through use in Germany, § 5 MarkenG; common-law
  trademark rights in the US), but enforcement is significantly harder and
  usually geographically limited.
- Germany and the EU are **first-to-file** systems: registration — not first
  use — decides. A third party could file "ODY" first, and opposition or
  cancellation proceedings then cost more than an early registration would have.
- A registration (DPMA word mark: a few hundred euros for up to three classes;
  EUIPO Union mark: from approx. 850 euros) is therefore **planned but deferred**
  until adoption is proven. Note: this is a **trademark** question (Wortmarke),
  not a patent question — patents protect technical inventions and do not apply
  here.

## Interim measures (before registration)

These steps keep the risk low at little or no cost, and all of them also serve
as evidence of first use if a dispute ever arises:

1. **Free availability search** — check DPMAregister, EUIPO TMview and the WIPO
   Global Brand Database for conflicts; archive the result with a date.
2. **Secure the namespace** — the GitHub organization and one or two domains
   (a few euros per year) block the cheapest form of squatting. Same idea on
   package registries (e.g. the PyPI name `ody` was still unclaimed as of
   2026-10-09): a defensive registration costs nothing and prevents dependency
   confusion later.
3. **Document first use** — the date of the first public release (Git history,
   an archive.org snapshot of the repository page) establishes the project's
   reputation timeline.
4. **Consistent ™ usage** — in public documents and screenshots, mark the name
   with ™ wherever a symbol is used.
5. **A defined trigger for registration** — e.g. "first external contributor
   pack, first partner inquiry, a sudden attention spike, or first commercial
   reuse" → file the DPMA application. At that point, a few hundred euros are
   cheap insurance against squatting.

**Case note — OpenClaw (January 2026):** The then fastest-growing open-source
AI assistant was published as open source (MIT) from day one with **no word
mark of its own registered**. When Anthropic asserted its "Claude" mark, the
project renamed twice in three days (Clawdbot → Moltbot → OpenClaw) — and
within days, third parties filed trademark applications for the new name in
other jurisdictions. The project prevailed in part through documented priority
rights (first use), but the chaos and follow-on disputes cost far more than an
early registration would have. Two lessons for us: (1) the registration trigger
must include **sudden attention spikes**, not only partner interest — squatting
moves at viral speed; (2) our position is structurally better than OpenClaw's
was: "ODY" is our own name, with no prior rights holder above us. That is
exactly why a free register search (DPMAregister / TMview / WIPO) before the
public launch matters — OpenClaw's original name collided with an existing
mark from day one, a collision a prior search would have caught.

## What you may do without permission

- Use the word "ODY" in plain text to truthfully refer to this project, its
  software or its format (nominative use), e.g. "built with ody-format" or
  "reads ODY packs".
- State **"ODY-compatible"** to describe that your software or pack passes the
  open validation toolchain (`ody validate` / `ody build` / `ody inspect --verify`),
  provided you do not use the ODY logo and do not imply endorsement.
- Fork the software under Apache-2.0 and use it commercially (that is the point
  of the format license).

## What requires prior written permission

- Using "ODY" (or a confusingly similar name) in your product name, company
  name, app title, domain name or social media handle.
- Using the ODY logo in your product, marketing, packaging or website.
- Using the certification marks "Official ODY", "ODY-reviewed", "ODY certified"
  or any badge that implies official review or endorsement.
- Suggesting that your product, pack or service is endorsed by, affiliated with
  or certified by the ODY project.

## Certification marks

There is deliberately **no self-declared manifest field** that confers official
status. Anyone can write a claim into a JSON file; a certification is only real
if it is listed in the official ODY registry. See [docs/CERTIFICATION.md](docs/CERTIFICATION.md)
for the two-tier model ("ODY-compatible" vs. "Official ODY").

## Scope of this policy

This policy covers trademark use. It does not limit the Apache-2.0 license
grant for the software, and it does not limit the separate content licenses of
knowledge packs (see [docs/LICENSING.md](docs/LICENSING.md)).

## Contact

For trademark permissions or questions, open a discussion in this repository
or contact the maintainers listed in the repository profile.

---

*This document describes the project's trademark policy and is not legal advice.
For registered trademark status in your jurisdiction, consult a trademark attorney.*
