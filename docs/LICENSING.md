# Licensing Model

One sentence governs this project:

> **Make the format open. Protect the brand. Build the business around trust.**

The format is meant to become a standard. Standards win by adoption, so the
format license must never stand in the way of adoption. Protection lives at the
layers where it actually belongs: content provenance, brand, and official
certification.

## The five layers

| Layer | What | License | Commercial use? |
|---|---|---|---|
| 1. Format & toolchain | `ody` CLI, JSON schemas, docs | **Apache-2.0** | Yes, explicitly welcome |
| 2. Knowledge pack content | Entries, sources, knowledge packs | **Per pack, declared by the author** | Depends on the pack's license |
| 3. Mission bundles | Bundle definitions | **Per bundle, declared by the author** | Depends on the bundle's license |
| 4. Brand & certification marks | ODY name, logo, "Official ODY" | **Trademark law** (see [TRADEMARKS.md](../TRADEMARKS.md)) | Permission required |
| 5. ODY app & premium missions | The product around the format | **Separately licensed** | Business model of the project |

Layer 1 is why a navigation vendor, a university, or an outdoor device maker can
adopt the format tomorrow. That is the goal — every adopter makes the ecosystem
more valuable for everyone, including ODY.

## Rule 2 is the important one

**The Apache-2.0 license of the builder never applies to the content.**

A tool's license does not travel with what the tool processes. If someone
scrapes content into a pack, the original content's license and rights remain
untouched. Therefore every pack MUST declare:

- `license_policy` — the content license of the pack (use an [SPDX identifier](https://spdx.org/licenses/)
  where possible, e.g. `CC-BY-4.0`, `CC-BY-SA-4.0`, `CC-BY-NC-SA-4.0`, `LicenseRef-...`
  for custom terms)
- per source: `license_status` (what the source's license is) and `allowed_use`
  (what that license permits for redistribution)

The builder rejects packs with missing or empty license declarations. A pack
without a declared license is not buildable.

## Rules for pack authors

1. Only submit content you have the right to redistribute under the declared
   license. Cite the source; if the source's license does not permit
   redistribution, the content does not belong in a pack.
2. Declare the license honestly. If a pack mixes sources with different
   licenses, declare the most restrictive one or split the pack.
3. Remember that share-alike licenses (SA) and non-commercial licenses (NC)
   affect downstream users of *your pack content* — choose deliberately.
4. Review status and license are different axes: `expert_reviewed` content under
   `CC-BY-NC-SA-4.0` is reviewed but non-commercial; `technical_demo` content
   under `CC-BY-4.0` is freely reusable but not vouched for.

## Why not restrict the format license itself

A non-commercial format license would block competitors, but it would also
block partners, researchers, device makers and most open-source adoption. The
format would stop being a standard and become just another app's private file
type. The competitive advantage of ODY does not live in exclusive ownership of
a JSON schema — it lives in the combination of brand, official distribution,
reviewed content, trust, community, and the ODY application itself.

## Choosing a license for ODY's own core packs

There is **no project-wide default content license**. Each pack is a deliberate
decision, because the trade-offs are real:

| Route | Blocks resale by others | Enables ODY premium bundles & partner deals | Trade-off |
|---|---|---|---|
| Permissive (e.g. `CC-BY-4.0`) | no | yes | maximum adoption; protection lives in brand, registry and trust instead |
| Non-commercial (e.g. `CC-BY-NC-SA-4.0`) | mostly | **no** | also blocks ODY's own commercial use; "non-commercial" is notoriously ambiguous |
| Proprietary content license / dual licensing | yes (commercial reuse) | yes | precise instrument for fully self-created content: free for community use, paid for commercial redistribution |

A non-commercial license is a content-level shield with a business cost — it
should not be applied to core packs by default, because it would later block
exactly the premium bundles and commercial partner integrations the product
model builds on. For **fully self-created content**, proprietary licensing or
dual licensing is usually the sharper instrument. For **third-party sources**,
the source's license must permit redistribution under the declared license —
no pack-level choice can override that.

## FAQ

**Can someone fork the toolchain and sell it?**
Yes. That is what Apache-2.0 means. They cannot call it ODY, cannot use the
logo, and cannot claim official certification. If the market rewards them,
that validates the format — and the format is where the ecosystem value lives.

**Can someone sell my pack content?**
Only if your pack's license allows it. A permissive license allows it; a
non-commercial or proprietary/dual license blocks it. See
[Choosing a license for ODY's own core packs](#choosing-a-license-for-odys-own-core-packs).

**Can someone run a paid SaaS on the toolchain?**
Yes, under Apache-2.0. They cannot use the ODY brand or official certification
marks.

**Is "ODY-compatible" usable by anyone?**
Yes, for truthful interoperability statements. See
[CERTIFICATION.md](CERTIFICATION.md).
