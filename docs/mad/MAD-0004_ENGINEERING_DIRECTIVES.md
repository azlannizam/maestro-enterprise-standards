# MAD-0004: Engineering Directives

| Field | Value |
|---|---|
| MAD ID | MAD-0004 |
| Title | Engineering Directives |
| Status | Accepted |
| Date | 2026-07-13 |
| Owner | Enterprise Standards Board |
| Scope | Engineering direction, agent assignment, organizational communication |
| MES Cross-References | MES-001 MR-2, MR-3, MR-5; MES-401 MR-1 to MR-11 |

## Context

Maestro-governed work often begins with a human-issued direction to an AI
agent. If that direction is informal, recipient-less, or missing authority and
constraints, agents may infer scope differently, perform work outside their
role, or lose traceability to the governing work package, review, decision, or
milestone.

MES-401 requires clear role assignment and separation of duties. MES-001
requires explicit assumptions, evidence for significant claims, and standards
over conflicting prompts. MAD-0001 makes repository records authoritative
institutional memory. MAD-0002 prevents the CEO from becoming the courier
between agents. Engineering Directions must support those rules rather than
behave as casual chat prompts.

## Decision

Every Engineering Direction must explicitly identify:

1. Recipient
2. Authority
3. Mission
4. Constraints
5. Deliverables

Engineering Directions are organizational communication artifacts, not informal
chat prompts.

## Accepted Permanent Rules

1. Every Engineering Direction MUST name one primary recipient.
2. Valid recipients may include Claude, Codex, Orion, Maestro, Abu Nawas, or
   future governed agents after their role is defined.
3. Recipient-less or ambiguous Engineering Directions are invalid.
4. The recipient is responsible only for work inside the stated mission and
   constraints.
5. The Authority section MUST name the governing standard, work package,
   review, decision, milestone, or repository artifact where applicable.
6. The Mission section MUST state the concrete objective.
7. The Constraints section MUST state relevant limits, including whether code,
   implementation repositories, deployment, or specification changes are
   authorized.
8. The Deliverables section MUST state expected outputs and required commit or
   reporting behavior.
9. If a directive conflicts with MES or an accepted MAD, MES and the MAD govern;
   the conflict must be flagged rather than silently reconciled.

## Consequences

- Agent assignments become explicit before work begins.
- Reviewers can verify whether an agent stayed inside the directed mission.
- Future agents can trace work back to a governing authority instead of relying
  on chat context.
- Ambiguous instructions must be clarified or reissued before governed work
  proceeds.
- Engineering Directions can be audited as part of the institutional memory of
  a work package, review, decision, or milestone.

## Non-Goals

- This MAD does not define a full AI communication protocol.
- This MAD does not create product-specific rules.
- This MAD does not change MES role definitions.
- This MAD does not require every casual message to become an Engineering
  Direction.
- This MAD does not authorize any application implementation or deployment.

## Review Notes

This decision extends MES-401 role clarity into the direction format used to
start governed work. It supports MAD-0001 by making directions durable and
traceable when captured in repository artifacts, and supports MAD-0002 by
reducing manual relay and ambiguity between agents.
