# MAD-0014: Subscription-First AI Transport Policy

| Field | Value |
|---|---|
| MAD ID | MAD-0014 |
| Title | Subscription-First AI Transport Policy |
| Status | Proposed |
| Date | 2026-07-14 |
| Owner | Architecture Owner |
| Scope | Orion Runtime — the Model Adapter boundary between Orion and AI providers, for **inference only**, for personal deployment |
| MES Cross-References | MES-001 MR-2, MR-3, MR-4, MR-5; MES-401 MR-1, MR-11 |
| Related | OOM-0001; OAR-0001; OWP-0001; MAD-0008 (transport independence — the execution-layer analogue, and the engineering Agent Transport this MAD's Orion Model Transport is distinct from); MAD-0009 (model selection policy); MAD-0011 (Executive/Execution boundary); MAD-0013 (deterministic reasoning and model-independent rendering) |
| Independent Review | ORR-MAD-0014 (`docs/governance/ORR-MAD-0014_SUBSCRIPTION_FIRST_AI_TRANSPORT_POLICY.md`) — verdict **Revision Required**; blocking B1, B2, medium M1. This revision resolves all three findings (see Review Notes). Repeat independent review required before CEO acceptance. |

## Context

Orion is the CEO's personal Executive Intelligence Platform (`OOM-0001`). For
Orion's personal deployment, the owner already maintains paid subscriptions to
multiple AI providers. Routing Orion's inference traffic through metered API
transports by default would incur avoidable cost on capacity the owner already
owns, and would quietly couple Orion's runtime to whichever provider's API
happens to be wired in first.

MAD-0013 established that Orion's reasoning is authoritative and that natural-
language generation is a replaceable presentation concern reached only through
an Executive Response Renderer port — the Executive Reasoning Engine itself
runs no language model and does not know which model or vendor voices its
output. MAD-0008 established the mirror principle one layer below, in
Maestro: engineering Agent Adapters depend only on a Transport interface, with
CLI transports as the primary, subscription-backed implementation and API
transports as an optional fallback.

This MAD applies that same discipline to Orion's own connection to AI
providers, and does so without weakening MAD-0013 or MAD-0011:

- **Provider** and **Transport** are separate concerns: Provider identifies
  which AI vendor supplies inference; Transport identifies the mechanism used
  to reach that vendor.
- Providers supply **inference only** — never executive reasoning, never
  execution, never a path to Maestro. MAD-0013 remains authoritative: the
  Executive Reasoning Engine, inside Orion Runtime, is the sole author of
  every Executive Decision.
- For personal deployment, the default transport is the one that uses
  subscriptions the owner already pays for — not the one that bills per
  token.

## Decision

Orion Runtime SHALL communicate with AI providers through a Model Adapter
abstraction whose sole purpose is to obtain **inference**, never executive
reasoning, in which transport selection is policy-driven and defaults to
subscription-backed CLI transport.

1. **Orion Runtime performs all Executive Reasoning.** The Executive
   Reasoning Engine (MAD-0013) is deterministic, model-independent, runs no
   language model, and is the sole author of every Executive Decision. No AI
   provider ever becomes Executive Intelligence, in whole or in part.

2. **Orion Runtime communicates with AI providers only through a Model
   Adapter.** No component of Orion Runtime or Orion Studio calls a provider
   directly. The Model Adapter's only permitted consumers are: (a) a
   replaceable Executive Response Renderer implementation (MAD-0013 §Decision
   3-4), and (b) an attributed AI Specialist advisory call (OAR-0001). Neither
   consumer may construct, mutate, or override an Executive Decision.

3. **Provider and Transport are separate concerns.** A Provider identifies
   which AI vendor supplies inference. A Transport identifies the mechanism
   used to reach that vendor's inference endpoint. The two vary independently,
   and neither ever supplies executive reasoning.

   Provider examples: Anthropic, OpenAI, Google, xAI, local models, future
   providers.

   Transport examples: CLI, API, local runtime, future transport.

4. **CLI transports are first-class citizens, and are inference transports
   only.** Supported examples include the Claude CLI and the OpenAI/Codex
   CLI. Future CLI transports may be added without architectural change —
   they are new implementations of the same Transport contract, not new
   architecture, and are bound by the Inference Boundary below.

5. **Subscription-backed CLI transport is the default transport for personal
   deployments.** This default exists to use subscriptions the owner already
   holds, minimize API cost, and preserve provider independence.

6. **API transports remain optional.** They exist for enterprise deployments,
   SaaS deployments, unattended automation, fallback, and providers without a
   CLI transport. API transports are never removed from the architecture —
   they are simply not the default for personal use. API transports are bound
   by the same Inference Boundary as CLI transports.

7. **Neither Orion Studio nor Orion Runtime may depend directly on any
   provider or transport implementation.** Only the Model Adapter, through
   the layered Provider Adapter and Transport contracts defined below, may
   know provider or transport detail.

8. **Transport selection is policy-driven.** The default policy: prefer
   authenticated CLI transport; fall back to API only when configured or
   required. Policy is data the Model Adapter consults, not a hardcoded path.

## Inference Boundary

All AI provider connections reached through the Model Adapter — Claude CLI,
OpenAI/Codex CLI, any future CLI transport, and any API transport — are
**inference transports only**. This boundary is structural, not a
configuration preference, and applies uniformly regardless of provider,
transport, or subscription status.

An inference transport, and the provider behind it:

- cannot issue Executive Decisions;
- cannot issue Executive Orders;
- cannot mutate Executive Memory;
- cannot communicate with Maestro, in any direction;
- cannot execute — no tool use, no filesystem write, no subprocess, no
  repository mutation, no deployment, no secret or credential mutation, no
  governance mutation;
- cannot dispatch or invoke an engineering agent (that surface is MAD-0008's
  Agent Transport, which this MAD does not grant Orion access to — see
  MAD-0011 rule 2);
- cannot bypass Orion Runtime to reach any other Orion or Maestro component
  directly.

All provider output — whether consumed by a Renderer implementation or an AI
Specialist advisory call — is **advisory inference only**: text, analysis, or
a rendering of an already-authoritative Executive Decision. **Only Orion
Runtime's Executive Reasoning Engine may construct an Executive Decision.** A
transport or provider incapable of enforcing this boundary is not eligible
for use by Orion, regardless of subscription status or default policy.

This Orion Model Transport is distinct from, and must not be confused with,
MAD-0008's engineering Agent Transport: MAD-0008 governs how Maestro dispatches
engineering agents capable of acting on the world; this MAD governs how Orion
obtains passive, advisory inference. The two are separate contracts serving
separate platforms (MAD-0011).

## Provider / Transport Layering

The Model Adapter is not a single undifferentiated boundary. It is a layered
stack, each layer independently substitutable:

```
Orion Runtime
      ↓
Model Adapter          (Runtime-facing port; knows neither provider nor
                         transport detail)
      ↓
Provider Adapter        (selects a Provider; knows nothing about how the
                         Transport moves bytes)
      ↓
Transport               (CLI, API, local runtime, future transport; knows
                         nothing about executive semantics)
      ↓
External Provider
```

- Orion Runtime depends only on the Model Adapter port.
- The Model Adapter depends only on the Provider Adapter contract; it does
  not embed CLI/API/vendor-specific logic itself.
- A Provider Adapter selects and addresses a Provider (Anthropic, OpenAI,
  Google, xAI, local model, future provider) and depends only on the
  Transport contract to move bytes to and from that provider.
- A Transport (CLI, API, local runtime, future transport) implements the
  mechanics of reaching a provider and encapsulates all transport-specific
  detail (authentication lifecycle, process invocation, wire protocol).
  Providers never appear directly above a Transport — every provider is
  reached through a Provider Adapter, which is in turn reached through a
  Transport.
- Adding a new Provider requires only a new Provider Adapter. Adding a new
  Transport requires only a new Transport implementation. Neither requires a
  change to Orion Runtime, Orion Studio, the Model Adapter port, or the
  Executive Decision schema.
- No concrete Provider Adapter or Transport implementation may leak
  provider-specific or transport-specific behavior into Orion Runtime or
  Orion Studio.

## Accepted Permanent Rules

1. Orion Runtime's Executive Reasoning Engine (MAD-0013) MUST be the sole
   author of every Executive Decision. No AI provider MUST ever become, in
   whole or in part, Executive Intelligence.
2. Orion Runtime MUST reach AI providers only through a Model Adapter; no
   other component may call a provider or transport directly. The Model
   Adapter's only permitted consumers are a Renderer implementation
   (MAD-0013) and an attributed AI Specialist advisory call (OAR-0001).
3. Provider selection and Transport selection MUST remain independently
   variable — a Provider change MUST NOT require a Transport change, and vice
   versa.
4. CLI transports MUST be supported as first-class citizens; adding a future
   CLI transport MUST NOT require architectural change.
5. Subscription-backed CLI transport MUST be the default transport for
   personal deployments.
6. API transports MUST remain available as optional implementations of the
   same Model Adapter contract — never removed, never the forced default for
   personal deployment.
7. The Model Adapter MUST be layered as Model Adapter → Provider Adapter →
   Transport → External Provider. Providers MUST NOT appear directly above a
   Transport. No layer may leak provider-specific or transport-specific
   behavior into Orion Runtime or Orion Studio.
8. Transport selection MUST be policy-driven, with a default policy of
   preferring authenticated CLI transport and falling back to API only when
   configured or required.
9. Every inference transport (CLI, API, local runtime, future transport) MUST
   be structurally incapable of issuing Executive Decisions or Executive
   Orders, mutating Executive Memory, communicating with Maestro, executing
   (tool use, filesystem write, subprocess, repository mutation, deployment,
   secret or governance mutation), dispatching an engineering agent, or
   bypassing Orion Runtime. A transport that cannot enforce this boundary MUST
   NOT be used by Orion.
10. All provider output MUST be treated as advisory inference only. No
    provider response MUST create, mutate, omit, or override an Executive
    Decision, recommendation, evidence item, risk, trade-off, or next action.
11. The Orion Model Transport defined by this MAD MUST remain distinct from
    MAD-0008's engineering Agent Transport; this MAD grants Orion no agent
    dispatch capability.

## Consequences

**Positive**

- Subscription-first operation uses capacity the owner already pays for.
- Lower operating cost for personal deployment.
- Provider independence: no permanent coupling to any single AI vendor.
- Transport independence: CLI and API are interchangeable implementations.
- Future-proof — new providers and transports slot into the same layered
  Model Adapter contract without touching Orion's reasoning core.
- Executive reasoning integrity is preserved: MAD-0013 and MAD-0011 remain
  fully authoritative, with no provider or transport capable of weakening
  either boundary.

**Negative**

- CLI transports carry an authentication lifecycle (login/session/token
  refresh) that API transports do not.
- Subscription-backed CLI transport requires a local runtime capable of
  driving that CLI under the inference-only capability quarantine (no tool
  use, no filesystem/subprocess/repository access).
- CLI-first defaults are unsuitable for large multi-tenant SaaS deployment
  without enabling the API transport.
- The layered Provider Adapter / Transport contract is additional structure
  beyond a single undifferentiated Model Adapter.

## Non-Goals

This MAD records an architectural constraint only. It explicitly does not:

- Implement the Model Adapter, any Provider Adapter, any Transport, or any
  Provider integration.
- Specify routing policy beyond the stated default (prefer CLI, fall back to
  API).
- Select or authorize any specific provider.
- Define multi-model orchestration.
- Grant Orion any agent-dispatch, repository-write, deployment, or Maestro-
  write capability. That boundary remains fixed by MAD-0011 and is not
  reopened by this MAD.

## Review Notes

This decision extends MAD-0008's transport-independence discipline from
Maestro's execution layer to Orion's own connection to AI providers, and
composes with MAD-0013: MAD-0013 keeps *which model voices Orion's reasoning*
a replaceable presentation detail behind the Renderer port; this MAD keeps
*which provider and mechanism carries inference traffic* a replaceable detail
behind the layered Model Adapter port. Neither reasoning, rendering,
provider, nor transport is permanently coupled to any vendor, and none of
them may cross into executive reasoning or execution authority.

**Remediation record (this revision).** ORR-MAD-0014 returned verdict
Revision Required with two blocking findings and one medium finding. This
revision resolves them as follows:

- **B1 (provider incorrectly assigned executive reasoning).** Removed all
  "whose model reasons" / reasoning-traffic language. Added Decision rule 1
  ("Orion Runtime performs all Executive Reasoning"), narrowed the Model
  Adapter's permitted consumers to Renderer and AI Specialist advisory calls
  (Decision rule 2), and added Permanent Rules 1 and 10 making the Executive
  Decision exclusively Orion Runtime's product. MAD-0013 remains
  authoritative and unmodified.
- **B2 (CLI/API transports lacked structural execution-capability
  quarantine).** Added the "Inference Boundary" section and Permanent Rule 9:
  every inference transport is structurally barred from issuing Executive
  Decisions/Orders, mutating Executive Memory, communicating with Maestro,
  executing, dispatching an engineering agent, or bypassing Orion Runtime.
  Added Permanent Rule 11 and Related-field cross-reference distinguishing
  this Orion Model Transport from MAD-0008's engineering Agent Transport.
- **M1 (provider/transport layering under-specified).** Added the "Provider /
  Transport Layering" section defining Model Adapter → Provider Adapter →
  Transport → External Provider, and Permanent Rule 7 requiring that layering
  and prohibiting providers from appearing directly above a Transport.

Independent review and CEO acceptance are still required before this MAD
moves from Proposed to Accepted; no implementation is authorized by this
capture.
