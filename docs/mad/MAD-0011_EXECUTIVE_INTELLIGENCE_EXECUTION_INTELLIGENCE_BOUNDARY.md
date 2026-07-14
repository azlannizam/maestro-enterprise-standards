# MAD-0011: Executive Intelligence / Execution Intelligence Boundary

| Field | Value |
|---|---|
| MAD ID | MAD-0011 |
| Title | Executive Intelligence / Execution Intelligence Boundary |
| Status | **Accepted** |
| Date | 2026-07-14 |
| Accepted Date | 2026-07-14 |
| Owner | AI Governance Owner |
| Scope | The permanent boundary between Orion (Executive Intelligence) and Maestro (Execution Intelligence) |
| MES Cross-References | MES-001 MR-2, MR-4; MES-401 MR-1, MR-7, MR-11 |
| Origin | OR-A1 (Orion Programme); `OOM-0001` §4, `OAR-0001` §2 |
| Independent Review | Confirmed by ORR-OR-A1-MAD-0010-0012, commit `c29aa0c4e25682f056089b3b31d41bebed6e0232` |

## Context

Maestro is the Enterprise Execution Operating System. Orion is the Executive
Intelligence Layer above it. If the boundary between reasoning and execution is
not fixed permanently, the two will blur: a brainstorming conclusion could become
an execution command, or executive direction could bypass approval and reach
agents directly.

Maestro already proved that autonomy is safe when nondeterminism is quarantined
into one layer and the core stays pure. The enterprise needs the same discipline
one level up: executive intelligence quarantined from execution authority.

## Decision

Define, permanently:

```
CEO
  ↓
Orion    — Executive Intelligence (reasons, decides, remembers, issues Orders)
  ↓
Maestro  — Execution Intelligence (executes approved work; owns dispatch/deploy)
```

1. **The CEO never talks directly to Maestro.** The CEO always talks to Orion
   (through Orion Studio). Orion translates executive intent into governed
   direction.
2. **Orion never executes.** Orion holds no agent transport, no repository-write
   path, and no deployment path. Its only outward-consequential artifact is an
   Executive Order.
3. **The only crossing is the Executive Order seam.** An Executive Order becomes
   actionable only after decomposition into Missions and **CEO-approved work
   packages** admitted by Maestro's existing, unchanged approval matrix
   (MAD-0012).
4. **Orion reads Maestro; it does not write it**, except the one explicitly
   authorized crossing in rule 3. Orion may query Maestro for execution state
   (read-only) but stores no executive memory inside Maestro and mutates no
   Maestro state **other than** the CEO-approved work-package admission seam.
5. **Orion and Maestro are sibling platforms.** Neither is subordinate to the
   other's governance; they collaborate across this one seam.

## Accepted Permanent Rules

1. Executive Intelligence (Orion) and Execution Intelligence (Maestro) are
   separate platforms with a single, defined seam.
2. Orion decides; Maestro executes; the boundary shall never blur.
3. Orion has no structural path to dispatch, repository write, deployment, or
   secret/credential/governance mutation.
4. The Executive Order → Mission → CEO-approved Work Package → Maestro admission
   chain is the only way executive direction reaches execution.
5. Orion's coupling to Maestro is read-only for state, with exactly one
   explicitly authorized write: the CEO-approved work package at admission
   (rule 3/4 above) — never more, and never any other Maestro state.

## Consequences

- Orion can be maximally intelligent, opinionated, and creative precisely because
  it has no power to act directly; every consequence passes through approval and
  Maestro's own boundaries.
- The enterprise gains a durable separation between "what to do and why"
  (executive) and "doing it safely" (execution).
- Future agents and clients inherit an unambiguous authority chain.

## Non-Goals

- This MAD does not define the Executive Order format (MAD-0012) or the Studio
  (MAD-0010).
- This MAD does not modify Maestro's core, M2 runtime, or approval matrix.
- This MAD does not grant Orion any execution authority under any condition.

## Review Notes

This may be one of the most consequential MADs in the ecosystem: it fixes the
executive/execution boundary permanently. It reinforces MES-401 (authority stays
with the CEO and Maestro) and MES-001 MR-4 (production safety via reversibility
and gated crossings). This MAD does not self-accept.

**Acceptance record.** Independent review: ORR-OR-A1-MAD-0010-0012 (commit
`c29aa0c4e25682f056089b3b31d41bebed6e0232`) — recommended Accept; advisory
F-11.1 (rule 4/5 wording) resolved above. **CEO acceptance: 2026-07-14.** This
is the final authority action; Status above is now Accepted. The runtime build
increment that opens the seam (OR-I1 et seq.) is authorized subject to its own
OWP and MES-101/102/103.
