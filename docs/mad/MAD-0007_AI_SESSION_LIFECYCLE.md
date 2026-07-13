# MAD-0007: AI Session Lifecycle

| Field | Value |
|---|---|
| MAD ID | MAD-0007 |
| Title | AI Session Lifecycle |
| Status | Accepted |
| Date | 2026-07-13 |
| Owner | AI Governance Owner |
| Scope | AI session lifecycle management for governed Engineering Directions |
| MES Cross-References | MES-001 MR-2, MR-3, MR-5; MES-401 MR-1, MR-8, MR-10, MR-11 |

## Context

Maestro-governed work often spans multiple AI conversations, repositories,
review stages, operational gates, and implementation threads. Without an
explicit lifecycle declaration, agents may preserve stale assumptions from a
previous conversation, reload repositories unnecessarily, or blur the boundary
between distinct work packages.

MAD-0004 defines Engineering Directions as organizational communication
artifacts. MAD-0005 separates conversational design context from operational
runtime context. MAD-0006 creates a durable institutional-memory bridge so AI
agents can re-establish authority from approved records rather than informal
chat memory. MES-401 requires agents to state assumptions, provide evidence for
claims, and stay within assigned roles.

Session lifecycle selection must therefore be governed explicitly. It is an
organizational decision about context quality, governance clarity, and token
efficiency, not an implementation detail inside an individual agent session.

## Decision

Every Engineering Direction must declare one supported session type immediately
after the recipient:

1. NEW
2. CONTINUE

Each declaration must include a rationale for the session choice.

NEW begins a new bounded work package and re-establishes authority from durable
institutional memory. CONTINUE preserves active bounded context for ongoing
reasoning or implementation continuity.

## NEW

**Purpose:**

- Begin a new bounded work package.
- Reduce accumulated token usage.
- Prevent context pollution.
- Re-establish authority from durable institutional memory.
- Avoid assumptions carried from previous conversations.

**Typical use cases:**

- New work package.
- New repository.
- New review stage.
- Architecture change.
- Operational stage.
- Independent audit.

**Requirements:**

Every Engineering Direction using NEW must explicitly state:

- `Session Type: NEW`
- Reason for starting a new session.

## CONTINUE

**Purpose:**

- Preserve active bounded context.
- Continue ongoing reasoning.
- Avoid unnecessary repository reload.
- Maintain implementation continuity.

**Typical use cases:**

- Same work package.
- Same implementation.
- Same review.
- Same operational gate.
- Active debugging.
- Follow-up within the same bounded scope.

**Requirements:**

Every Engineering Direction using CONTINUE must explicitly state:

- `Session Type: CONTINUE`
- Reason for continuing the existing session.

## Accepted Permanent Rules

1. Every Engineering Direction MUST declare its Session Type.
2. The Session Type MUST appear immediately after the recipient.
3. Every Session Type declaration MUST include a rationale.
4. Session selection is an organizational decision, not an implementation
   detail.
5. NEW and CONTINUE are the only valid session types unless a future MAD
   introduces additional lifecycle states.
6. Engineering Directions should prefer NEW when beginning a distinct governed
   work package unless there is a clear benefit to preserving bounded context.
7. The choice of session type should optimize context quality, governance
   clarity, and token efficiency.

## Consequences

- Engineering Directions become clearer about context boundaries before work
  begins.
- Agents can avoid carrying unverified assumptions across independent governed
  work packages.
- Durable institutional memory remains the authority for NEW sessions.
- Active implementation, review, debugging, and operational context can be
  preserved when CONTINUE is justified.
- Session lifecycle choices become auditable governance decisions.

## Non-Goals

- This MAD does not define model routing, prompt content, tool grants, or
  vendor-specific session mechanics.
- This MAD does not authorize implementation, deployment, repository mutation,
  or production access by itself.
- This MAD does not change MES-401 role assignments or separation-of-duties
  requirements.
- This MAD does not require casual non-governed conversation to use Engineering
  Direction format.

## Review Notes

This decision extends MAD-0004 by adding an explicit lifecycle field to
Engineering Directions. It supports MAD-0005 by keeping Studio and Runtime
context boundaries deliberate, supports MAD-0006 by requiring NEW sessions to
re-establish authority from durable institutional memory, and supports MES-401
by improving role clarity, assumptions disclosure, evidence discipline, and
context containment.
