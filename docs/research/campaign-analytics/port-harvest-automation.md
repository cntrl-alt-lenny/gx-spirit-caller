# Standing cross-region port harvest

**Date:** 2026-08-01  
**Branch base:** `9af2c18a0`  
**Command:** `python tools/port_harvest.py --batch 125`

## Result

The harvester drained the HIGH/EXACT (`sim >= 0.9999`) floor that was
portable at run time. The prompt's 125-per-region estimate was stale by the
time this branch ran: the committed diff contains **137 USA + 137 JPN = 274
function ports**. `check_activation_invariant.py` independently reports
274 `.c` additions, 274 `.s` deletions, and 274 delinks activations.

The first live invocation reached the execution ceiling after committing the
USA batches and one JPN batch. Its auto-commit ledger records 137 USA and 20
JPN ports. The resumed invocation below completed the remaining JPN ports and
emitted the machine-readable report. No uncommitted partial batch was kept.

| resumed run field | USA | JPN | total |
|---|---:|---:|---:|
| rows censused | 99 | 218 | 317 |
| sim==1.0 floor rows | 95 | 214 | 309 |
| ported | 0 | 117 | 117 |
| gates consumed | 0 | 1 | 1 |
| auto-commits | 0 | 1 | 1 |

Resumed-run refusal classes (the `fastmatch-prefilter` row is included in the
floor total):

| class | USA | JPN |
|---|---:|---:|
| medium-only | 72 | 72 |
| low-plus-medium | 10 | 10 |
| function-symbol | 8 | 10 |
| data-symbol | 4 | 4 |
| fastmatch-prefilter | 1 | 1 |
| **floor rows not ported** | **95** | **97** |

The resumed invocation took **1,379.234 seconds** wall-clock. It consumed no
gate below the sim floor and left the final residual census at:

| region | remaining sim==1.0 | sub-0.99 rows | HIGH rows without target file |
|---|---:|---:|---:|
| USA | 95 | 4 | 12 |
| JPN | 97 | 4 | 12 |

## Tool contract

`tools/port_harvest.py` is a single fail-closed entry point. It:

- re-runs `port_census.py` and reads its generated backlog;
- selects only `sim >= 0.9999` rows and invokes the existing HIGH-confidence
  `fastmatch.py` prefilter;
- delegates source conversion, routing suffix handling, delinks updates,
  `ninja sha1`, and green-only auto-commits to `batch_port.py`;
- reports census rows, floor rows, ported rows, refusal classes, prefilter
  errors, stale/tool errors, deferred rows, gates, commits, and wall-clock;
- refuses an unsafe branch or dirty worktree; and
- has an explicit zero-work message instead of treating an empty run as a
  success with zero evidence.

The zero-work path was exercised by the tool's regression test:

```text
python -m pytest -q tests/test_port_harvest.py::TestPortHarvest::test_zero_work_path_is_clean_and_does_not_claim_a_harvest
1 passed in 0.11s
```

The live tree still has refused floor rows, so the zero-work fixture patches
the census seam to an empty result; it does not pretend that the residual
refusals are harvested.

## Why this is standing work

The preceding closeout census (`docs/research/campaign-analytics/port-lane-closeout.md`)
measured **+130 net sim==1.0 rows per region** since the prior 76/78 snapshot,
with **163 gross regenerated rows** per region after accounting for the 33
old recoveries. That is the justification for running this harvester after
EUR merge rounds rather than opening bespoke port waves: run it after every
substantial EUR merge, or at least once per round when EUR is advancing.

## Gates

- `python tools/check_activation_invariant.py`: **OK**, 274/274/274.
- `python tools/gate3.py --scope all`: **GATE PASS**; `[eur] SHA1 PASS`,
  `[usa] SHA1 PASS`, `[jpn] SHA1 PASS`.
- Full suite before this change: **3150 passed, 16 skipped, 63 subtests**.
- Full suite after this change: **3160 passed, 16 skipped, 63 subtests**.

