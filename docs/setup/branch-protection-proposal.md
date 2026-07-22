# Proposed `main` branch protection

Status: proposal only. Nothing in this document has been applied to GitHub.

## Purpose

Require the repository's baseline static-analysis, generated-file, unit-test, and EUR metadata checks before merging pull requests to `main`. The USA and JPN invariant jobs remain informative matrix legs: their workflow already marks them `continue-on-error`, so the proposed rule requires only the EUR leg.

## Current state

As checked on 2026-07-22, GitHub reports that `main` is not branch-protected and the repository has no rulesets. An owner should review this proposal before applying it.

## Proposed required checks

Target branch: `main`.

Require these pull-request status checks to pass:

- `Python (ruff)`
- `Markdown (markdownlint-cli2)`
- `unittest`
- `drift-check`
- `pr-invariants (eur)`

The `pr-invariants` workflow is path-filtered to `config/**`, `src/**`, and its invariant tooling. GitHub will therefore require that check when it is triggered; documentation-only changes do not create a missing check that needs to be bypassed.

Recommended repository rules:

- Require a pull request before merging.
- Require the listed checks to be successful and up to date.
- Dismiss stale approvals when new commits are pushed.
- Do not allow force-pushes or branch deletion on `main`.
- Leave “include administrators” to the repository owner’s policy decision.

## Owner application sketch

In GitHub, open Settings → Rules → Rulesets, create an active branch ruleset targeting `main`, enable pull-request and required-status-check rules, and add exactly the five contexts listed above. Review the preview and save only after confirming that the USA/JPN matrix legs are not selected as required checks. This is an application guide, not an instruction for an agent to change repository settings.

