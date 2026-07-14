# MAD-0014: Subscription-First AI Transport Policy

| Field | Value |
|---|---|
| MAD ID | MAD-0014 |
| Title | Subscription-First AI Transport Policy |
| Status | Proposed |
| Date | 2026-07-14 |
| Owner | Architecture Owner |
| Scope | Orion Runtime — the Model Adapter boundary between Orion and AI providers, for personal deployment |
| MES Cross-References | MES-001 MR-2, MR-3, MR-4, MR-5; MES-401 MR-1, MR-11 |
| Related | OOM-0001; OAR-0001; OWP-0001; MAD-0008 (transport independence — the execution-layer analogue); MAD-0009 (model selection policy); MAD-0011 (Executive/Execution boundary); MAD-0013 (deterministic reasoning and model-independent rendering) |

## Context

Orion is the CEO's personal Executive Intelligence Platform (`OOM-0001`). For
Orion's personal deployment, the owner already maintains paid subscriptions to
multiple AI providers. Routing Orion's reasoning traffic through metered API
transports by default would incur avoidable cost on capacity the owner already
owns, and would quietly couple Orion's runtime to whichever provider's API
happens to be wired in first.

MAD-0013 established that Orion's reasoning is authoritative and that natural-
language generation is a replaceable presentation concern reached only through
an Executive Response Renderer port — the reasoning core does not know which
model or vendor voices it. MAD-0008 established the mirror principle one layer
below, in Maestro: engineering Agent Adapters depend only on a Transport
interface, with CLI transports as the primary, subscription-backed
implementation and API transports as an optional fallback.

This MAD applies that same discipline to Orion's own connection to AI
providers. It fixes, permanently, that **provider** (whose model reasons) and
**transport** (how Orion reaches that model) are separate concerns, and that
for personal deployment the default transport is the one that uses
subscriptions the owner already pays for — not the one that bills per token.

## Decision

Orion Runtime SHALL communicate with AI providers through a Model Adapter
abstraction, in which transport selection is policy-driven and defaults to
subscription-backed CLI transport.

1. **Orion Runtime communicates with AI providers only through a Model
   Adapter.** No component of Orion Runtime or Orion Studio calls a provider
   directly.

2. **Provider and Transport are separate concerns.** A Provider identifies
   whose model reasons. A Transport identifies the mechanism used to reach
   that model. The two vary independently.

   Provider examples: Anthropic, OpenAI, Google, xAI, local models, future
   providers.

   Transport examples: CLI, API, local runtime, future transport.

3. **CLI transports are first-class citizens.** Supported examples include the
   Claude CLI and the OpenAI/Codex CLI. Future CLI transports may be added
   without architectural change — they are new implementations of the same
   Transport interface, not new architecture.

4. **Subscription-backed CLI transport is the default transport for personal
   deployments.** This default exists to use subscriptions the owner already
   holds, minimize API cost, and preserve provider independence.

5. **API transports remain optional.** They exist for enterprise deployments,
   SaaS deployments, unattended automation, fallback, and providers without a
   CLI transport. API transports are never removed from the architecture —
   they are simply not the default for personal use.

6. **Neither Orion Studio nor Orion Runtime may depend directly on any
   provider implementation.** Only the Model Adapter may know transport
   details. This mirrors MAD-0013's rule that the reasoning core does not know
   which Renderer, model, or surface is in use — the same ignorance now
   extends to which provider and transport carries the request.

7. **Transport selection is policy-driven.** The default policy: prefer
   authenticated CLI transport; fall back to API only when configured or
   required. Policy is data the Model Adapter consults, not a hardcoded path.

8. **Executive reasoning remains provider-independent.** Changing provider or
   transport MUST NOT alter Orion's architecture, the Executive Decision
   schema (MAD-0013), or any other runtime engine.

## Accepted Permanent Rules

1. Orion Runtime MUST reach AI providers only through a Model Adapter; no
   other component may call a provider directly.
2. Provider selection and Transport selection MUST remain independently
   variable — a Provider change MUST NOT require a Transport change, and vice
   versa.
3. CLI transports MUST be supported as first-class citizens; adding a future
   CLI transport MUST NOT require architectural change.
4. Subscription-backed CLI transport MUST be the default transport for
   personal deployments.
5. API transports MUST remain available as optional implementations of the
   same Model Adapter contract — never removed, never the forced default for
   personal deployment.
6. Only the Model Adapter may hold transport or provider implementation
   detail; Orion Studio and Orion Runtime MUST NOT depend on either directly.
7. Transport selection MUST be policy-driven, with a default policy of
   preferring authenticated CLI transport and falling back to API only when
   configured or required.
8. Executive reasoning MUST remain provider-independent; switching provider or
   transport MUST NOT change Orion's architecture or the Executive Decision
   schema.

## Consequences

**Positive**

- Subscription-first operation uses capacity the owner already pays for.
- Lower operating cost for personal deployment.
- Provider independence: no permanent coupling to any single AI vendor.
- Transport independence: CLI and API are interchangeable implementations.
- Future-proof — new providers and transports slot into the same Model
  Adapter contract without touching Orion's reasoning core.

**Negative**

- CLI transports carry an authentication lifecycle (login/session/token
  refresh) that API transports do not.
- Subscription-backed CLI transport requires a local runtime capable of
  driving that CLI.
- CLI-first defaults are unsuitable for large multi-tenant SaaS deployment
  without enabling the API transport.

## Non-Goals

This MAD records an architectural constraint only. It explicitly does not:

- Implement the Model Adapter, any Transport, or any Provider integration.
- Specify routing policy beyond the stated default (prefer CLI, fall back to
  API).
- Select or authorize any specific provider.
- Define multi-model orchestration.

## Review Notes

This decision extends MAD-0008's transport-independence discipline from
Maestro's execution layer to Orion's own connection to AI providers, and
composes with MAD-0013: MAD-0013 keeps *which model voices Orion's reasoning*
a replaceable presentation detail behind the Renderer port; this MAD keeps
*which provider and mechanism carries that model's traffic* a replaceable
detail behind the Model Adapter port. Neither reasoning nor rendering nor
provider nor transport is permanently coupled to any vendor. Independent
review and CEO acceptance are required before this MAD moves from Proposed to
Accepted; no implementation is authorized by this capture.
