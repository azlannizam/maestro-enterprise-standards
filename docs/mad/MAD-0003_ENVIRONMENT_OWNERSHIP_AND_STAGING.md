# MAD-0003: Environment Ownership and Staging

| Field | Value |
|---|---|
| MAD ID | MAD-0003 |
| Title | Environment Ownership and Staging |
| Status | Accepted |
| Date | 2026-07-13 |
| Owner | Operations Owner |
| Scope | Environment ownership, staging governance, AI operational environments |
| MES Cross-References | MES-001 MR-4; MES-104; MES-401 MR-1, MR-2, MR-11 |

## Context

Maestro-governed delivery uses multiple environments: local development,
review branches, staging, and production. Ambiguous ownership creates
operational risk: agents may wait for the CEO to move artifacts, verify state,
or coordinate staging activity manually.

MES-001 requires production safety and reversibility over speed. MES-104 governs
deployment practice. MES-401 assigns ChatGPT architecture, orchestration, and
governance responsibility while preserving CEO accountability.

## Decision

Every environment has a defined owner.

Staging belongs to Maestro as an AI operational environment, not to the CEO as a
manual courier or operator. The CEO remains accountable for acceptance and
business direction, but staging coordination, evidence flow, and environment
state handoff are Maestro operational responsibilities.

## Accepted Permanent Rules

1. Every environment must have a named owner or owning function.
2. Staging is an AI operational environment used for agent-coordinated
   verification, review evidence, and deployment readiness.
3. Staging does not belong to the CEO as a manual handoff workspace.
4. The CEO may approve, reject, or prioritize staging outcomes, but should not
   be required to carry artifacts between agents or environments.
5. Environment ownership must be recorded in the relevant plan, deployment
   artifact, MAD, or MES standard before the environment is relied on.
6. If an environment has no defined owner, it is not ready to serve as a gate
   for production work.

## Consequences

- Staging plans must name the owning function and responsible agent role.
- Operational evidence should move through repository artifacts, deployment
  records, logs, screenshots, or other durable channels, not CEO relay.
- Production remains governed by MES-104 and any product-specific deployment
  gate doctrine.
- Future environment additions require ownership assignment before use.

## Non-Goals

- This MAD does not grant Maestro a write path into product systems of record.
- This MAD does not bypass human approval for production changes.
- This MAD does not define product-specific staging infrastructure.

## Review Notes

This decision supports MES-001 production safety by reducing ambiguous
environment responsibility. It also supports MES-401 by keeping orchestration
with Maestro while preserving CEO accountability for acceptance.
