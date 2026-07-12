# MES-104: Deployment Standard

| Field | Value |
|-------|-------|
| **Standard ID** | MES-104 |
| **Title** | Deployment Standard |
| **Version** | 1.0.0 |
| **Status** | Active |
| **Owner** | Operations Owner |
| **Category** | Engineering (100) |
| **Effective Date** | 2026-07-12 |
| **Supersedes** | None |
| **Applies To** | All deployments to shared and production environments |
| **Dependencies** | MES-001, MES-101, MES-103 |
| **Last Reviewed** | 2026-07-12 |

---

## 1. Purpose

This standard defines **how software is deployed safely**. Its central value,
inherited from MES-001, is that **production safety outweighs delivery speed**.
It ensures every deployment is backed up, verified, reversible, and reported.

## 2. Scope

Applies to any deployment that affects a shared or production environment,
performed by a human or an AI agent. Covers backups, the deployment workflow,
verification, rollback, production validation, and deployment reporting.

Out of scope: product-specific infrastructure topology and CI/CD tooling
configuration, which live in product repositories.

## 3. Principles

- **Never deploy without a way back.** A rollback path exists before deployment
  begins.
- **Back up before you change.** Recoverable state precedes any mutation.
- **Verify, don't assume.** A deployment is not done until it is validated live.
- **Every deployment leaves a record.** What shipped, when, by whom, and how it
  was verified.

## 4. Mandatory Requirements

### 4.1 Backups

- **MR-1.** Before any production deployment that can alter persistent state, a
  **verified backup** or restore point MUST exist.
- **MR-2.** The restore procedure for that backup MUST be known and, where
  feasible, previously tested.

### 4.2 Deployment Workflow

- **MR-3.** Deployments MUST proceed through defined stages (e.g. non-production
  → production) with validation at each promoted stage.
- **MR-4.** The artifact deployed to production MUST be the same artifact
  validated earlier — build once, promote the same build.
- **MR-5.** A deployment MUST have a named owner accountable for it from start to
  verified completion.

### 4.3 Verification

- **MR-6.** Immediately after deployment, the owner MUST run defined health and
  functional checks and MUST capture their results as evidence (MES-001 MR-2).

### 4.4 Rollback

- **MR-7.** A rollback plan MUST exist before deployment and MUST define the
  trigger conditions, the procedure, and the expected recovery time.
- **MR-8.** If verification fails and cannot be remedied quickly and safely,
  rollback MUST be executed.

### 4.5 Production Validation

- **MR-9.** Production validation MUST confirm the capability works for its
  intended users, not merely that the service started.
- **MR-10.** Validation evidence feeds the **Operational Complete** criterion of
  MES-103.

### 4.6 Deployment Reporting

- **MR-11.** Every production deployment MUST produce a **Deployment Report**
  following Section 7.

## 5. Recommended Practices

- Prefer progressive rollout (canary, blue/green, staged) for higher-risk changes.
- Automate health checks and make their output part of the report.
- Deploy during windows that maximize available support and minimize user impact.
- Rehearse rollback periodically so it is routine, not improvised.

## 6. Exceptions

Emergency incident-response deployments MAY compress the workflow to restore
service, but MUST still take a restore point where feasible, MUST retain a
rollback path, and MUST produce a Deployment Report retrospectively within one
business day. Any exception MUST be recorded and flagged to the Operations Owner.

## 7. Deliverables — Deployment Report Structure

1. **Deployment Summary** — what shipped, version/artifact, environment, owner.
2. **Backup & Restore Point** — what was backed up and how to restore.
3. **Workflow Executed** — stages and validations performed.
4. **Verification Results** — health/functional checks and their evidence.
5. **Rollback Plan** — trigger, procedure, recovery time (and whether invoked).
6. **Production Validation** — confirmation the capability works for users.
7. **Outcome** — success, partial, or rolled back, with follow-ups.

## 8. Checklist

- [ ] Verified backup / restore point exists.
- [ ] Rollback plan defined before deployment.
- [ ] Same artifact promoted from a validated stage.
- [ ] Named owner accountable throughout.
- [ ] Post-deploy health and functional checks run and evidenced.
- [ ] Production validation confirms real user-facing function.
- [ ] Deployment Report produced.

## 9. References

- MES-001 Enterprise Constitution
- MES-101 Implementation Standard
- MES-103 Milestone Completion Standard
- RFC 2119 — Requirement Level Keywords

## 10. Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-07-12 | Operations Owner | Initial deployment standard covering backups, workflow, verification, rollback, production validation, and reporting. |
