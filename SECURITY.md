# Security Policy

## Scope

This repository contains a **format specification and reference toolchain**. It has no server, no account system, and no runtime service. The toolchain (`tools/bin/ody`) is offline, dependency-free Python.

## Reporting a vulnerability

Please report security issues **privately** before public disclosure:

- Open a private security advisory on GitHub (Security → Advisories → Report a vulnerability), or
- Email the maintainers listed in the repository profile

Please include:
- What is affected (toolchain, schema, example content)
- How to reproduce it
- What the impact could be

We aim to acknowledge reports within 72 hours.

## Trust and safety model

The format is designed so that **content trust is explicit and human-controlled**:

- `review.status` can only be raised by humans; the builder never auto-promotes content.
- Medical content (`MEDICAL_ADVISORY`) is **always** emitted as `PENDING_MEDICAL_REVIEW` / `ADVISORY_ONLY`. There is intentionally no code path that marks medical content as reviewed.
- Every entry must resolve to a real source; the builder rejects unresolvable lineage.
- Artifact integrity uses SHA-256 recorded in the manifest, verified by `ody inspect --verify`.

## Things we consider vulnerabilities

- A way to make the builder emit content with a higher trust level than declared
- A way to bypass the medical content gates
- A way to make the builder write unresolvable or falsified lineage into a manifest
- Path traversal or code execution via a malicious pack source file or pack artifact

## Things that are not vulnerabilities

- Content in example packs being illustrative rather than authoritative (they are marked `technical_demo`)
- The medical review gates being strict (this is intentional)
- A pack's `review.status` being low (that is information, not a flaw)

## Secrets

No credentials, tokens or keys belong in this repository. If you find one, treat it as a vulnerability and report it privately.
