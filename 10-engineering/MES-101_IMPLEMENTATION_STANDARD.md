# MES-101: Implementation Standard

| Field | Value |
|-------|-------|
| **Standard ID** | MES-101 |
| **Title** | Implementation Standard |
| **Version** | 1.0.0 |
| **Status** | Active |
| **Owner** | Engineering Practice Owner |
| **Category** | Engineering (100) |
| **Effective Date** | 2026-07-12 |
| **Supersedes** | None |
| **Applies To** | All engineering work across all MES-governed projects |
| **Dependencies** | MES-001 |
| **Last Reviewed** | 2026-07-12 |

---

## 1. Purpose

This standard defines **how implementation work is carried out** — from picking
up a task to declaring it complete. It exists so that any engineer or AI agent,
on any project, produces work that is consistent, reviewable, and safe to
integrate.

It governs process, not product. It says how we branch, commit, test, and
document; it does not say what any product's code should look like.

## 2. Scope

Applies to all code, configuration, and infrastructure changes delivered under
MES, whether authored by a human or an AI agent.

Out of scope: product-specific architecture, language style guides, and
framework conventions — these live in the relevant product repository.

## 3. Principles

- **Small, coherent changes** are easier to review, test, and revert.
- **The main branch is always releasable.**
- **Tests and documentation are part of the change**, not a follow-up.
- **A change is not done until it is verified**, not merely written.
- **Traceability matters** — every change should be explainable from its history.

## 4. Mandatory Requirements

### 4.1 Implementation Workflow

- **MR-1.** Every unit of work MUST begin from an up-to-date base branch and be
  developed on a dedicated feature branch.
- **MR-2.** Work MUST be scoped so that a change can be reviewed in a single
  focused sitting; large efforts MUST be decomposed.
- **MR-3.** The author MUST self-verify the change against its acceptance
  criteria before requesting review.

### 4.2 Branch Strategy

- **MR-4.** Feature branches MUST use a descriptive, namespaced name (e.g.
  `feature/<scope>`, `fix/<scope>`, or an agent/owner prefix).
- **MR-5.** Feature branches MUST NOT be reused after their pull request is
  merged; new work starts from a fresh branch off the latest base.
- **MR-6.** Direct commits to protected branches (e.g. `main`) are PROHIBITED;
  all changes land through review.

### 4.3 Commits

- **MR-7.** Commits MUST be atomic — one logical change per commit.
- **MR-8.** Commit messages MUST have a concise imperative subject and, where
  the change is non-trivial, a body explaining *why*.
- **MR-9.** Commit history MUST NOT contain secrets, credentials, or generated
  artifacts that belong in ignore rules.

### 4.4 Testing Expectations

- **MR-10.** New behavior MUST be covered by automated tests appropriate to the
  change (unit, integration, or end-to-end).
- **MR-11.** Bug fixes MUST include a test that fails before the fix and passes
  after it.
- **MR-12.** The full relevant test suite MUST pass before a change is submitted
  for review, and the result MUST be reported as evidence (MES-001 MR-2).

### 4.5 Documentation Expectations

- **MR-13.** User-facing or interface changes MUST be reflected in the relevant
  documentation within the same change.
- **MR-14.** Non-obvious decisions MUST be documented close to the code or in
  the change description.

### 4.6 Completion Criteria

- **MR-15.** A change is complete only when: acceptance criteria are met, tests
  pass, documentation is updated, and evidence is attached. Milestone-level
  completion is additionally governed by **MES-103**.

## 5. Recommended Practices

- Open a draft early to gather feedback on direction before polishing.
- Keep the branch rebased on its base to minimize integration surprises.
- Prefer feature flags for risky or incremental rollouts.
- Include reproduction steps and screenshots/logs where they aid the reviewer.

## 6. Exceptions

Hotfixes for active production incidents MAY bypass non-safety steps to restore
service, but MUST be reconciled — tests, documentation, and review — within one
business day. Any such exception MUST be recorded in the change history and
flagged to the Engineering Practice Owner.

## 7. Deliverables

- A reviewable pull request on a dedicated branch.
- Passing tests with reported results.
- Updated documentation.
- A change description stating scope, approach, assumptions, and evidence.

## 8. Checklist

- [ ] Work started from an up-to-date base on a dedicated branch.
- [ ] Change is atomic and appropriately scoped.
- [ ] Commits are atomic with clear messages and no secrets.
- [ ] New behavior is covered by tests; fixes include a regression test.
- [ ] Full relevant test suite passes; results attached as evidence.
- [ ] Documentation updated in the same change.
- [ ] Acceptance criteria met and self-verified.
- [ ] Assumptions and omissions stated explicitly.

## 9. References

- MES-001 Enterprise Constitution
- MES-102 Code Review Standard
- MES-103 Milestone Completion Standard
- MES-104 Deployment Standard
- RFC 2119 — Requirement Level Keywords

## 10. Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-07-12 | Engineering Practice Owner | Initial implementation standard covering workflow, branching, commits, testing, documentation, and completion. |
