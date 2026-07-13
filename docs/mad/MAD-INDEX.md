# Maestro Architecture Decision Index

This index is the authoritative register of Maestro Architecture Decisions
(MADs). MADs record permanent governance and architecture decisions that shape
how Maestro and MES-governed agents operate.

MADs complement MES standards:

- MES documents define binding standards and process requirements.
- MADs record accepted decisions, rationale, and consequences.
- When a MAD creates a reusable rule broad enough to become a standard, promote
  it through the MES standard process and cross-link the resulting MES update.

## Active MADs

| MAD | Title | Status | Date | MES Cross-References |
|---|---|---|---|---|
| [MAD-0001](MAD-0001_REPOSITORY_INSTITUTIONAL_MEMORY.md) | Repository Institutional Memory | Accepted | 2026-07-13 | MES-001 MR-2, MR-3; MES-401 MR-8, MR-10 |
| [MAD-0002](MAD-0002_AI_AGENT_HANDOFF_AND_REVIEW_ARTIFACT_OWNERSHIP.md) | AI Agent Handoff and Review Artifact Ownership | Accepted | 2026-07-13 | MES-001 MR-2, MR-3; MES-102; MES-401 MR-1 to MR-11 |
| [MAD-0003](MAD-0003_ENVIRONMENT_OWNERSHIP_AND_STAGING.md) | Environment Ownership and Staging | Accepted | 2026-07-13 | MES-001 MR-4; MES-104; MES-401 MR-1, MR-2, MR-11 |
| [MAD-0004](MAD-0004_ENGINEERING_DIRECTIVES.md) | Engineering Directives | Accepted | 2026-07-13 | MES-001 MR-2, MR-3, MR-5; MES-401 MR-1 to MR-11 |
| [MAD-0005](MAD-0005_ORION_STUDIO_AND_RUNTIME.md) | Orion Studio and Runtime | Accepted | 2026-07-13 | MES-001 MR-2, MR-3; MES-401 MR-1, MR-2, MR-8, MR-10, MR-11 |
| [MAD-0006](MAD-0006_DRIVE_SYNC_BRIDGE.md) | Google Drive Institutional Memory Bridge | Accepted | 2026-07-13 | MES-001 MR-2, MR-3; MES-401 MR-8, MR-10 |

## Status Legend

| Status | Meaning |
|---|---|
| Proposed | Candidate decision, not binding. |
| Accepted | Binding decision for Maestro-governed work. |
| Superseded | Replaced by a later MAD or MES standard. |
| Deprecated | Retained for history but no longer recommended. |

## Index Maintenance Rules

1. Every MAD MUST be listed here.
2. The next MAD ID is the next unused four-digit number.
3. MADs MUST be committed to this repository when accepted.
4. Chat or issue discussion is not institutional memory until captured in this
   repository.
