#!/usr/bin/env bash
# One-way publish of Maestro institutional-memory documents to Google Drive.
#
#   git repository (authoritative) --> Drive folder "Maestro Institutional Memory"
#
# Scope is defined by scripts/sync-allowlist.txt and restricted to git-tracked
# files, so untracked/temporary files can never leak. Copy-only: nothing is
# ever deleted on the Drive side (see MAD-0006).
#
# Requires: rclone remote "maestro-drive" configured with scope=drive.file.
# Credentials live in ~/.config/rclone/rclone.conf — never in this repository.

set -euo pipefail

REMOTE_NAME="maestro-drive"
DEST="${REMOTE_NAME}:Maestro Institutional Memory"

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

ALLOWLIST="$REPO_ROOT/scripts/sync-allowlist.txt"
SYNC_DIR="$REPO_ROOT/.sync"
mkdir -p "$SYNC_DIR"

RUN_LOG="$SYNC_DIR/rclone-last-run.log"
MANIFEST="$SYNC_DIR/manifest.json"
HISTORY_LOG="$SYNC_DIR/sync.log"

command -v rclone >/dev/null || { echo "ERROR: rclone not installed" >&2; exit 1; }
rclone listremotes | grep -qx "${REMOTE_NAME}:" || {
  echo "ERROR: rclone remote '${REMOTE_NAME}' not configured." >&2
  echo "Run: rclone config create ${REMOTE_NAME} drive scope=drive.file" >&2
  exit 1
}

# Build file list: allowlisted paths, git-tracked files only.
FILELIST="$SYNC_DIR/files-to-sync.txt"
grep -v -e '^#' -e '^[[:space:]]*$' "$ALLOWLIST" | xargs git ls-files -- > "$FILELIST"
FILE_COUNT="$(wc -l < "$FILELIST" | tr -d ' ')"
[ "$FILE_COUNT" -gt 0 ] || { echo "ERROR: allowlist matched no tracked files" >&2; exit 1; }

# Guard: refuse to sync anything that looks credential-shaped.
if SUSPECT="$(grep -i -E '(^|/)[^/]*(\.env|secret|credential|token|\.pem|\.key)[^/]*$' "$FILELIST")"; then
  echo "ERROR: refusing to sync files matching secret patterns:" >&2
  echo "$SUSPECT" >&2
  exit 1
fi

COMMIT_SHA="$(git rev-parse HEAD)"
DIRTY="false"
git diff --quiet HEAD -- $(grep -v -e '^#' -e '^[[:space:]]*$' "$ALLOWLIST") || DIRTY="true"
TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

echo "Syncing $FILE_COUNT files @ ${COMMIT_SHA:0:12} (dirty=$DIRTY) -> $DEST"

# Copy-only transfer. rclone copy never deletes destination files.
RCLONE_EXIT=0
rclone copy "$REPO_ROOT" "$DEST" \
  --files-from "$FILELIST" \
  --checksum \
  --log-level INFO \
  --log-file "$RUN_LOG" \
  || RCLONE_EXIT=$?

# Collect failures (rclone logs transfer errors as ERROR lines).
FAILURES="$(grep ' ERROR ' "$RUN_LOG" 2>/dev/null | sed 's/"/\\"/g' | sed 's/^/    "/;s/$/",/' || true)"
FAILURES="${FAILURES%,}"

STATUS="success"
[ "$RCLONE_EXIT" -eq 0 ] || STATUS="failed"

# Manifest: provenance record written locally, then published to Drive.
{
  echo "{"
  echo "  \"source_repository\": \"maestro-enterprise-standards\","
  echo "  \"source_commit_sha\": \"$COMMIT_SHA\","
  echo "  \"working_tree_dirty\": $DIRTY,"
  echo "  \"synchronized_at_utc\": \"$TIMESTAMP\","
  echo "  \"status\": \"$STATUS\","
  echo "  \"rclone_exit_code\": $RCLONE_EXIT,"
  echo "  \"file_count\": $FILE_COUNT,"
  echo "  \"files\": ["
  sed 's/^/    "/;s/$/",/' "$FILELIST" | sed '$ s/,$//'
  echo "  ],"
  echo "  \"failures\": ["
  if [ -n "$FAILURES" ]; then echo "$FAILURES"; fi
  echo "  ]"
  echo "}"
} > "$MANIFEST"

rclone copyto "$MANIFEST" "$DEST/_SYNC_MANIFEST.json" --log-level ERROR || {
  echo "WARNING: manifest upload failed; local copy at $MANIFEST" >&2
}

echo "$TIMESTAMP commit=${COMMIT_SHA:0:12} files=$FILE_COUNT status=$STATUS" >> "$HISTORY_LOG"

if [ "$STATUS" = "success" ]; then
  echo "Sync complete: $FILE_COUNT files published."
else
  echo "Sync FAILED (exit $RCLONE_EXIT). See $RUN_LOG" >&2
  exit "$RCLONE_EXIT"
fi
