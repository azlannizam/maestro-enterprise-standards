# MES Registry

The authoritative index of all Maestro Enterprise Standards. Every standard MUST
appear here. This registry is the single source of truth for what standards
exist, their status, and their ownership.

**Registry Version:** 1.0.0 · **Last Updated:** 2026-07-12

---

## Active Standards

| Standard ID | Title | Version | Status | Category | Owner | Approval Date |
|-------------|-------|---------|--------|----------|-------|---------------|
| [MES-001](00-foundation/MES-001_ENTERPRISE_CONSTITUTION.md) | Enterprise Constitution | 1.0.0 | Active | Foundation (000) | Enterprise Standards Board | 2026-07-12 |
| [MES-101](10-engineering/MES-101_IMPLEMENTATION_STANDARD.md) | Implementation Standard | 1.0.0 | Active | Engineering (100) | Engineering Practice Owner | 2026-07-12 |
| [MES-102](10-engineering/MES-102_CODE_REVIEW_STANDARD.md) | Code Review Standard | 1.0.0 | Active | Engineering (100) | Engineering Practice Owner | 2026-07-12 |
| [MES-103](10-engineering/MES-103_MILESTONE_COMPLETION_STANDARD.md) | Milestone Completion Standard | 1.0.0 | Active | Engineering (100) | Engineering Practice Owner | 2026-07-12 |
| [MES-104](10-engineering/MES-104_DEPLOYMENT_STANDARD.md) | Deployment Standard | 1.0.0 | Active | Engineering (100) | Operations Owner | 2026-07-12 |
| [MES-401](40-ai/MES-401_AI_AGENT_GOVERNANCE.md) | AI Agent Governance | 1.0.0 | Active | AI Governance (400) | AI Governance Owner | 2026-07-12 |

---

## Category Bands

| Band | Category | Directory | Standards in Use |
|------|----------|-----------|------------------|
| 000 | Foundation | `00-foundation/` | MES-001 |
| 100 | Engineering | `10-engineering/` | MES-101, MES-102, MES-103, MES-104 |
| 200 | Product | `20-product/` | — |
| 300 | Security | `30-security/` | — |
| 400 | AI Governance | `40-ai/` | MES-401 |
| 500 | Documentation | `50-documentation/` | — |
| 600 | Operations | `60-operations/` | — |
| 700 | Data | `70-data/` | — |
| 800 | UX | `80-ux/` | — |
| 900 | Reserved | — | — |

---

## Status Legend

| Status | Meaning |
|--------|---------|
| Draft | Under authoring; not yet binding. |
| Active | Approved and enforceable. |
| Superseded | Replaced by a newer standard; retained for history. |
| Deprecated | No longer recommended; slated for removal. |
| Retired | Withdrawn; kept only for the archival record. |

---

## Registry Rules

1. Every standard MUST be registered here before it is considered Active.
2. The next available ID within a band is `highest_used + 1`.
3. When a standard changes status, update this registry and `CHANGELOG.md` in
   the same change.
4. A superseded standard remains listed with its final version and a pointer to
   its successor.
