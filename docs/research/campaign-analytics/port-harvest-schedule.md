# Port-harvest schedule decision

**Date:** 2026-08-01
**Base:** `6e52e9913` (`origin/main`)
**Method:** fresh `python tools/port_census.py`, `python tools/port_harvest.py
--batch 20`, and `python tools/progress.py --version {eur,usa,jpn}`.

## Decision

With the contention defer path from #1423, unattended operation is safe as a
best-effort scheduled job. It checks for `mwcc`, `mwld`, `mwasm`, and `ninja`
before starting and between batches; contention exits as `deferred` without
claiming work. The job also refuses unsafe worktrees, stays at the `sim ==
1.0` floor, and delegates every attempted port to the existing gated path.

Recommended policy: re-census after every substantial EUR merge and schedule
one harvest whenever either region has at least **50 exact-floor rows**. A
round-based or EUR-percentage-point cadence is not justified by the available
measurements: the prior measured window had 65 regenerated rows per region
with 0.00 EUR percentage-point movement, and this run shipped no rows because
the current prefilter found no candidate in the current gap.

Remaining failure modes are clean and observable: dirty or wrong branch,
machine contention (`deferred`), unavailable toolchain/prefilter errors,
symbol refusals, and a red ROM gate. A scheduler must treat all of these as a
non-harvest result and leave the next census for the next trigger; it must not
retry aggressively while another lane owns the compiler.

## Current census and harvest

The requested `139/134` USA and `141/136` JPN values were the earlier
`ceefe98c1` snapshot. On current `6e52e9913`, the re-runnable census reports:

| region | backlog `.s` | `sim == 1.0` | `0.99 <= sim < 1` | `sim < 0.99` | total bytes |
|---|---:|---:|---:|---:|---:|
| USA | 165 | 160 | 1 | 4 | 34,164 |
| JPN | 167 | 162 | 1 | 4 | 34,708 |

The live `port_harvest.py --batch 20` run completed with:

| region | rows censused | exact-floor rows | ported | gates consumed | commits |
|---|---:|---:|---:|---:|---:|
| USA | 165 | 160 | 0 | 0 | 0 |
| JPN | 167 | 162 | 0 | 0 | 0 |

All 80 prefilter decisions (40 per region) were refusals because the
candidate was `not-in-gap`; the remaining refusals were the existing symbol,
data, and confidence classes. No source or activation changed, so there was
no port to gate and no progress increase to report. The tool exited cleanly
and did not claim a harvest.

The current first committed measurement point for the next regeneration-rate
calculation is recorded in
`docs/research/campaign-analytics/port-harvest-snapshots.md`:

```text
commit 6e52e9913 | EUR Natural-C 322,522 B | USA exact-floor 160 | JPN exact-floor 162
```

It supersedes the older requested values as a current input; they remain in
the snapshot history for provenance.

## Progress before and after

The harvest made no commits, so the tool-derived Natural-C values are
unchanged:

| region | before | after |
|---|---:|---:|
| EUR | 322,522 / 2,385,948 (13.52%) | 322,522 / 2,385,948 (13.52%) |
| USA | 267,268 / 2,384,964 (11.21%) | 267,268 / 2,384,964 (11.21%) |
| JPN | 266,840 / 2,384,964 (11.19%) | 266,840 / 2,384,964 (11.19%) |

## Verification

- `python tools/gate3.py --scope all`: **GATE PASS**, with direct log lines
  `[eur] SHA1 PASS`, `[usa] SHA1 PASS`, and `[jpn] SHA1 PASS`.
- `python tools/check_activation_invariant.py`: fail-closed no-op result:
  `0` function `.c` additions, `0` function `.s` deletions, and `0`
  activation flips, so it refused to report a vacuous pass.
- Full pytest baseline before this worktree's checks: **3,164 passed, 18
  skipped, 63 subtests**. The gate's full-suite run on unchanged current main
  reported **3,166 passed, 16 skipped, 63 subtests**; the final post-document
  run is the authoritative after count in the PR summary.
