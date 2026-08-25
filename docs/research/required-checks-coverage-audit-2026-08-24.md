# Required-checks coverage audit — 2026-08-24

This is an evidence report, not a ruleset change. The current required set is
`Python (ruff)`, `Markdown (markdownlint-cli2)`, `drift-check`, and `unittest`,
as recorded in `.github/required-checks.txt`. No required-check file or GitHub
ruleset was changed by this audit.

## Method

I inventoried every workflow under `.github/workflows/`, classified its
pull-request trigger, and sampled the latest eight available runs per workflow
on 2026-08-24 with `gh run list`. “Typical” below is the observed wall-time
band from those runs, rounded to the nearest few seconds; it is not a timeout
claim. For failure history, I checked the repository log and the available
GitHub run conclusions. A path-filtered job cannot be required safely: when its
paths do not match, GitHub leaves the required context pending rather than
reporting a pass. That is the PR #1365 deadlock documented by
`tools/check_ci_contract.py`.

## Per-workflow report

| Workflow / context | Pull-request coverage | Observed typical runtime | Failure history that mattered | Recommendation |
|---|---|---:|---|---|
| `lint.yml` / `Python (ruff)` | Every PR | ~1m20s–1m40s | Required; the baseline lint gate. | Keep required. |
| `lint.yml` / `Markdown (markdownlint-cli2)` | Every PR | ~1m20s–1m40s | Required; generated/docs drift is otherwise easy to miss. | Keep required. |
| `generated-files-drift.yml` / `drift-check` | Every PR | ~20–35s | Required; catches stale generated indices and attempts-ledger drift. | Keep required. |
| `tests.yml` / `unittest` | Every PR | ~1m45s–2m25s | Required. It caught the CI-shallow-history/import-parity class immediately after #1531; the #1534 pool-freshness PR also went red here while its configure smoke job passed. | Keep required. |
| `tests.yml` / `configure-windows` | Every PR (the workflow is unfiltered) | ~40–50s | **Confirmed high-value failure:** brief 058 / PR #393 fixed Windows `&&` command-chain handling; the job exists specifically to prevent that regression. | **Rank 1 candidate to require.** Cheap, universal, and directly tied to a historical build failure. Owner decision still required. |
| `compile-check.yml` / `Compile changed C (eur/usa/jpn)` | Paths-filtered to changed C/config/build tooling | ~1m05s–2m10s for the matrix | Real failure history: run [30177067635](https://github.com/cntrl-alt-lenny/gx-spirit-caller/actions/runs/30177067635) failed because the JPN target set contained EUR-only C objects (`unknown target`); the region-exclusive filter fix landed afterward in `c3db40596`. | Keep advisory. It cannot be required while filtered; unfiltering it would impose a three-run Windows matrix on docs-only PRs. |
| `match-invariants.yml` / `pr-invariants (eur/usa/jpn)` | Paths-filtered to config/src/invariant tooling; USA/JPN are continue-on-error | ~25–40s | Real failure history: [30177067649](https://github.com/cntrl-alt-lenny/gx-spirit-caller/actions/runs/30177067649) reported error-severity invariant findings on `cm-data-inference-4`. | Keep advisory and path-filtered until its warning/error baseline is intentionally owned; not a required candidate in the current form. |
| `analyzer.yml` / `pr-tier-delta` | Paths-filtered to config/src/analyzer tooling | ~40–90s | Historical failures include [26448621092](https://github.com/cntrl-alt-lenny/gx-spirit-caller/actions/runs/26448621092); the matching main run failed at checkout, so this sample does not establish a semantic analyzer regression. | Keep as a PR comment and do not require. |
| `worklist-diff.yml` / `pr-worklist-diff` | Paths-filtered to config/src/worklist tooling | ~35–50s | No recent failure with a demonstrated merge-blocking defect in the sampled history. | Keep advisory comment-only. |
| `cascades-diff.yml` / `pr-cascades-diff` | Paths-filtered to rename/cascade tooling | ~30–55s | No failure in the sampled recent history that demonstrates a required-check-worthy defect. | Keep advisory comment-only. |
| `mega-cascades-diff.yml` / `pr-mega-cascades-diff` | Paths-filtered to cascade-ranking inputs/tools | ~45–75s | No sampled failure establishing a merge-blocking defect. | Keep advisory comment-only. |
| `pattern-clusters-diff.yml` / `pr-pattern-clusters-diff` | Paths-filtered to symbols/delinks/pattern tooling | ~25–85s | Historical failures exist, including [26448621059](https://github.com/cntrl-alt-lenny/gx-spirit-caller/actions/runs/26448621059), but the retained evidence is insufficient to rank it above the universal Windows smoke gate. | Keep advisory comment-only. |
| `labeler.yml` / `label` | Every PR, via `pull_request_target` | ~15–45s | Failures are automation/label-management failures, not repository correctness evidence. | Never require as a correctness check. |
| `progress-badge.yml` / `update` | No PR trigger; push, schedule, and manual dispatch | ~25–35s | It publishes generated visuals and has no PR status context to require. | Exclude from the required-check audit. |

## Ranked recommendation

1. Require `configure-windows` if the owner wants one additional check. It is
   unfiltered, completes in under a minute on the sampled run
   [32777621379](https://github.com/cntrl-alt-lenny/gx-spirit-caller/actions/runs/32777621379),
   and protects a concrete Windows build regression (#393).
2. Do not require `Compile changed C` or `pr-invariants` in their current form.
   Both have useful failure evidence, but both are path-filtered; requiring
   either recreates the exact pending-context failure the CI contract forbids.
   If either becomes a candidate later, first make it universal and budget the
   resulting runtime/noise, then audit it again.
3. Keep the analyzer, worklist, and three cascade workflows as targeted PR
   comments. Their path filters are appropriate, and their outputs are
   decision support rather than universal merge invariants.
4. Never promote the labeler or progress-publisher jobs to required checks:
   their purposes are repository automation and publication, not correctness.

The audit therefore recommends one narrow human decision — whether to add the
existing `configure-windows` context to the required set — and recommends no
automatic change. The #1520/#1530 lesson is coverage, but coverage must remain
compatible with the no-filter contract and with the check's actual signal.
