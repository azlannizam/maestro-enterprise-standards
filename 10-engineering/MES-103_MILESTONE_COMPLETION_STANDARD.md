# MES-103: Milestone Completion Standard

| Field | Value |
|-------|-------|
| **Standard ID** | MES-103 |
| **Title** | Milestone Completion Standard |
| **Version** | 1.0.0 |
| **Status** | Active |
| **Owner** | Engineering Practice Owner |
| **Category** | Engineering (100) |
| **Effective Date** | 2026-07-12 |
| **Supersedes** | None |
| **Applies To** | Milestone and release closure across MES-governed projects |
| **Dependencies** | MES-001, MES-101, MES-102, MES-104 |
| **Last Reviewed** | 2026-07-12 |

---

## 1. Purpose

This standard defines what it means for a **milestone** to be genuinely
complete. It exists because "done" is often claimed before work is truly
finished — code merged but not operational, features built but not verified in
production, reports asserting completion without an evidence trail.

It draws directly on lessons from the **Maestro M0 Completion Report review**,
where the gap between *implementation complete* and *operationally complete* was
the central finding. This standard closes that gap by separating the two and
requiring evidence for both.

## 2. Scope

Applies to the closure of any named milestone, phase, or release. Governs the
distinction between implementation and operational completion, the evidence
index, the closure checklist, and the milestone report.

Out of scope: the definition of individual task completion (MES-101) and the
mechanics of deployment (MES-104), which this standard references.

## 3. Principles

- **Implementation complete is not operational complete.** Code merged is a
  step, not the finish line.
- **Completion is proven, not asserted.** Every completion claim maps to
  evidence (MES-001 MR-2).
- **A milestone owns an evidence index**, not scattered links.
- **Closure is a deliberate act** with a checklist and a report, not a silent
  transition.

## 4. Mandatory Requirements

### 4.1 Two Definitions of Complete

- **MR-1. Implementation Complete.** All planned work is built, reviewed
  (MES-102), merged, and its tests pass. This is a *necessary but insufficient*
  condition for milestone completion.
- **MR-2. Operational Complete.** The delivered capability is deployed
  (MES-104), verified in its target environment, monitored, and demonstrably
  working for its intended users. A milestone is only complete when it is
  **operationally** complete.

### 4.2 Evidence Index

- **MR-3.** Every milestone MUST maintain an **Evidence Index** — a single,
  navigable list mapping each completion claim to its proof (test runs, deploy
  logs, verification screenshots, monitoring dashboards, sign-offs).
- **MR-4.** Each entry in the Evidence Index MUST identify the claim, the
  evidence type, and where the evidence lives.

### 4.3 Closure Checklist

- **MR-5.** A milestone MUST NOT be declared complete until its **Closure
  Checklist** (Section 8) is fully satisfied, with each item evidenced.

### 4.4 Milestone Report

- **MR-6.** Milestone closure MUST produce a **Milestone Completion Report**
  following the structure in Section 7.
- **MR-7.** The report MUST distinguish implementation completion from
  operational completion and MUST NOT claim operational completion without
  verification evidence.
- **MR-8.** Known gaps, deferrals, and follow-ups MUST be listed explicitly; a
  milestone may close with documented, accepted gaps but MUST NOT hide them.

## 5. Recommended Practices

- Build the Evidence Index incrementally as work lands, not at the end.
- Include a short "how to verify" note per capability so reviewers can confirm
  independently.
- Capture a production verification artifact (screenshot, log excerpt, metric)
  at the moment of validation.
- Hold a brief closure review with an independent reviewer before sign-off.

## 6. Exceptions

An **internal, non-production** milestone MAY treat "operational complete" as
"verified in the target non-production environment", provided the report states
this explicitly. No exception removes the requirement for an Evidence Index and
a report.

## 7. Deliverables — Milestone Completion Report Structure

1. **Milestone Summary** — objective, scope, and outcome.
2. **Implementation Completion** — what was built, reviewed, and merged.
3. **Operational Completion** — deployment, verification, and monitoring status.
4. **Evidence Index** — claims mapped to proof.
5. **Known Gaps & Deferrals** — accepted gaps, follow-ups, and their owners.
6. **Closure Checklist** — the completed checklist (Section 8).
7. **Sign-off** — who approved closure and when.

## 8. Closure Checklist

- [ ] All planned work implemented, reviewed (MES-102), and merged.
- [ ] All relevant tests pass with results recorded.
- [ ] Capability deployed per MES-104.
- [ ] Capability verified in its target environment.
- [ ] Monitoring/observability in place and confirmed.
- [ ] Evidence Index complete and navigable.
- [ ] Known gaps and deferrals documented with owners.
- [ ] Milestone Completion Report produced.
- [ ] Independent sign-off recorded.

## 9. References

- MES-001 Enterprise Constitution
- MES-101 Implementation Standard
- MES-102 Code Review Standard
- MES-104 Deployment Standard
- Maestro M0 Completion Report review (lessons-learned source)

## 10. Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-07-12 | Engineering Practice Owner | Initial milestone completion standard separating implementation from operational completion, with evidence index, closure checklist, and report structure informed by the Maestro M0 review. |
