# Port-harvest cadence study

**Date:** 2026-08-01  
**Base:** `37b143ca5` (`origin/main`)  
**Method:** current `python tools/port_census.py`, the merged harvest report,
and build-free `python tools/progress.py --version eur` at both endpoints.

## Executive result

Do not schedule `port_harvest.py` by EUR percentage points or run it
unattended. Re-census after each substantial EUR merge, then run one harvest
manually when either region reaches an exact-floor backlog of **50 rows** and
the machine-wide compiler check is clear.

The measured two-point window does not produce a finite “ports per EUR pp”
rate:

| endpoint | USA exact floor | JPN exact floor | EUR Natural-C |
|---|---:|---:|---:|
| closeout `12f62dbf6` | 206 | 208 | 13.25% |
| current `37b143ca5` | 134 | 136 | 13.25% |

The previous harvest report records **137 USA + 137 JPN** ports between those
backlog observations. Therefore the implied pre-harvest current backlog was
271 USA / 273 JPN, and regeneration since closeout was:

```text
USA: 271 - 206 = 65 new exact-floor rows
JPN: 273 - 208 = 65 new exact-floor rows
EUR gain: 13.25% - 13.25% = 0.00 percentage points
rate: 65 / 0.00 pp = undefined, not a finite estimate
```

This is a useful negative result: the cross-region backlog can regenerate
while the committed EUR Natural-C headline is flat. A percentage-trigger would
therefore miss work or require an invented denominator.

## Current census

The current census, with extracted ROM inputs present for byte similarity,
reported:

| region | backlog `.s` | sim==1.0 | 0.99–<1.0 | <0.99 | HIGH/no target |
|---|---:|---:|---:|---:|---:|
| USA | 139 | 134 | 1 | 4 | 12 |
| JPN | 141 | 136 | 1 | 4 | 12 |

The exact-floor rows are the only rows in scope for `port_harvest.py`; the
five non-exact rows per region remain untouched. The exact-floor total is
270 rows, already well above the proposed 50-row trigger.

## Cadence arithmetic

The observed window regenerated 65 exact-floor rows per region. A 50-row
trigger is therefore crossed once by the measured regeneration amount, while
the current 134/136 rows represent roughly 2.7 trigger batches per region:

```text
USA: 134 / 50 = 2.68 trigger batches
JPN: 136 / 50 = 2.72 trigger batches
```

Recommendation:

1. After every substantial EUR merge, run the read-only census.
2. If either exact-floor count is at least 50, wait for a free toolchain slot
   and run `python tools/port_harvest.py --batch 20` once.
3. Re-census after the run. Do not infer that the backlog is empty from a
   prior round’s count.

This is a threshold policy, not a claim that 65 rows is a stable per-round
rate. One more endpoint with a non-zero EUR Natural-C delta is required before
reporting a meaningful rows-per-percentage-point number.

## Unattended-operation verdict

**Manual brain-triggered runs are the correct policy today.** The harvester is
safe against dirty worktrees, unsafe branches, below-floor candidates, and
red ROM gates, but it does not itself arbitrate machine-wide compiler
contention. The brain protocol requires this preflight before gating:

```powershell
Get-Process | Where-Object { $_.Name -match 'mwcc|mwld|mwasm|ninja' }
```

At this study’s census time that command returned no competing compiler or
Ninja processes. A scheduler must treat any returned row as “defer”, not start
another harvest. Since the current tool does not own that scheduler-level
lock/defer decision, an unattended cron/task would be unsafe and could block
other lanes. If unattended operation becomes valuable, add a tested
contention preflight that exits cleanly before invoking `ninja sha1`; do not
hide that policy in an external timer.

## Reproduction

- `python tools/port_census.py` → current 134/136 exact-floor counts above.
- `python tools/progress.py --version eur` at `12f62dbf6` and `37b143ca5` →
  316,114 / 2,385,948 Natural-C bytes, 13.25% at both endpoints.
- `docs/research/campaign-analytics/port-harvest-automation.md` → merged
  harvest’s 137-per-region port count.
- Contention check: the PowerShell command above, immediately before any
  future gate.

## Verification

- Full suite before this doc change: **3160 passed, 18 skipped, 63 subtests**.
- Zero-work path: re-demonstrated after the study with the existing regression
  test; it reports one passing test and no false harvest claim.

