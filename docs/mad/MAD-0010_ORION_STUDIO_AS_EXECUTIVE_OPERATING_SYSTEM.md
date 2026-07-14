# MAD-0010: Orion Studio as the Executive Operating System

| Field | Value |
|---|---|
| MAD ID | MAD-0010 |
| Title | Orion Studio as the Executive Operating System |
| Status | **Accepted** |
| Date | 2026-07-14 |
| Accepted Date | 2026-07-14 |
| Owner | AI Governance Owner |
| Scope | The canonical executive interface; Orion Studio as a product; runtime headlessness; multi-client support |
| MES Cross-References | MES-001 MR-2, MR-3; MES-401 MR-1, MR-7, MR-11 |
| Supersedes | MAD-0005 (effective on acceptance of this MAD) |
| Origin | OR-A1 (Orion Programme); `OOM-0001` §9, `OAR-0002` |
| Independent Review | Confirmed by ORR-OR-A1-MAD-0010-0012, commit `c29aa0c4e25682f056089b3b31d41bebed6e0232` |

## Context

MAD-0005 defined Orion in two contexts — Studio (thinking, primary environment
ChatGPT) and Runtime (operational, environment "the Maestro Enterprise Operating
System"). That assumption — *"Primary environment: ChatGPT"* — was correct when
written. It is no longer correct.

The Orion architecture (OR-A1) establishes Orion as the enterprise's Executive
Intelligence Layer, a sibling platform to Maestro, with a **headless Orion
Runtime** (`OAR-0001`) and a distinct executive product surface, **Orion Studio**
(`OAR-0002`). Orion Studio is not a chatbot and not a single UI; it is an
Executive Operating System with many surfaces, of which conversation is one.

Without a governing decision, "ChatGPT is the executive environment" would remain
the recorded position, contradicting the accepted architecture and blocking the
multi-client executive product the architecture requires.

## Decision

Orion Studio becomes the **canonical executive interface** of the enterprise.

1. **Orion Studio is the Executive Operating System** — the CEO's cockpit — and
   the canonical way the CEO interacts with Orion.
2. **ChatGPT becomes a temporary development environment**, not the canonical
   executive interface.
3. **Orion Runtime remains headless and UI-independent.** It exposes one
   client-agnostic contract and does not know which client or surface a request
   came from.
4. **Multiple clients are supported** — Web PWA (first), iPad, macOS, Windows —
   without changing Orion Runtime. Presentation is client-owned; capability is
   runtime-owned.
5. **Conversation is one surface among many.** The CEO also inspects portfolio,
   roadmaps, architecture, enterprise health, KPIs, risks, decision history, and
   executive memory, and issues Executive Orders, through Orion Studio.

## Accepted Permanent Rules

1. Orion Studio is the canonical executive interface; other environments are
   transitional.
2. Orion Runtime is headless; no executive capability depends on a specific
   client.
3. Any client may be added, replaced, or run alongside others without changing
   Orion Runtime.
4. A Studio surface renders runtime capabilities and collects input; it holds no
   authority, no decision power, and no authoritative memory.
5. No Studio surface reaches Maestro directly; execution crosses only through the
   Executive Order seam (MAD-0011, MAD-0012).

## Consequences

- The executive interface can evolve across web and native clients without
  destabilizing the runtime.
- ChatGPT can remain useful for development and exploration without being the
  system of record for executive interaction.
- MAD-0005's two-context model is subsumed: the "same architectural role in two
  contexts" is preserved, but the canonical *environment* moves from ChatGPT to
  Orion Studio.

## Transition and Supersession

- **This MAD is Accepted (2026-07-14).** **MAD-0005 is now Superseded**, recorded
  as superseded by MAD-0010 in `MAD-0005` and in `MAD-INDEX.md`.
- Its "primary environment: ChatGPT" assumption no longer stands; Orion Studio is
  the canonical executive interface as of this acceptance.

### MAD-0005 rule carry-forward / retirement

MAD-0005's environment/interface position is superseded; its discipline rules
are individually dispositioned below so no governance content lapses silently
(ORR-OR-A1-MAD-0010-0012, F-10.1):

| MAD-0005 rule | Disposition | New home |
|---|---|---|
| 1–2. Studio/Runtime = same architectural role; Studio is the thinking/design environment | Superseded — role split is replaced by Studio-as-canonical-interface / headless-Runtime split | MAD-0010 (this MAD), `OOM-0001` §2 |
| 3. Runtime is the operational/execution environment | Retired as written — "Runtime" now denotes the headless Orion Runtime (`OAR-0001`), not an operating context | MAD-0010, MAD-0011 |
| 4–5, 9. Studio may use metaphor/exploration without creating operational authority | Carried forward — still binding; a Studio surface holds no authority or decision power | MAD-0010 Accepted Permanent Rule 4 |
| 6. Runtime must rely on institutional memory, not informal chat memory | Carried forward unchanged | `OOM-0001` §6 (Executive Memory); MAD-0001 |
| 7. Runtime must cite/rely on evidence under MES-001 | Carried forward unchanged | MES-001 MR-2; MAD-0010 (implicit via MES cross-reference) |
| 8. Studio discussion is not binding unless captured in an authoritative artifact | Carried forward unchanged | MES-001 MR-2/MR-3; MAD-0002 |
| 10. Runtime does not gain application write authority from MAD-0005 | Carried forward, strengthened | MAD-0011 Accepted Permanent Rule 3 (no execution authority under any condition) |

## Non-Goals

- This MAD does not specify UI, visual design, client packaging, or wire
  contracts (architecture and later increments own those).
- This MAD does not grant Orion Studio any execution, repository-write, or deploy
  authority.
- This MAD does not modify Maestro.

## Review Notes

This decision records a governance gap discovered by OR-A1: the executive
interface has outgrown "ChatGPT as primary environment." It supports MES-401 by
keeping authority with the CEO and Maestro (the client tier holds none) and
MES-001 by requiring evidence-linked, assumption-explicit executive surfaces.
Acceptance is a CEO decision after independent review; this MAD does not
self-accept.

**Acceptance record.** Independent review: ORR-OR-A1-MAD-0010-0012 (commit
`c29aa0c4e25682f056089b3b31d41bebed6e0232`) — recommended Accept. **CEO
acceptance: 2026-07-14.** This is the final authority action; Status above is
now Accepted.
