# MILESTONE-0003: Engineering Model Selection Policy Established

| Field | Value |
|---|---|
| Milestone ID | MILESTONE-0003 |
| Title | Engineering Model Selection Policy Established |
| Status | Completed |
| Completion Date | 2026-07-14 |
| Project | Maestro Governance |
| Governance Repository | `maestro-enterprise-standards` |
| MES Authority | MES-001, MES-401 |

## Summary

Maestro accepted MAD-0009, establishing an advisory Engineering Model Selection
Policy for every engineering mission addressed to Claude.

The decision requires each mission to declare a `Recommended Model` field
(`Opus` or `Sonnet`), matching model capability to work type: Opus for
deep-reasoning work (MAD/MWP creation, architecture design and review, major
refactoring design, complex trade-off and cross-system analysis), Sonnet for
bounded execution (implementation, corrections, tests, documentation, MCR
implementation, routine engineering).

This milestone records that Maestro governance now treats AI model selection as
an explicit, auditable mission-header decision rather than implicit operator or
in-session judgment.

## Scope Completed

| Scope Area | Result |
|---|---|
| Architecture Decision | MAD-0009 authored and accepted. |
| Decision Register | MAD-INDEX updated with MAD-0009 row. |
| Policy Nature | Advisory only; governance, authority, boundaries, and acceptance gates unchanged. |
| Institutional Memory | Committed and pushed to `maestro-enterprise-standards` main. |

## Governance Chain Used

1. MES Constitution (MES-001) established standards precedence and institutional
   memory discipline.
2. MES-401 established AI agent governance, role clarity, and mission
   discipline.
3. MAD-0004 established Engineering Directions as organizational communication
   artifacts.
4. MAD-0007 established the precedent of an explicit organizational header field
   (Session Type) on engineering missions.
5. MAD-0009 added the advisory `Recommended Model` field, extending the mission
   header without altering authority or acceptance.

## Referenced Artifacts

| Artifact | Role |
|---|---|
| `docs/mad/MAD-0009_ENGINEERING_MODEL_SELECTION_POLICY.md` | Accepted decision defining the advisory model selection policy. |
| `docs/mad/MAD-INDEX.md` | Decision register listing MAD-0009. |
| `maestro-enterprise-standards` commit `eda0c7aa51bd719e83b9a184090edef6c6aa3076` | Commit accepting MAD-0009 and updating the MAD index. |

## Decision Established

MAD-0009 proves that Maestro can add mission-shaping guidance without expanding
or weakening governance. The policy:

- requires every engineering mission to Claude to declare `Recommended Model`;
- steers deep-reasoning work toward Opus and bounded execution toward Sonnet;
- remains advisory to the operator;
- does not modify governance, engineering authority, boundaries, or acceptance
  gates;
- introduces no automatic model switching, runtime selection, cost logic, or
  vendor-specific behavior.

Engineering authority remains MES + MAD + MWP + MRP.

## Historical Significance

MILESTONE-0001 proved Maestro could govern a production feature from idea to
operational acceptance. MILESTONE-0002 proved Maestro could govern a
conversational capability without letting it become unbounded chat.

MILESTONE-0003 records the first governance decision that tunes how missions are
issued to AI engineering agents — matching model capability to work type — while
keeping authority and acceptance discipline unchanged.

## Completion Record

Completion date: 2026-07-14.

Final record: MAD-0009 established an advisory Engineering Model Selection Policy
requiring every engineering mission to Claude to declare a `Recommended Model`,
accepted and recorded in durable institutional memory with no change to
governance or acceptance gates.

No application code or infrastructure behavior is modified by this milestone
record. This document records history only.
