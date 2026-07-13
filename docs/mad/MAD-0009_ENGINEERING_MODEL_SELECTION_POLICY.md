# MAD-0009: Engineering Model Selection Policy

| Field | Value |
|---|---|
| MAD ID | MAD-0009 |
| Title | Engineering Model Selection Policy |
| Status | Accepted |
| Date | 2026-07-13 |
| Owner | Architecture Owner |
| Scope | Advisory AI model recommendation for governed engineering missions |
| MES Cross-References | MES-001 MR-2, MR-3, MR-5; MES-401 MR-1, MR-11 |

## Context

Maestro issues engineering missions to Claude across a wide range of work:
architecture design, MAD and MWP creation, refactoring design, bounded
implementation, corrections, tests, and documentation. These tasks differ in
reasoning depth, cost, and latency, and are best served by different AI models.

Today model choice is left implicit at the operator, producing inconsistent
selection and no durable record of which model class a mission was intended
for. MAD-0004 defines Engineering Directions as organizational communication
artifacts. MAD-0007 adds an explicit Session Type field to those directions.
Model selection is the same kind of organizational decision: it shapes context
quality, cost, and turnaround, and belongs in the mission header rather than in
an agent's private judgment.

Model recommendation is advisory. It informs the operator which model class
fits the work. It does not grant, expand, or restrict engineering authority,
and it does not alter governance, boundaries, or acceptance criteria, which
remain fixed by MES + MAD + MWP + MRP.

## Decision

Every engineering mission addressed to Claude SHALL explicitly specify a
`Recommended Model` field.

The recommended model is advisory to the operator. It does not alter the
engineering authority, governance, boundaries, or acceptance criteria of the
mission.

The field declares one model class:

```
Recommended Model:
<Opus | Sonnet>
```

## Recommended Model: Opus

Use for:

- MAD creation
- MWP creation
- Architecture design
- Architecture review response
- Major refactoring design
- Complex trade-off analysis
- Cross-system engineering decisions

## Recommended Model: Sonnet

Use for:

- Implementation
- Corrections
- Delta corrections
- Bug fixes
- Test implementation
- Refactoring implementation
- Documentation implementation
- MCR implementation
- Existing architecture execution
- Bounded work packages
- Routine engineering

## Accepted Permanent Rules

1. Every future engineering prompt to Claude MUST include a `Recommended Model`
   field declaring `Opus` or `Sonnet`.
2. The recommended model is advisory to the operator.
3. Model recommendation MUST NOT modify governance.
4. Model recommendation MUST NOT change acceptance gates.
5. Engineering authority remains MES + MAD + MWP + MRP.

## Consequences

- Every mission carries an explicit, auditable statement of intended model
  class.
- Operators receive a consistent signal for matching model capability to work
  type.
- Deep-reasoning work (design, MADs, trade-off analysis) is steered toward
  Opus; bounded execution is steered toward Sonnet.
- No governance, authority, or acceptance behavior changes as a result of the
  field.

## Non-Goals

This MAD records an advisory policy only. It explicitly does not:

- Introduce automatic model switching.
- Introduce runtime model selection.
- Introduce cost optimization logic.
- Introduce vendor-specific behavior.
- Modify MES-401 role assignments or separation-of-duties requirements.
- Grant implementation, deployment, or production authority by itself.

## Review Notes

This decision extends MAD-0004 by adding an advisory `Recommended Model` field
to engineering missions, and parallels MAD-0007 by treating model selection as
an organizational header decision rather than an in-session implementation
detail. It supports MES-401 by improving mission clarity while leaving role
assignments, authority, and acceptance gates unchanged.
