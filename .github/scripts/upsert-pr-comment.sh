#!/usr/bin/env bash
# Idempotent PR-comment upserter shared by every workflow that posts a
# bot-tagged analysis comment: analyzer.yml, cascades-diff.yml,
# pattern-clusters-diff.yml, mega-cascades-diff.yml,
# match-invariants.yml, worklist-diff.yml.
#
# Why a shared script: until 2026-05-23 each workflow inlined this
# logic. PR #639's pr-tier-delta hit HTTP 401: Bad credentials on
# `gh pr comment` (which routes through GraphQL); other workflows
# would have hit the same bug eventually. Centralising the upsert lets
# us fix the auth path + retry behaviour once instead of six times.
#
# Usage:
#   .github/scripts/upsert-pr-comment.sh <marker> <body-file>
#
# Required env:
#   GH_TOKEN              auth token (usually ${{ secrets.GITHUB_TOKEN }})
#   PR_NUMBER             the PR number
#   GITHUB_REPOSITORY     owner/repo (set by Actions automatically)
#
# Behaviour:
#   - Searches existing PR comments for one whose body contains
#     <marker>. If found, PATCHes it in place. If not, POSTs a new one.
#   - Both API calls use REST (`gh api`), never `gh pr comment`. The
#     `gh pr comment` CLI subcommand goes through the GraphQL endpoint
#     in some auth contexts, which has occasionally returned HTTP 401
#     in GitHub Actions where the equivalent REST call succeeds.
#   - Each API call retries up to 3 times with progressive backoff
#     (5 s, 10 s) on any non-zero exit from `gh api`.
#   - Fail-soft: if all retries exhaust, emits a ::warning:: and exits
#     0. The workflow's actual analysis ran before this step; the
#     comment is informational and shouldn't block PR merges.

set -uo pipefail

MARKER="${1:?usage: $0 <marker> <body-file>}"
BODY_FILE="${2:?usage: $0 <marker> <body-file>}"
PR="${PR_NUMBER:?PR_NUMBER must be set in env}"
REPO="${GITHUB_REPOSITORY:?GITHUB_REPOSITORY must be set in env}"

if [ ! -f "${BODY_FILE}" ]; then
  echo "::error::Body file ${BODY_FILE} does not exist"
  exit 1
fi
BODY="$(cat "${BODY_FILE}")"

retry() {
  local attempt rc
  for attempt in 1 2 3; do
    if "$@"; then
      return 0
    fi
    rc=$?
    if [ "$attempt" -lt 3 ]; then
      local delay=$((attempt * 5))
      echo "::warning::API call failed with exit ${rc} (attempt ${attempt}/3), retrying in ${delay}s"
      sleep "${delay}"
    fi
  done
  return 1
}

# Lookup existing comment. stderr suppressed because the no-match case
# is normal (first comment on a new PR) and shouldn't fill the log.
existing_id=$(
  retry gh api "repos/${REPO}/issues/${PR}/comments" \
    --jq ".[] | select(.body | contains(\"${MARKER}\")) | .id" \
    2>/dev/null | head -n1
) || existing_id=""

if [ -n "${existing_id}" ]; then
  if ! retry gh api --method PATCH \
      "repos/${REPO}/issues/comments/${existing_id}" \
      -f body="${BODY}" >/dev/null
  then
    echo "::warning::Failed to update existing comment ${existing_id} after 3 attempts. Workflow analysis ran successfully but PR comment may be stale."
    exit 0
  fi
else
  if ! retry gh api --method POST \
      "repos/${REPO}/issues/${PR}/comments" \
      -f body="${BODY}" >/dev/null
  then
    echo "::warning::Failed to post new comment after 3 attempts. Workflow analysis ran successfully but PR comment was not posted."
    exit 0
  fi
fi
