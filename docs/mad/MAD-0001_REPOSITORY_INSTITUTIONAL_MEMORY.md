# MAD-0001: Repository Institutional Memory

| Field | Value |
|---|---|
| MAD ID | MAD-0001 |
| Title | Repository Institutional Memory |
| Status | Accepted |
| Date | 2026-07-13 |
| Owner | Enterprise Standards Board |
| Scope | Maestro governance, MES standards, AI-agent operating decisions |
| MES Cross-References | MES-001 MR-2, MR-3; MES-401 MR-8, MR-10 |

## Context

Maestro governance work often occurs through AI-agent conversations. Those
conversations are useful working context, but they are not durable,
reviewable, or discoverable enough to act as permanent institutional memory.

MES-001 requires significant claims to have evidence a reviewer can verify, and
requires AI agents to state assumptions and omissions. MES-401 requires agents
to attach evidence to deliverables. A chat-only decision cannot satisfy those
requirements once the conversation is no longer in scope for a later reviewer.

## Decision

The repository is the authoritative institutional memory for permanent Maestro
governance decisions.

Permanent governance decisions MUST be recorded in tracked repository
documentation immediately after acceptance. Chat memory, model memory, issue
comments, and local recollection are not authoritative unless they are captured
in the repository.

## Accepted Permanent Rules

1. The repository is the source of truth for Maestro institutional memory.
2. Permanent governance decisions must be recorded immediately, not left in
   chat memory.
3. A decision is not binding on future agents until it is committed or otherwise
   present in tracked repository documentation.
4. Governance artifacts must be written so a future human or AI reviewer can
   understand the decision without access to the original conversation.

## Consequences

- MADs are created for permanent architecture and governance decisions.
- MES updates remain the mechanism for standards; MADs record the decision
  history and rationale that may later justify a standard update.
- Agents must not rely on "we decided this earlier in chat" as authority.
- If a decision affects future work, the responsible agent records it before
  proceeding to dependent work.

## Non-Goals

- This MAD does not make every conversation artifact permanent.
- This MAD does not replace MES standards.
- This MAD does not require recording transient implementation preferences.

## Review Notes

This decision reinforces MES-001's evidence requirement and MES-401's agent
deliverable requirements. It is governance documentation only; no application
repository or runtime behavior changes are authorized.
