# unittest-required evidence — 2026-08-22

## Decision boundary

This is evidence for the human-owned toggle in q-unittest-required-evidence. No
GitHub settings, branch-protection rules, workflows, or required-check files
were changed by this item. Owner PR #1531 made that change separately.

The question was whether `unittest` is stable enough to be required and which
recent changes would have been blocked by it. The sample below is the latest
50 `tests.yml` runs on `main`, inspected with the GitHub Actions API. The
unittest result is the `unittest` job conclusion, not the overall workflow
conclusion.

## 50-run stability table

| # | Run | Date | SHA | unittest | Title |
| ---: | ---: | --- | --- | --- | --- |
| 1 | 32592882371 | 2026-08-22 | 6689860b2 | success | PR #1531 required-check change |
| 2 | 32583527679 | 2026-08-22 | a5de23c05 | success | PR #1525 merge |
| 3 | 32286109626 | 2026-08-19 | 555c2aeac | success | PR #1523 metric framing |
| 4 | 32285443332 | 2026-08-19 | 01cc5bb55 | success | PR #1521 park family |
| 5 | 32284961459 | 2026-08-19 | 60d188c42 | success | PR #1519 cascade |
| 6 | 32282341317 | 2026-08-19 | 2c5d92e72 | success | PR #1515 |
| 7 | 32282334352 | 2026-08-19 | ed06f90bc | success | PR #1517 import parity |
| 8 | 32282327191 | 2026-08-19 | 17d58f4db | success | PR #1516 cardinality sweep |
| 9 | 32282320886 | 2026-08-19 | 6e2af9eab | success | PR #1514 CI timeout/cache |
| 10 | 32157368205 | 2026-08-18 | 16da23770 | success | PR #1511 park-class mapping |
| 11 | 32142579840 | 2026-08-18 | a984ea85d | success | PR #1509 round merge |
| 12 | 32045725426 | 2026-08-17 | 2a04e1bcc | success | PR #1499 validator guard |
| 13 | 32045719937 | 2026-08-17 | 9addd0278 | success | PR #1500 shape classifier |
| 14 | 31429039135 | 2026-08-10 | 7a40ec0a9 | success | PR #1491 ledger validation |
| 15 | 31320949281 | 2026-08-09 | 48f8a3948 | failure | PR #1486 shape reclassification |
| 16 | 31320864978 | 2026-08-09 | a081ebe0c | success | PR #1485 ledger hygiene |
| 17 | 31310947497 | 2026-08-09 | 9b9ae2f17 | success | PR #1479 ledger residuals |
| 18 | 31270861691 | 2026-08-08 | 9526efe5c | success | PR #1475 census methodology |
| 19 | 31267656571 | 2026-08-08 | ad7b7010a | success | PR #1468 flags producer |
| 20 | 31267341846 | 2026-08-08 | d7ec0b5c4 | success | PR #1467 attempts ledger |
| 21 | 31262443288 | 2026-08-08 | 399b35a64 | success | PR #1474 kickoff lint |
| 22 | 31248733810 | 2026-08-08 | 605e378ec | success | PR #1471 repair |
| 23 | 31248466777 | 2026-08-08 | ab3129367 | success | PR #1469 repair |
| 24 | 31178831882 | 2026-08-07 | 25b8ddf35 | success | PR #1462 port residual |
| 25 | 30951418760 | 2026-08-04 | 2dd4ec9f8 | success | integration sweep |
| 26 | 30931640474 | 2026-08-04 | a2eb15973 | success | queue/index normalization |
| 27 | 30909288756 | 2026-08-04 | 8e73f5289 | success | integration round |
| 28 | 30844657075 | 2026-08-03 | 40d69e2e7 | success | state table regeneration |
| 29 | 30818403703 | 2026-08-03 | 8a7f8ccc5 | success | port-census integration |
| 30 | 30803106727 | 2026-08-03 | b38e86951 | success | state round |
| 31 | 30720162971 | 2026-08-01 | 1050e7b5f | success | integration sweep |
| 32 | 30708201070 | 2026-08-01 | 6e52e9913 | success | restore progress heatmaps |
| 33 | 30703754956 | 2026-08-01 | ceefe98c1 | success | restore queue marker |
| 34 | 30700363438 | 2026-08-01 | 37b143ca5 | success | markdown repair |
| 35 | 30693818559 | 2026-08-01 | 9af2c18a0 | success | markdown repair |
| 36 | 30663791904 | 2026-07-31 | 12f62dbf6 | success | state/index regeneration |
| 37 | 30651573814 | 2026-07-31 | b4ca6bb9b | success | markdown repair |
| 38 | 30631784988 | 2026-07-31 | 77e64a1f9 | success | port residual triage |
| 39 | 30560417788 | 2026-07-30 | c3cfad3ae | success | markdown repair |
| 40 | 30537568526 | 2026-07-30 | 7c28f92f8 | success | restore port tests |
| 41 | 30303372054 | 2026-07-27 | 8ebfc2394 | success | research index regeneration |
| 42 | 30286556415 | 2026-07-27 | 904fbb436 | success | integration |
| 43 | 30256343098 | 2026-07-27 | d21faad3b | success | integration |
| 44 | 30214430500 | 2026-07-26 | 032732b8f | success | queue completion |
| 45 | 30161021012 | 2026-07-25 | a0a354ff5 | failure | q-toolbugs-round2 marker |
| 46 | 30149061047 | 2026-07-25 | 17260f35a | failure | integration round |
| 47 | 30128371336 | 2026-07-24 | f1a227cd8 | failure | ruff/index repair |
| 48 | 30128161827 | 2026-07-24 | 5589687c6 | failure | Windows dsd probe |
| 49 | 30127550523 | 2026-07-24 | 2940d44d9 | failure | r11 swarm report |
| 50 | 30114243234 | 2026-07-24 | a9a35d633 | failure | scaffolder queue |

Result: 43/50 passed (86%); 7/50 failed (14%). Every one of the seven
failing SHAs has exactly one observed `tests.yml` run and that run is still
failure. There is therefore no same-SHA passing rerun to classify as flaky.

## Failure classification

| Run | Failure evidence | Classification |
| --- | --- | --- |
| 31320949281 | `test_committed_index_matches_regeneration`; committed index said 130 tools while regeneration found 131 | true red: stale generated artifact |
| 30161021012 | `test_m2c_feed` could not import because `pytest` was absent; fastmatch missing-file output, and no `dsd` binary | true red: unittest environment/fixture contract |
| 30149061047 | Same `pytest` import, fastmatch output, and missing-`dsd` failures | true red: same reproducible contract failures |
| 30128371336 | Same `pytest` import, fastmatch output, and missing-`dsd` failures | true red: same reproducible contract failures |
| 30128161827 | Same failures plus stale generated index (115 vs 116 tools) | true red: environment plus generated artifact |
| 30127550523 | Same `pytest` import, fastmatch output, and stale generated index (115 vs 116) | true red: environment plus generated artifact |
| 30114243234 | Same `pytest` import, fastmatch output, and no `dsd` binary | true red: unittest environment/fixture contract |

## Blast radius

PR #1506 is the known case. Its `tests/test_validate_attempts.py` added a
top-level `import pytest` and uses `pytest.raises`. The dedicated unittest job
does not install pytest, so this is exactly the kind of PR that would have
been blocked by a required unittest context. Its merge SHA
`077bad1880633c82ab14852dddcbacb16c0be865` has no retained `tests.yml` run,
but the changed test is directly confirmed in that merge tree.

Across the 30 most recently merged PRs, #1506 is the only PR whose added test
code introduces that import-time unittest failure. The available runs for the
other recent test-touching merges (PRs #1499, #1500, #1509, #1511, #1514, #1515, #1516, #1517, #1521, #1523, #1525 and #1531) all report a successful
`unittest` job. The latest run, #1531's 32592882371, is green.

## Owner-controlled toggle and one-step revert

PR #1531 made the three-sided change: it removed the `pull_request` path
filter from `tests.yml`, added `unittest` to `.github/required-checks.txt`,
and the owner added `unittest` to live ruleset `main-protection` (id
19573966). The current live required contexts are:

```text
Python (ruff)
Markdown (markdownlint-cli2)
drift-check
unittest
```

The owner can revert only the live setting from the GitHub UI at
Settings → Rules → Rulesets → `main-protection` → Required status checks:
remove `unittest`, then Save. The committed contract and workflow must be
reverted together if the repository is also being rolled back; otherwise
`tools/check_ci_contract.py --verify-ruleset` will report drift.

For an API-only one-step live revert that preserves the rest of the ruleset:

```powershell
$r = gh api repos/cntrl-alt-lenny/gx-spirit-caller/rulesets/19573966 | ConvertFrom-Json
($r.rules | Where-Object type -eq 'required_status_checks').parameters.required_status_checks = @(
  ($r.rules | Where-Object type -eq 'required_status_checks').parameters.required_status_checks |
  Where-Object context -ne 'unittest'
)
$body = [ordered]@{ name=$r.name; target=$r.target; enforcement=$r.enforcement; conditions=$r.conditions; rules=$r.rules; bypass_actors=$r.bypass_actors }
$body | ConvertTo-Json -Depth 20 | gh api --method PUT repos/cntrl-alt-lenny/gx-spirit-caller/rulesets/19573966 --input -
```

That command changes only the live ruleset. It does not alter this evidence
document, the queue, or any repository file.

## Evidence commands

The sample was obtained with `gh run list --workflow tests.yml --branch main
--limit 50`, followed by `gh api repos/cntrl-alt-lenny/gx-spirit-caller/actions/runs/<id>/jobs`
for each run and selecting the job named `unittest`. Same-SHA rerun checks
used `gh run list --workflow tests.yml --commit <full-head-sha>`. The live
ruleset was checked with `gh api repos/cntrl-alt-lenny/gx-spirit-caller/rulesets/19573966`.
