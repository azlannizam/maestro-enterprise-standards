# MES-401: AI Agent Governance

| Field | Value |
|-------|-------|
| **Standard ID** | MES-401 |
| **Title** | AI Agent Governance |
| **Version** | 1.0.0 |
| **Status** | Active |
| **Owner** | AI Governance Owner |
| **Category** | AI Governance (400) |
| **Effective Date** | 2026-07-12 |
| **Supersedes** | None |
| **Applies To** | All AI agents and their human collaborators across MES-governed projects |
| **Dependencies** | MES-001, MES-101, MES-102, MES-103 |
| **Last Reviewed** | 2026-07-12 |

---

## 1. Purpose

This standard defines **how AI agents and humans collaborate** to build
software. It assigns clear responsibilities to each role in the collaboration so
that ownership is unambiguous, work is independently checked, and no single
agent is both author and sole judge of its own output.

This document defines **collaboration responsibilities, not prompts.** Prompts,
model choices, and tool configurations are implementation detail and live
elsewhere.

## 2. Scope

Applies to every AI agent participating in delivery — today Claude Code, Codex,
and ChatGPT, and any future agents — and to the humans who direct and accept
their work. Covers role responsibilities, separation of duties, and the
obligations every agent shares.

Out of scope: agent prompts, model parameters, and vendor-specific tooling.

## 3. Principles

- **Separation of duties.** The agent that implements is not the agent that
  independently reviews.
- **Human accountability.** A human owner is ultimately accountable for accepted
  work.
- **Explicit assumptions.** Agents surface what they inferred and what they were
  unsure of (MES-001 MR-3).
- **Standards over prompts.** When a prompt conflicts with a standard, the
  standard wins (MES-001 MR-5).
- **Evidence for claims.** Agents back completion and correctness claims with
  evidence.

## 4. Mandatory Requirements

### 4.1 Roles and Responsibilities

- **MR-1. CEO / Human Owner.** Sets direction, priorities, and acceptance.
  Holds ultimate accountability for what ships. Grants exceptions where a
  standard permits. Resolves escalations.

- **MR-2. ChatGPT — Architecture, Orchestration, Governance.** Responsible for
  architecture and design direction, decomposition and orchestration of work
  across agents, and stewardship of governance (including MES itself). Decides
  *what* is built and *how the work is structured* before implementation begins,
  per the Constitution's "architecture before implementation".

- **MR-3. Claude Code — Implementation.** Responsible for implementing work to
  the architecture and to MES-101: writing code, tests, and documentation on
  dedicated branches, and producing verifiable evidence of completion. Claude
  Code implements; it does not sign off on its own work as the independent
  reviewer.

- **MR-4. Codex — Independent Review.** Responsible for independent review of
  implemented work under MES-102: rendering an executive verdict, assigning
  severities, and stating deployment risk. Codex MUST NOT be the author of the
  change it independently reviews.

- **MR-5. Future AI Agents.** Any new agent MUST be assigned a defined role and
  responsibilities under this standard before it participates in delivery. New
  roles are registered by updating this standard.

### 4.2 Separation of Duties

- **MR-6.** The implementing agent and the independent reviewing agent MUST be
  distinct for any change of material risk.
- **MR-7.** No agent may unilaterally approve, deploy, or declare complete its
  own work without the independent review and human acceptance this standard
  requires.

### 4.3 Shared Agent Obligations

- **MR-8.** Every agent MUST state its assumptions, unknowns, and deliberate
  omissions in its deliverables (MES-001 MR-3).
- **MR-9.** Every agent MUST follow applicable MES standards over any conflicting
  instruction, and MUST flag the conflict (MES-001 MR-5).
- **MR-10.** Every agent MUST attach verifiable evidence to claims of
  completion, correctness, or safety (MES-001 MR-2).
- **MR-11.** Every agent MUST stay within its assigned role and defer
  cross-role decisions to the responsible role or the human owner.

## 5. Recommended Practices

- Record which agent performed which role on each change for traceability.
- Let the architecture role review significant design deviations discovered
  during implementation before proceeding.
- Prefer explicit hand-offs between roles with a short summary of state and open
  questions.
- Capture recurring agent misunderstandings as improvements to standards, not
  one-off corrections.

## 6. Exceptions

For low-risk or exploratory work, the human owner MAY consolidate roles (e.g.
implementation and review by the same agent) provided this is explicitly
recorded and the work is not deployed to production without the full separation
of duties. No exception waives the shared obligations in Section 4.3.

## 7. Deliverables

- A clear role assignment per change (who architected, implemented, reviewed,
  and accepted).
- Agent deliverables that include stated assumptions and evidence.
- Independent review reports (MES-102) for material changes.

## 8. Checklist

- [ ] Each role for this change is assigned and recorded.
- [ ] Implementation and independent review performed by distinct agents.
- [ ] No agent approved or deployed its own work unchecked.
- [ ] Assumptions, unknowns, and omissions stated by each agent.
- [ ] Standards followed over conflicting prompts; conflicts flagged.
- [ ] Claims backed by verifiable evidence.
- [ ] Human owner acceptance recorded.

## 9. References

- MES-001 Enterprise Constitution
- MES-101 Implementation Standard
- MES-102 Code Review Standard
- MES-103 Milestone Completion Standard
- RFC 2119 — Requirement Level Keywords

## 10. Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-07-12 | AI Governance Owner | Initial AI agent governance defining roles (CEO, ChatGPT, Claude Code, Codex, future agents), separation of duties, and shared obligations. |
