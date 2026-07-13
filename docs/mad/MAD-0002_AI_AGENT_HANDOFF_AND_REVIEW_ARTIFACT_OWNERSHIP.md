# MAD-0002: AI Agent Handoff and Review Artifact Ownership

| Field | Value |
|---|---|
| MAD ID | MAD-0002 |
| Title | AI Agent Handoff and Review Artifact Ownership |
| Status | Accepted |
| Date | 2026-07-13 |
| Owner | AI Governance Owner |
| Scope | AI-agent handoffs, review artifacts, review workflow |
| MES Cross-References | MES-001 MR-2, MR-3; MES-102; MES-401 MR-1 to MR-11 |

## Context

MES-401 separates human ownership, architecture/governance, implementation, and
independent review. In practice, multi-agent work can degrade if the human CEO
is forced to relay artifacts, instructions, or review outputs between agents.
That creates avoidable manual courier work, increases context loss, and weakens
evidence trails.

MES-102 also requires review reports to be decisive and evidence-based. A review
artifact is part of the reviewer's work product; it should be owned by the
reviewing agent, not reconstructed later by another party.

## Decision

The CEO must never become the courier between AI agents.

Reviewing agents own their review artifacts. When a review produces a durable
artifact, the reviewing agent is responsible for writing and committing that
artifact, subject to the same repository permissions and review discipline as
any other documentation change.

Future reviews should be delta-based where possible: reviewers should compare
against the prior reviewed baseline and focus on the changes since that point,
unless the risk or request requires a full re-review.

## Accepted Permanent Rules

1. The CEO sets direction and accepts outcomes, but does not act as the
   transport layer between agents.
2. Agents must leave handoff state in repository artifacts, commits, or other
   durable project records.
3. Review agents own and commit their own review artifacts when asked to produce
   durable review documentation.
4. Review reports must remain evidence-based and satisfy MES-102.
5. Follow-up reviews should be delta-based where possible, anchored to the
   previous reviewed commit or artifact.
6. If a delta review is insufficient, the reviewer must state why and perform
   the broader review required.

## Consequences

- Review artifacts such as MRP reports are not merely chat responses when they
  are needed later; they belong in the appropriate repository.
- The reviewing agent records its own findings, closure notes, and approval
  recommendations.
- Human time is reserved for judgment and acceptance, not mechanical context
  transfer.
- Delta reviews become the default for follow-up review cycles, reducing
  repeated full-context review while preserving accountability.

## Non-Goals

- This MAD does not remove CEO accountability under MES-401 MR-1.
- This MAD does not allow a reviewing agent to approve its own implementation.
- This MAD does not require delta review when a full review is safer.

## Review Notes

This decision extends MES-401 separation of duties into durable artifact
ownership. It also operationalizes MES-102 by making the review report a
first-class deliverable owned by the reviewer.
