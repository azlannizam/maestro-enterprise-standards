# MAD-0006: Google Drive Institutional Memory Bridge

| Field | Value |
|---|---|
| MAD ID | MAD-0006 |
| Title | Google Drive Institutional Memory Bridge |
| Status | Accepted |
| Date | 2026-07-13 |
| Owner | AI Governance Owner |
| Scope | Publication of approved institutional memory to Google Drive for Orion Studio read access |
| MES Cross-References | MES-001 MR-2, MR-3; MES-401 MR-8, MR-10 |

## Context

Orion Studio operates in ChatGPT (MAD-0005) and reads reference material
through the owner's connected Google Drive. It cannot read this repository
directly. Without a bridge, the owner must copy and paste MES, MAD, and
milestone documents into conversations, which is slow and drifts from the
committed versions.

MAD-0001 establishes this repository as the authoritative institutional
memory. Any copy placed in Google Drive is therefore a derived, read-only
projection, never a competing source of truth.

## Decision

A one-way synchronization script publishes approved institutional-memory
documents from this repository to a dedicated Google Drive folder.

1. Direction is strictly `git repository → Google Drive`. Nothing is ever
   read back from Drive into the repository.
2. Git remains the authoritative source of truth. The Drive folder
   `Maestro Institutional Memory` is a read-access bridge for Orion Studio.
3. Scope is an explicit allowlist (`scripts/sync-allowlist.txt`):
   `MES_REGISTRY.md`, `00-foundation/`, `10-engineering/`, `40-ai/`,
   `docs/mad/`, `docs/history/`. Only git-tracked files are eligible, which
   structurally excludes untracked, temporary, and secret files.
4. Transfers are copy-only. The script never deletes Drive files. A deletion
   policy, if ever needed, requires a separate accepted MAD.
5. Every run publishes `_SYNC_MANIFEST.json` to the Drive folder recording
   the source commit SHA, UTC timestamp, working-tree dirty flag, file list,
   and any failures. A local history log is kept in `.sync/` (git-ignored).
6. Transport is `rclone` with an OAuth remote named `maestro-drive` using the
   `drive.file` scope, so the credential can only touch files the bridge
   itself created. Tokens live in `~/.config/rclone/rclone.conf` on the
   owner's machine and are never committed to any repository.

## Consequences

- Orion Studio reads current approved documents without copy-paste.
- Drive-side edits are non-authoritative and are overwritten by the next
  sync; git always wins.
- The sync runs on demand on the owner's machine (`scripts/sync-to-drive.sh`),
  typically after merges to `main`. Scheduling may be added later without a
  new MAD; deletion behavior may not.
- If the manifest and repository disagree, the repository is correct.
