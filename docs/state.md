# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-04-21. Main is at `cd382ff` after brief 006
landed in four decomper PRs (#79-#82). Brief 005 was already closed
by PRs #70-#72; brief 006 added another 29 easy-tier matches across
ov015, ov010, ov011, and ov000. Matched function count is now 182.

**Baseline:** `python tools/configure.py eur`, `ninja rom`, and
`./dsd check modules -c config/eur/arm9/config.yaml` all run cleanly
against the expected baseline. Module check still reports **24/27
OK**: ARM9 main / DTCM / overlay 4 fail for the known placeholder-
symbol artifacts, not because of the brief 006 wave.

**Progress:** `python tools/progress.py --version eur` reports code
`2944 / 2459936` bytes (0.12%), data `0 / 4792108` bytes (0.00%),
and `141 / 252` units passing (55.95%).

**Matched breakdown** (live from `python tools/next_targets.py
--version eur`):

| Tier | Matched | Unmatched | Total | % matched |
|------|--------:|----------:|------:|----------:|
| `trivial` | 78 | 59 | 137 | 56.9% |
| `easy` | 58 | 1065 | 1123 | 5.2% |
| `sinit` | 46 | 5 | 51 | 90.2% |
| `named` | 0 | 22 | 22 | 0.0% |
| `medium` | 0 | 6 | 6 | 0.0% |
| `hard` | 0 | 8510 | 8510 | 0.0% |

`sinit` is effectively closed except for targeted outliers; `trivial`
is past half; `easy` remains the main grind.

## Merged since last refresh

Main tip `9d8c5f3` -> `cd382ff`.

### Decomper track

- **PR #78** - brief 006 opener for easy-tier heavies in ov000,
  ov010, ov011, and ov015.
- **PR #79** - ov015 wave: 6 easy-tier leaves matched.
- **PR #80** - ov010 wave: 5 easy-tier leaves matched.
- **PR #81** - ov011 wave: 8 easy-tier leaves matched.
- **PR #82** - ov000 wave: 10 easy-tier leaves matched; closed the
  brief 006 target set.

The four code branches were reviewed together in a detached local
worktree before merge. Verification there: configure, `ninja rom`,
`dsd check modules`, `ninja objdiff`, `ninja report`, progress, and
next-target summaries all stayed on the expected baseline. Because
the four sibling PRs touched the generated heatmap, brain merged #79
first, then refreshed the heatmap on #80/#81/#82 before squash-merging.

### Cloud track

No new Cloud PR is open after brief 006. The relevant Cloud tools are
already merged:

- **PR #73** - `tools/propagate_template.py`.
- **PR #74** - `tools/scaffold_batch.py`.
- **PR #76** - previous state refresh.
- **PR #77** - post-brief heatmap refresh.

The decomper used the scaffold/progression workflow successfully, but
brief 006 also exposed one human-error trap: delinks entries still had
to be copied by hand. A Cloud follow-up should teach
`scaffold_batch.py` to emit or apply the exact delinks blocks for the
generated skeletons, dry-run by default.

## In flight

- **`claude-pc`** - no active PR after brief 006. Do not continue the
  brief 006 branches. The next decomper work should either be read-only
  scouting for brief 007 or a new formal brief from brain.
- **`claude-cloud`** - standing by. Recommended next task: improve
  `tools/scaffold_batch.py` so a decomper cannot scaffold sources but
  forget/mistype the matching `delinks.txt` entries.
- **`claude-brain`** - publish/review the state refresh PR, then write
  brief 007 once the next decomper slice is chosen.

## Next-brain TODO

1. Write brief 007. Best current candidates are the small but fiddly
   outliers: the 4 deferred sinits from PR #55 plus the brief 006
   stragglers `func_ov011_021ce324`, `func_ov011_021ce334`, and
   `func_ov000_021ac550`.
2. Give Cloud a tools task for `scaffold_batch.py`: optional
   delinks-block output/apply support, dry-run by default, with tests
   and no repo config changes in the PR.
3. Consider making the `match-invariants` check required in GitHub
   branch protection now that it has stayed stable through multiple
   merge waves.
4. Sweep stale remote branches now that briefs 004, 005, and 006 are
   merged. Do this from a local machine or the GitHub UI.
5. Data-tier work is still at 0%. When it becomes relevant, the delinks
   tier in `progress.py` already handles it.

## New agents?

Still no. Brain + decomper + cloud is holding. Reopen if `libs/nitro/`
or asset pipelines grow enough to justify a dedicated fourth lane, or
if brain review latency becomes the bottleneck.
