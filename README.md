# Maestro Enterprise Standards (MES)

**Version:** 1.0.0 · **Status:** Active · **Effective Date:** 2026-07-12

The Maestro Enterprise Standards (MES) is the version-controlled governance and
standards repository that defines **how AI agents and humans collaborate to
build software** across the enterprise.

MES is a product in its own right. It is **not** the Maestro application, and it
contains **no** application code. It defines *how we work* — not *how any
particular product is built*.

MES governs the way we deliver every project, including:

- Maestro
- PIP
- Solo
- Kaizen
- Butler
- …and future projects

---

## Design Principles

1. **Standards are version-controlled.** Every standard has an ID, a version, and a history.
2. **Standards are reusable.** They apply across many products, not one.
3. **Standards are product-agnostic.** They never encode a single product's implementation.
4. **Standards describe *how* we work**, not *how* a specific product is built.
5. **Product-specific rules live in product repositories**, never in MES.
6. **Prefer clarity over completeness.**
7. **Avoid overengineering.**

---

## Repository Structure

```
maestro-enterprise-standards/
├── README.md                 # This file
├── CHANGELOG.md              # Chronological record of MES changes
├── LICENSE.md                # Usage and licensing terms
├── MES_REGISTRY.md           # Authoritative index of all standards
│
├── 00-foundation/            # 000 — Foundational governance
│   └── MES-001_ENTERPRISE_CONSTITUTION.md
│
├── 10-engineering/           # 100 — Engineering practice
│   ├── MES-101_IMPLEMENTATION_STANDARD.md
│   ├── MES-102_CODE_REVIEW_STANDARD.md
│   ├── MES-103_MILESTONE_COMPLETION_STANDARD.md
│   └── MES-104_DEPLOYMENT_STANDARD.md
│
├── 40-ai/                    # 400 — AI governance
│   └── MES-401_AI_AGENT_GOVERNANCE.md
│
├── templates/                # Reusable authoring templates
│   └── MES-XXX_STANDARD_TEMPLATE.md
│
└── examples/                 # Worked examples of standards in practice
    └── README.md
```

---

## Standard Numbering

Standards are grouped into numeric bands by category. Each band reserves 100
IDs, leaving ample room to grow.

| Band | Category | Directory |
|------|----------|-----------|
| 000 | Foundation | `00-foundation/` |
| 100 | Engineering | `10-engineering/` |
| 200 | Product | `20-product/` |
| 300 | Security | `30-security/` |
| 400 | AI Governance | `40-ai/` |
| 500 | Documentation | `50-documentation/` |
| 600 | Operations | `60-operations/` |
| 700 | Data | `70-data/` |
| 800 | UX | `80-ux/` |
| 900 | Reserved | — |

---

## Anatomy of a Standard

Every MES standard carries a metadata header with these fields:

`Standard ID` · `Title` · `Version` · `Status` · `Owner` · `Category` ·
`Effective Date` · `Supersedes` · `Applies To` · `Dependencies` ·
`Last Reviewed`

And every standard follows the same ten sections:

1. Purpose
2. Scope
3. Principles
4. Mandatory Requirements
5. Recommended Practices
6. Exceptions
7. Deliverables
8. Checklist
9. References
10. Version History

Use `templates/MES-XXX_STANDARD_TEMPLATE.md` to author new standards.

---

## Status Lifecycle

| Status | Meaning |
|--------|---------|
| **Draft** | Under authoring; not yet binding. |
| **Active** | Approved and enforceable. |
| **Superseded** | Replaced by a newer standard; retained for history. |
| **Deprecated** | No longer recommended; slated for removal. |
| **Retired** | Withdrawn; kept only for the archival record. |

---

## Versioning

MES as a whole and each standard within it follow [Semantic Versioning](https://semver.org/):

- **MAJOR** — breaking change to a requirement teams must act on.
- **MINOR** — new standard or backward-compatible requirement added.
- **PATCH** — clarification, typo, or non-normative edit.

The repository version is recorded in `CHANGELOG.md`.

---

## Contributing

1. Copy the template and draft the new standard in the correct category directory.
2. Assign the next available ID within the category band.
3. Register it in `MES_REGISTRY.md`.
4. Record the change in `CHANGELOG.md`.
5. Submit for review under **MES-102 Code Review Standard**.

---

## Precedence

Where a standard and a prompt, ticket, or convenience conflict, **the standard
prevails** (see MES-001, Enterprise Constitution). Exceptions must be explicit,
documented, and time-bound.
