# ORR-MAD-0014: Subscription-First AI Transport Policy Review

| Field | Value |
|---|---|
| Review ID | ORR-MAD-0014 |
| Subject | MAD-0014 Subscription-First AI Transport Policy and related MAD-INDEX update |
| Review Type | Independent governance and architecture review |
| Reviewer | Codex |
| Date | 2026-07-14 |
| Reviewed State | Uncommitted working-tree proposal; MAD-0014 SHA-256 `3a6af0e702403d76bd027778f9b222e69b43ec99f854777b8bbd2cb3a642d0ac`; MAD-INDEX SHA-256 `bebf06f5100f6be52bd96ea8c5a992ab7b4f1039644395cf575c43eedf2d560a` |
| Orion Authority Baseline | `orion-runtime` commit `0d8e82a3165365f1f930db004e077b624530c6c8` |
| Authority | MES-001; MES-401; Accepted MAD-0008, MAD-0009, MAD-0010, MAD-0011, MAD-0012, MAD-0013; OOM-0001; OAR-0001; OWP-0001 v1.1 |
| Verdict | **REVISION REQUIRED — do not accept as written** |
| Disposition | This review recommends; it does not accept MAD-0014. CEO acceptance remains required after blocking findings are resolved. |

## Executive Verdict

MAD-0014 has a sound policy objective but is not fit for acceptance as written.
Subscription-backed CLI as the personal-deployment default, optional API
transports, policy-driven selection, provider/transport independence, and future
SaaS support are valid goals. Proposed status and MAD-INDEX placement are correct.

Two blocking conflicts remain:

1. MAD-0014 assigns reasoning to provider models, contradicting Accepted
   MAD-0013, under which Orion's Executive Reasoning Engine is deterministic,
   model-independent, and runs no language model. A model may render an already
   authoritative Executive Decision or provide attributed specialist advice; it
   may not become the source of Orion's executive reasoning.
2. MAD-0014 makes Claude CLI and OpenAI/Codex CLI first-class Orion transports
   without constraining them to inference-only, advisory-only capability. OOM-0001,
   OAR-0001, and MAD-0011 prohibit Orion from holding an engineering-agent
   transport, adapter, repository-write path, deployment path, or any execution
   authority. Transport substitution cannot weaken that structural boundary.

One medium finding also remains: the text states provider/transport separation
but does not define the required layering that keeps provider implementations
behind transport adapters. As written, the Model Adapter is said to know both
provider and transport detail, leaving the independence claim under-specified.

Recommendation: revise MAD-0014, repeat independent review, then return it to the
CEO for acceptance. No implementation should begin from this proposal.

## Findings by Severity

### Blocking

#### ORR-MAD-0014-B1: Provider model is incorrectly made the source of Orion reasoning

Evidence:

- MAD-0014 lines 32-35 define Provider as “whose model reasons” and describe the
  selected transport as carrying that model interaction.
- MAD-0014 lines 47-54 repeat that a Provider identifies “whose model reasons.”
- MAD-0014 lines 80-82 and 103-105 call executive reasoning
  provider-independent, implying executive reasoning is performed by a selected
  provider.
- Accepted MAD-0013 lines 48-62 make the structured Executive Decision
  authoritative and require the Executive Reasoning Engine to be a deterministic,
  model-independent pure function that runs no language model.
- Accepted MAD-0013 lines 64-78 permit a model only behind the Executive Response
  Renderer port and prohibit it from changing the decision or introducing facts.
- OWP-0001 v1.1 lines 174-201 implements the same OR-I1 boundary: deterministic
  executive reasoning plus response rendering, with no external API or LLM
  dependency in OR-I1.

Assessment:

This is an architectural contradiction, not terminology alone. MAD-0013 separates
authoritative reasoning from optional model-backed rendering. MAD-0014 collapses
that separation by defining a provider according to which model reasons and by
describing Orion's connection as reasoning traffic. Acceptance would create two
incompatible authoritative rules for ownership of executive reasoning.

Required correction:

- Define exact Model Adapter consumers. For MAD-0013 compatibility, model-backed
  use must be limited to replaceable Renderer implementations and/or attributed
  AI Specialist advisory calls.
- Replace “whose model reasons” and equivalent reasoning-traffic language with
  wording that preserves the Executive Decision as the sole authoritative result
  of Orion's deterministic reasoning.
- State explicitly that no provider response may create, mutate, omit, or override
  an Executive Decision, recommendation, evidence item, risk, trade-off, or next
  action.

#### ORR-MAD-0014-B2: CLI policy lacks structural execution-capability quarantine

Evidence:

- MAD-0014 lines 56-59 names Claude CLI and OpenAI/Codex CLI as supported
  first-class transports.
- MAD-0014 lines 61-68 and 91-102 make authenticated CLI the default and API the
  fallback, but impose no tool, filesystem, subprocess, network-side-effect,
  repository-write, deployment, agent-dispatch, or Maestro-access restriction.
- OOM-0001 lines 150-160 makes agent dispatch structurally impossible because
  Orion holds no transport or adapter; it also forbids repository writes,
  deployment, governance mutation, and execution-chain bypass.
- OAR-0001 lines 33-55 says Orion Runtime holds no agent transport, no adapter,
  repository-write path, or deployment path.
- OAR-0001 lines 404-419 requires no execution surface by construction and limits
  AI specialists to analysis-only advisory results.
- Accepted MAD-0011 lines 43-53 and 59-68 gives Orion no structural path to
  dispatch, repository write, deployment, secret/credential/governance mutation,
  or any Maestro write outside the CEO-approved admission seam.

Assessment:

Claude CLI and Codex CLI can represent engineering-agent execution surfaces, not
only passive model transports. Naming them as Orion defaults without a
capability-restricted contract permits an implementation that can act on the
world from inside Orion. Provider independence and transport independence do not
override MAD-0011's absolute authority boundary.

Required correction:

- Define an Orion Model Transport as inference/advisory I/O only, distinct from
  MAD-0008 engineering Agent Transport.
- Require every CLI/API/local transport to disable or structurally exclude tools,
  agent dispatch, filesystem writes, subprocess execution, repository mutation,
  deployment, Maestro mutation, secret mutation, and governance mutation.
- Require transports to return data only through the bounded Renderer or AI
  Specialist advisory contract.
- State that a transport incapable of enforcing this capability boundary is not
  eligible for Orion, regardless of subscription or default policy.

### High

None beyond blocking findings above.

### Medium

#### ORR-MAD-0014-M1: Provider/transport layering is asserted but not fully specified

Evidence:

- MAD-0014 lines 47-59 says Provider and Transport vary independently and calls
  future transports implementations of one Transport interface.
- MAD-0014 lines 70-78 says only the Model Adapter knows provider and transport
  details and consults selection policy.
- MAD-0014 lines 86-105 repeats the Model Adapter boundary but never defines a
  provider-facing contract or states that concrete provider implementations sit
  behind transport adapters.

Assessment:

Studio isolation and Runtime-to-Model-Adapter dependency are explicit. Concrete
layering behind that port is not. One Model Adapter that embeds provider-specific
CLI/API logic would comply literally while coupling provider and transport in
implementation. This fails the requested verification that provider
implementations remain behind transport adapters.

Required correction:

- Define stable Model Adapter port used by Orion Runtime.
- Define independently selectable Provider and Transport contracts behind that
  port.
- State that concrete CLI, API, local-runtime, and future transports implement the
  Transport contract and encapsulate transport details.
- State that provider-specific behavior cannot leak into Orion Runtime or Orion
  Studio and cannot require changes to either contract when a provider or
  transport is added.

### Low

None.

### Informational Confirmations

- MAD-0014 status is correctly `Proposed` (line 7).
- MAD-INDEX lists MAD-0014 once under Proposed MADs with matching title, status,
  date, link, and MES cross-references (MAD-INDEX lines 32-36).
- MAD-0014 requires independent review and CEO acceptance before transition to
  Accepted and says no implementation is authorized (lines 137-147).
- Non-Goals prohibit Model Adapter, Transport, or Provider implementation and do
  not select or authorize a provider (lines 127-135).
- CLI transports are expressly first-class (lines 56-59, 91-92).
- Subscription-backed CLI is expressly the personal-deployment default (lines
  61-63, 93-94).
- API transports remain optional and available for enterprise, SaaS, unattended
  automation, fallback, and providers without CLI support (lines 65-68, 95-97).
- Orion Studio is prohibited from direct provider access and transport detail
  (lines 43-45, 70-74, 98-99).
- Orion Runtime is directed to use only the Model Adapter (lines 39-45, 86-87),
  subject to blocking boundary corrections above.
- MAD-0009 remains unaffected: its Recommended Model field is advisory engineering
  mission metadata and does not authorize runtime selection or vendor behavior
  (MAD-0009 lines 28-40, 97-106).
- No reviewed file self-accepts and no implementation was introduced.

## Verification

| Review Requirement | Result | Basis |
|---|---|---|
| Provider and Transport correctly separated | **Partial / Medium** | Independent variability stated; concrete provider-behind-transport layering missing (M1). |
| Orion provider-independent | **Partial** | Vendor independence intended, but provider is incorrectly assigned executive reasoning (B1). |
| Orion transport-independent | **Partial** | Interchangeability intended, but eligible transport capability boundary is absent (B2). |
| CLI transports first-class | **Pass** | MAD-0014 Decision 3 and Permanent Rule 3. |
| Subscription-backed CLI default for personal deployment | **Pass** | MAD-0014 Decision 4 and Permanent Rule 4. |
| API optional | **Pass** | MAD-0014 Decision 5 and Permanent Rule 5. |
| Future SaaS not prevented | **Pass** | API explicitly retained for SaaS/enterprise; personal default is scope-qualified. |
| Consistent with MAD-0008 | **Pass with distinction required** | Same transport-independence principle; Orion Model Transport must be distinguished from engineering Agent Transport (B2). |
| Consistent with MAD-0009 | **Pass** | No engineering mission authority or advisory model-header behavior changed. |
| Consistent with MAD-0011 | **Fail / Blocking** | CLI eligibility lacks structural no-execution capability quarantine (B2). |
| Consistent with MAD-0013 | **Fail / Blocking** | Provider model is described as reasoning source (B1). |
| Orion Studio never knows transport details | **Pass** | Direct provider access and implementation detail prohibited. |
| Orion Runtime depends only on Model Adapter | **Pass in proposed topology** | Explicit, but only after OAR/MAD-0011 conflict is resolved. |
| Provider implementations behind transport adapters | **Fail / Medium** | Required layering absent (M1). |
| Proposed status correct | **Pass** | MAD and index both Proposed. |
| MAD-INDEX correct | **Pass** | Correct section, ID, link, title, status, date, cross-references. |
| No self-acceptance | **Pass** | CEO acceptance explicitly required. |
| No implementation introduced | **Pass** | Policy text and index only; Non-Goals prohibit implementation. |

## Future Compatibility

| Target | Assessment |
|---|---|
| Claude CLI | **Conditional** — supported by policy after inference/advisory-only capability quarantine (B2). |
| OpenAI / Codex CLI | **Conditional** — supported by policy after inference/advisory-only capability quarantine (B2). |
| Future CLI providers | **Conditional** — Transport extension point exists in intent; contract layering and capability constraints must be added (B2, M1). |
| API providers | **Supported** — optional API path expressly preserved; same capability constraints must apply. |
| Local models | **Supported in intent** — local model and local runtime are listed; exact provider/transport contract must be clarified (M1). |
| Future transports | **Conditional** — extension promised without architecture change, provided stable contracts and invariant no-execution boundary are defined first. |

After B1, B2, and M1 are resolved, all listed provider and transport classes can
be supported without changes to Orion Studio, Orion Runtime engines, Executive
Decision schema, or executive/execution architecture. New concrete adapters and
policy data would then be implementation additions behind stable ports.

## Remaining Unresolved Findings

- `ORR-MAD-0014-B1` — Blocking: provider model incorrectly owns Orion reasoning.
- `ORR-MAD-0014-B2` — Blocking: CLI/API/local transports lack structural
  inference/advisory-only capability quarantine.
- `ORR-MAD-0014-M1` — Medium: provider/transport adapter layering is
  under-specified.

MAD-0014 must remain Proposed. Resolve all three findings, then perform another
independent governance review before CEO acceptance.

## Assumptions, Unknowns, and Deliberate Omissions

- Assumed `ORION_EXECUTIVE_OPERATING_MODEL.md` is OOM-0001; its internal Document
  field identifies it as such.
- Reviewed OOM-0001, OAR-0001, and OWP-0001 from clean `orion-runtime` commit
  `0d8e82a3165365f1f930db004e077b624530c6c8`.
- OOM-0001 and OAR-0001 headers retain pre-acceptance wording, while OWP-0001 v1.1
  and accepted MAD records identify OR-A1 as accepted. This status-document drift
  was treated as outside this review's mutation scope and did not change boundary
  analysis.
- Deliberately omitted implementation design, CLI product behavior validation,
  authentication design, routing algorithms, model selection, and code review.
- Deliberately made no changes to MAD-0014 or MAD-INDEX; independent review records
  findings but does not author corrections or accept its subject.

## Files Created or Updated

- Created: `docs/governance/ORR-MAD-0014_SUBSCRIPTION_FIRST_AI_TRANSPORT_POLICY.md`.
- Reviewed but not edited by Codex: `docs/mad/MAD-0014_SUBSCRIPTION_FIRST_AI_TRANSPORT_POLICY.md`.
- Reviewed but not edited by Codex: `docs/mad/MAD-INDEX.md`.

## Commit SHA

Recorded by the commit that captures MAD-0014, its MAD-INDEX proposal entry, and
this independent review; see repository log.
