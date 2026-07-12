# MES-102: Code Review Standard

| Field | Value |
|-------|-------|
| **Standard ID** | MES-102 |
| **Title** | Code Review Standard |
| **Version** | 1.0.0 |
| **Status** | Active |
| **Owner** | Engineering Practice Owner |
| **Category** | Engineering (100) |
| **Effective Date** | 2026-07-12 |
| **Supersedes** | None |
| **Applies To** | All code review activity across MES-governed projects, human or AI |
| **Dependencies** | MES-001, MES-101 |
| **Last Reviewed** | 2026-07-12 |

---

## 1. Purpose

This standard defines **how changes are reviewed** and **how review findings are
reported**. It ensures reviews are consistent, evidence-based, and decisive, so
that authors receive a clear verdict and reviewers apply the same bar across
every project.

## 2. Scope

Applies to every review of a change proposed for integration, including reviews
performed by independent AI agents (see MES-401). Covers the review process, the
severity model, and the required report structure.

Out of scope: language-specific lint rules and product architecture review
criteria, which live in product repositories.

## 3. Principles

- **A review renders a decision**, not just a list of comments.
- **Severity drives action.** Findings are ranked so the author knows what
  blocks and what does not.
- **Evidence over opinion.** A finding names the risk and how to reproduce or
  confirm it.
- **Deployment risk is explicit.** Every review states what shipping this change
  would mean for production.

## 4. Mandatory Requirements

### 4.1 Executive Verdict

- **MR-1.** Every review MUST open with one of the following executive verdicts:
  - **APPROVE** — safe to merge as-is.
  - **APPROVE WITH COMMENTS** — safe to merge after minor, non-blocking fixes.
  - **REQUEST CHANGES** — one or more blocking issues must be resolved.
  - **REJECT** — the approach is unsound; rework required before re-review.

### 4.2 Severity Definitions

- **MR-2.** Every finding MUST be assigned exactly one severity:

  | Severity | Definition | Effect |
  |----------|------------|--------|
  | **Critical** | Data loss, security breach, or production outage risk. | Blocks merge. |
  | **High** | Incorrect behavior or significant regression. | Blocks merge. |
  | **Medium** | Meaningful defect or maintainability risk. | Should fix before merge. |
  | **Low** | Minor improvement or style concern. | Optional. |
  | **Info** | Observation or praise; no action required. | None. |

### 4.3 Review Categories

- **MR-3.** Reviewers MUST consider, at minimum, these categories and note
  which were assessed:
  - Correctness and logic
  - Security and data handling
  - Performance and scalability
  - Maintainability and readability
  - Test coverage and quality
  - Documentation
  - Backward compatibility (per MES-001)

### 4.4 Evidence Expectations

- **MR-4.** Each Critical or High finding MUST include enough evidence to
  reproduce or confirm it — a failing case, a code path, or a concrete scenario.
- **MR-5.** Claims of correctness or safety in the review MUST be verifiable, per
  MES-001 MR-2.

### 4.5 Deployment Risk

- **MR-6.** Every review MUST state the **deployment risk** of shipping the
  change: what could go wrong in production, and what would mitigate it.

### 4.6 Report Structure

- **MR-7.** The review report MUST follow the structure in Section 7.

## 5. Recommended Practices

- Lead with the most severe findings; do not bury a Critical under nitpicks.
- Separate "must fix" from "nice to have" so authors can triage quickly.
- Prefer suggestions that show the fix over comments that only name the problem.
- Acknowledge strengths; reviews are also a teaching instrument.

## 6. Exceptions

Trivial changes (e.g. typo fixes, comment-only edits) MAY use an abbreviated
report containing only the executive verdict and deployment risk. Emergency
hotfix reviews MAY be expedited but MUST still state a verdict and deployment
risk.

## 7. Deliverables

A review report containing, in order:

1. **Executive Verdict** — one of the four verdicts.
2. **Summary** — what the change does and the overall assessment.
3. **Findings** — grouped by severity, each with category, evidence, and a
   recommended fix.
4. **Deployment Risk** — production impact and mitigations.
5. **Categories Assessed** — which review categories were covered.
6. **Evidence Index** — pointers to reproductions, logs, or tests relied upon.

## 8. Checklist

- [ ] Executive verdict stated up front.
- [ ] Every finding has exactly one severity.
- [ ] All required categories were considered and noted.
- [ ] Critical/High findings include reproducible evidence.
- [ ] Deployment risk is stated with mitigations.
- [ ] Report follows the required structure.
- [ ] Backward-compatibility impact assessed.

## 9. References

- MES-001 Enterprise Constitution
- MES-101 Implementation Standard
- MES-103 Milestone Completion Standard
- MES-401 AI Agent Governance
- RFC 2119 — Requirement Level Keywords

## 10. Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-07-12 | Engineering Practice Owner | Initial code review standard defining verdicts, severities, categories, evidence, deployment risk, and report structure. |
