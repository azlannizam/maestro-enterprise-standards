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
| [MAD-0005](MAD-0005_ORION_STUDIO_AND_RUNTIME.md) | Orion Studio and Runtime | **Superseded** by MAD-0010 | 2026-07-13 | MES-001 MR-2, MR-3; MES-401 MR-1, MR-2, MR-8, MR-10, MR-11 |
| [MAD-0006](MAD-0006_DRIVE_SYNC_BRIDGE.md) | Google Drive Institutional Memory Bridge | Accepted | 2026-07-13 | MES-001 MR-2, MR-3; MES-401 MR-8, MR-10 |
| [MAD-0007](MAD-0007_AI_SESSION_LIFECYCLE.md) | AI Session Lifecycle | Accepted | 2026-07-13 | MES-001 MR-2, MR-3, MR-5; MES-401 MR-1, MR-8, MR-10, MR-11 |
| [MAD-0008](MAD-0008_ENGINEERING_AGENT_TRANSPORT_INDEPENDENCE.md) | Engineering Agent Transport Independence | Accepted | 2026-07-13 | MES-001 MR-2, MR-3, MR-5; MES-401 MR-1, MR-11 |
| [MAD-0009](MAD-0009_ENGINEERING_MODEL_SELECTION_POLICY.md) | Engineering Model Selection Policy | Accepted | 2026-07-13 | MES-001 MR-2, MR-3, MR-5; MES-401 MR-1, MR-11 |
| [MAD-0010](MAD-0010_ORION_STUDIO_AS_EXECUTIVE_OPERATING_SYSTEM.md) | Orion Studio as the Executive Operating System | Accepted | 2026-07-14 | MES-001 MR-2, MR-3; MES-401 MR-1, MR-7, MR-11 |
| [MAD-0011](MAD-0011_EXECUTIVE_INTELLIGENCE_EXECUTION_INTELLIGENCE_BOUNDARY.md) | Executive Intelligence / Execution Intelligence Boundary | Accepted | 2026-07-14 | MES-001 MR-2, MR-4; MES-401 MR-1, MR-7, MR-11 |
| [MAD-0012](MAD-0012_EXECUTIVE_ORDERS.md) | Executive Orders | Accepted | 2026-07-14 | MES-001 MR-2, MR-3, MR-4; MES-401 MR-1, MR-7, MR-11 |

## Governance Actions — OR-A1 Acceptance (2026-07-14)

Independent review: **ORR-OR-A1-MAD-0010-0012**, commit
`c29aa0c4e25682f056089b3b31d41bebed6e0232` — recommended Accept (all three,
accept-with-advisories; no blocking findings). **CEO acceptance: 2026-07-14** —
final authority action for MAD-0010, MAD-0011, MAD-0012.

Registry actions taken as a result (per MAD-INDEX Maintenance Rule 3):

1. MAD-0010, MAD-0011, MAD-0012 — status Proposed → **Accepted**; moved from
   "Proposed MADs" into "Active MADs" above.
2. MAD-0005 — status Accepted → **Superseded** (superseded by MAD-0010);
   historical content preserved in `MAD-0005_ORION_STUDIO_AND_RUNTIME.md`.
3. Review advisories resolved in the MAD text itself: F-10.1 (MAD-0005
   carry-forward/retirement table, in MAD-0010), F-10.2 (MES-401 MR-7
   cross-reference, in MAD-0010), F-11.1 (Orion write-exception wording, in
   MAD-0011), F-12.1 (Maestro Gateway implementation gate, in MAD-0012).
4. **OR-I1 governance gate (OWP-0001 §3) is now satisfied.** OR-I1 is
   authorizable subject to its own OWP and MES-101/102/103 (and, for the seam
   build, MAD-0012's Implementation Gate on the Maestro CEO Approval Gateway).

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
