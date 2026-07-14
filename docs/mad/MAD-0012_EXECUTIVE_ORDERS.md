# MAD-0012: Executive Orders

| Field | Value |
|---|---|
| MAD ID | MAD-0012 |
| Title | Executive Orders |
| Status | **Accepted** |
| Date | 2026-07-14 |
| Accepted Date | 2026-07-14 |
| Owner | AI Governance Owner |
| Scope | Executive Orders as the authoritative unit of business direction and the mandatory path into execution |
| MES Cross-References | MES-001 MR-2, MR-3, MR-4; MES-401 MR-1, MR-7, MR-11 |
| Origin | OR-A1 (Orion Programme); `OOM-0001` §5, `OAR-0001` §5.7–§5.8 |
| Independent Review | Confirmed by ORR-OR-A1-MAD-0010-0012, commit `c29aa0c4e25682f056089b3b31d41bebed6e0232` |

## Context

Orion issues authoritative business direction. That direction needs a formal
unit; without one, executive intent would reach execution ad hoc, and people
would eventually send direction straight to Maestro, collapsing the boundary
(MAD-0011) by turning executive intent into an unreviewed execution command.

## Decision

Formalize the **Executive Order** and its mandatory chain:

```
CEO Intent
  ↓
Executive Order   (authoritative business direction, versioned, evidence-linked)
  ↓
Mission           (decomposed initiative: scope, outcomes, constraints)
  ↓
Work Package      (Maestro-shaped, CEO-approved)
  ↓
Maestro           (admission re-verifies approval; executes)
```

1. **An Executive Order is the authoritative unit of business direction**, issued
   by Orion on the CEO's behalf. Orion is the issuing instrument; the CEO is the
   issuing authority.
2. **Orders are versioned and durable.** Amending or superseding an Order creates
   a new version linked to its predecessor; Orders are never silently edited.
3. **Orders carry no execution authority of their own.** An Order becomes
   actionable only after decomposition into Missions and **CEO-approved work
   packages**.
4. **No step may be skipped.** An Order MUST pass through a Mission and a
   CEO-approved work package before Maestro admission. **An Order MUST NOT be sent
   directly to Maestro**, and no direct Order-to-work-package or Order-to-Maestro
   path may exist.
5. **Maestro is unchanged.** Work packages are admitted by Maestro's existing
   approval matrix; the accepted Gateway re-verifies approval and rejects
   unapproved packages.

**Implementation gate.** Before any seam-build increment integrates against the
Maestro admission path, the increment MUST verify that the CEO Approval Gateway
(`rrp-0007-ceo-approval-gateway`) is merged to `maestro-runtime` `main` and
accepted — not merely present on an unmerged branch. Integrating against an
unaccepted or unmerged Gateway is out of scope for this MAD's authorization
(ORR-OR-A1-MAD-0010-0012, F-12.1).

## Accepted Permanent Rules

1. Executive Orders are the sole authoritative unit of Orion-issued direction.
2. The CEO Intent → Executive Order → Mission → Work Package → Maestro chain is
   mandatory and ordered.
3. Orders bypassing Missions are prohibited; the architecture must make the
   bypass structurally impossible, not merely discouraged.
4. Orders are versioned, evidence-linked, and traceable end-to-end (work package
   → Mission → Order → decision → intent).
5. An Order's transition into execution requires CEO approval of the derived work
   packages; Orion never approves its own Order into execution.

## Consequences

- Executive direction becomes auditable and reversible: every execution traces
  back to an Order, a decision, and its evidence.
- The Missions layer prevents the boundary from collapsing under time pressure —
  there is no shortcut from direction to agents.
- Maestro needs no change; it continues to consume CEO-approved work packages.

## Non-Goals

- This MAD does not define the Order storage format, schema, or engine internals
  (architecture and later increments own those).
- This MAD does not modify Maestro's admission contract or approval matrix.
- This MAD does not grant Orion execution authority (see MAD-0011).

## Review Notes

This decision emerged from OR-A1. It protects MAD-0011's boundary by making the
Missions layer mandatory, and supports MES-001 (evidence, reversibility) and
MES-401 (CEO approval, separation of duties). This MAD does not self-accept.

**Acceptance record.** Independent review: ORR-OR-A1-MAD-0010-0012 (commit
`c29aa0c4e25682f056089b3b31d41bebed6e0232`) — recommended Accept; advisory
F-12.1 (Gateway dependency-status) resolved as the Implementation Gate above.
**CEO acceptance: 2026-07-14.** This is the final authority action; Status
above is now Accepted. The Executive Order Engine and seam build increment are
authorized subject to their own OWP, MES-101/102/103, and the Implementation
Gate above.
