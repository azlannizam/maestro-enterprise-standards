# MAD-0008: Engineering Agent Transport Independence

| Field | Value |
|---|---|
| MAD ID | MAD-0008 |
| Title | Engineering Agent Transport Independence |
| Status | Accepted |
| Date | 2026-07-13 |
| Owner | Architecture Owner |
| Scope | Transport abstraction for Maestro engineering-agent orchestration |
| MES Cross-References | MES-001 MR-2, MR-3, MR-5; MES-401 MR-1, MR-11 |

## Context

During RRP implementation it became clear that API-based orchestration would
significantly increase operating cost for long-running software engineering
workloads.

The current subscription-backed CLI tooling provides substantially better
economics while preserving engineering capability.

Therefore the architecture must not couple Agent Adapters to a specific
execution mechanism. RRP-0008 was intentionally paused so this architectural
delta could be captured as durable institutional memory before implementation
continues.

MAD-0005 separates conversational design context from operational runtime
context. The Agent Adapter Framework (MCR-RRP-0004), Claude Adapter
(MCR-RRP-0005), and Codex Adapter (MCR-RRP-0006) define how Maestro dispatches
engineering agents. This MAD constrains how those adapters reach an execution
mechanism, so that cost and vendor decisions remain reversible.

## Decision

Maestro SHALL orchestrate engineering agents through Transport interfaces
rather than depending on a specific execution mechanism.

1. Agent Adapters depend only on a Transport interface.

2. Initial transports:

   **Claude**
   - Claude CLI Transport (Primary)
   - Claude API Transport (Optional)

   **Codex**
   - Codex CLI Transport (Primary)
   - Codex API Transport (Optional)

3. Maestro Runtime MUST remain transport-independent.

4. API transports are optional implementations, never architectural
   requirements.

5. CLI and API transports MUST expose identical contracts.

6. Switching transport MUST NOT require changes to:
   - Workflow Engine
   - CEO Approval Gateway
   - Event Bus
   - Timeline
   - Knowledge Layer
   - Executive Layer

## Accepted Permanent Rules

1. Every engineering Agent Adapter MUST depend only on a Transport interface,
   not on a concrete execution mechanism.
2. CLI transports are the primary implementations; API transports are optional.
3. CLI and API transports for the same agent MUST expose identical contracts.
4. Switching transport MUST NOT require changes to the Workflow Engine, CEO
   Approval Gateway, Event Bus, Timeline, Knowledge Layer, or Executive Layer.
5. The Maestro Runtime MUST remain transport-independent.

## Consequences

**Positive**

- Continue using subscription plans.
- Lower operational cost.
- Vendor independence.
- Future-proof architecture.
- Optional API migration.

**Negative**

- Additional transport implementations.
- Slightly larger abstraction layer.

## Non-Goals

This MAD records an architectural constraint only. It explicitly does not:

- Implement CLI transport.
- Implement API transport.
- Modify adapters.
- Resume RRP-0008.

## Review Notes

This decision supports MAD-0005 by keeping runtime execution boundaries
deliberate, and constrains the Agent Adapter Framework (MCR-RRP-0004) and its
Claude (MCR-RRP-0005) and Codex (MCR-RRP-0006) adapters so vendor and cost
decisions remain reversible. Implementation of any transport and the resumption
of RRP-0008 require separate governed authorization.
