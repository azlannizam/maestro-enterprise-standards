# MAD-0013: Deterministic Executive Reasoning and Model-Independent Rendering

| Field | Value |
|---|---|
| MAD ID | MAD-0013 |
| Title | Deterministic Executive Reasoning and Model-Independent Rendering |
| Status | **Accepted** |
| Date | 2026-07-14 |
| Accepted Date | 2026-07-14 |
| Owner | Architecture Owner |
| Independent Review | Confirmed by ORR-OR-I1 (`maestro-enterprise-standards/docs/governance/ORR-OR-I1_GOVERNANCE_GATE_REVIEW.md`) — verdict Accept with low advisory; no blocking/high/medium findings. |
| Scope | Orion Runtime — the executive reasoning core and its response rendering boundary |
| MES Cross-References | MES-001 MR-2, MR-3, MR-4; MES-401 MR-1, MR-11 |
| Related | OOM-0001; OAR-0001 §5.1, §5.5; OWP-0001 v1.1 §3.2, §4; MAD-0008 (transport independence — the execution-layer analogue); MAD-0011 |

## Context

Orion is the CEO's Second Mind (`OOM-0001` §2): it must hold executive
conversations, reason, challenge with evidence, and recommend — while remaining
explainable, deterministic where required, and incapable of fabricating facts
(`OOM-0001` §2; MES-001 MR-2, MR-3).

Designing the first implementation increment (OWP-0001 v1.1 OR-I1, the Executive
Conversation Runtime) surfaced a load-bearing architectural question: **is the
authoritative output of Orion's reasoning a piece of natural-language text, or a
structured decision?**

If prose were authoritative, Orion's reasoning would inherit the properties of
whatever generator produced the prose — nondeterminism, model-version drift,
vendor coupling, and the risk of fabricated or flattering content. Orion's
explanations and challenges would then be unauditable and irreproducible, and the
runtime would be coupled to a specific language model forever.

Maestro already established the mirror of this principle one layer down: MAD-0008
makes the runtime *transport-independent* so vendor and cost decisions stay
reversible. This MAD applies the same discipline to Orion's *intelligence*: the
reasoning is the asset; the language model that voices it is a replaceable
presentation detail.

The governing formulation:

> **Orion does not think in English. It thinks in executive decisions.** English
> (or Bahasa Malaysia, or voice, or any future surface) is one way of presenting
> those decisions — never their source.

## Decision

Orion's executive reasoning SHALL produce a structured **Executive Decision** as
its authoritative output, and natural-language generation SHALL be a separate,
replaceable presentation concern.

1. **The Executive Decision is authoritative.** The Executive Reasoning Engine
   emits a structured Executive Decision — a machine-readable record whose fields
   include, at minimum: `recommendation`, `reasoning`, `tradeoffs`, `risks`,
   `confidence`, `evidence`, and `next_actions`. This record is the system of
   record for the executive judgement.

2. **Reasoning is deterministic and model-independent.** The Executive Decision
   is a pure function of its inputs (executive intent + supplied knowledge, and,
   from OR-I2 onward, Executive Memory). Identical inputs yield an identical
   Executive Decision. The reasoning core runs no language model and depends on no
   model vendor.

3. **Rendering is a separate concern behind a port.** An **Executive Response
   Renderer** turns an Executive Decision into an executive-grade response for a
   client surface. The Renderer is reached only through a port; the reasoning core
   does not know which Renderer, model, language, or surface is in use.

4. **The default Renderer is deterministic.** The initial Renderer composes the
   response deterministically from the Executive Decision's fields. A
   model-backed Renderer (any LLM, on-device model, or future model) is an
   **optional** implementation of the same port, never an architectural
   requirement.

5. **Rendering never mutates the decision.** A Renderer may only express an
   Executive Decision. It MUST NOT add, remove, or alter any recommendation,
   reasoning, trade-off, risk, evidence item, or next action. It introduces no
   fact not present in the Executive Decision (MES-001 MR-2 — no fabrication).

6. **Swapping the Renderer changes nothing upstream.** Replacing or upgrading the
   Renderer (including adopting or changing an LLM) MUST NOT require changes to the
   Conversation Engine, Intent Engine, Executive Reasoning Engine, Executive
   Decision schema, Executive Memory, or any other runtime engine.

## Accepted Permanent Rules

1. The authoritative output of Orion's reasoning is a structured Executive
   Decision, never natural-language text.
2. The Executive Reasoning Engine MUST be a deterministic, model-independent pure
   function of its inputs; identical inputs yield an identical Executive Decision.
3. Natural-language generation MUST sit behind an Executive Response Renderer port
   and MUST NOT be the source of any executive decision.
4. The default Renderer MUST be deterministic; model-backed Renderers are optional
   implementations of the same port, never architectural requirements.
5. A Renderer MUST express an Executive Decision faithfully and MUST NOT introduce,
   omit, or alter any fact, recommendation, or judgement (no fabrication).
6. Swapping or upgrading the Renderer MUST NOT require changes to any other Orion
   runtime engine or to the Executive Decision schema.

## Consequences

**Positive**

- Executive reasoning is explainable, auditable, and reproducible.
- Orion is independent of any language-model vendor or version (future-proof).
- Fabrication is structurally constrained — the Renderer can only voice recorded
  facts.
- Multiple surfaces (text, voice, other languages) render one decision without
  duplicating reasoning.
- Reversibility (MES-001 MR-4): the Renderer is disposable, like a derived
  projection.

**Negative**

- Additional structure: a decision schema plus a rendering layer.
- The deterministic default Renderer produces plainer prose than a model-backed
  one would; richer rendering is a later, optional increment.

## Non-Goals

This MAD records an architectural constraint only. It explicitly does not:

- Implement the Executive Reasoning Engine or any Renderer.
- Specify the Executive Decision schema in full (owned by the OR-I1 work programme).
- Select, integrate, or authorize any language model.
- Modify any Maestro component.

## Review Notes

This decision extends the reversibility discipline of MAD-0008 (transport
independence) from Maestro's execution layer to Orion's intelligence layer, and
supports MAD-0011 by keeping Orion's reasoning boundary deliberate and free of
hidden vendor coupling. It is the governance dependency for OWP-0001 v1.1 OR-I1
(the Executive Conversation Runtime). Implementation of the reasoning core or any
Renderer requires separate governed authorization under that increment's OWP and
MES-101/102/103.
