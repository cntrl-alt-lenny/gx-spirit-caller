# Cross-region port lane closeout

**Date:** 2026-08-01  
**Base:** `12f62dbf6` (`origin/main`)  
**Method:** `python tools/port_census.py`, followed by
`port_to_region.py --dry-run --json` for every current sim==1.0 row.

## Current census

| Region | sim==1.0 backlog | sim==1.0 bytes | other backlog | total backlog bytes |
|---|---:|---:|---:|---:|
| USA | 206 | 41,948 | 4 (`sim<0.99`) | 43,296 |
| JPN | 208 | 42,492 | 4 (`sim<0.99`) | 43,840 |

The full census also reports 12 HIGH-but-no-target-file rows per region;
those are not in the backlog and are not included above. Current backlog
modules are USA `ov002=150, main=44, ov006=6, ov004=4, ov011=2,
ov008=1, ov014=1, ov016=1, ov017=1`; JPN is the same except
`main=45` and `ov006=7`.

## New versus stuck

The last published post-drain snapshot was 76 USA / 78 JPN sim==1.0 rows:
32 gate-fails + 43/45 port refusals + one `symbols.txt`-line park per
region. Briefs #1403 and #1408 recovered the 32 gate-fail / symbol rows as
30 + 3 ports per region, leaving the published refusal floor at 43 USA / 45
JPN.

| Comparison | USA | JPN |
|---|---:|---:|
| Current sim==1.0 | 206 | 208 |
| Prior published snapshot | 76 | 78 |
| Net change | **+130** | **+130** |
| Current published-floor refusal remainder | 43 | 45 |
| Gross regenerated rows implied by current total | **163** | **163** |

The net change is `206-76` / `208-78`. The gross regenerated figure is
`206-43` / `208-45`: it accounts for the 33 old recoverable rows drained
by #1403/#1408 before comparing the current census with the remaining
refusal floor. This is an arithmetic comparison to the prior tool report, not a
claim that the old ignored park-list files still exist.

## Current dry-run classification

The current sim==1.0 rows were replayed through
`python tools/port_to_region.py <source> --target <region> --dry-run --json`.
The primary buckets are mutually exclusive:

| Primary result at HIGH floor | USA | JPN | Interpretation |
|---|---:|---:|---|
| Portable at HIGH/EXACT floor | 125 | 125 | Ready for a normal gated batch-port run |
| MEDIUM sibling confidence only | 63 | 63 | Refused below the HIGH floor |
| LOW plus MEDIUM ambiguity | 6 | 6 | Refused due to mixed weak resolutions |
| Unresolved data symbol, no function-symbol failure | 4 | 4 | Target data mapping absent |
| Unresolved function symbol, including mixed rows | 8 | 10 | Target function mapping absent or ambiguous |
| Placeholder-twin refusal | 0 | 0 | No current row in this class |
| **Total sim==1.0** | **206** | **208** | |

Thus the current genuinely stuck/refused residual is 81 USA / 83 JPN, while
125 per region are newly available free ports. Compared with the old refusal
table (29 MEDIUM, 3 LOW/MEDIUM, 6 data, 5 USA/6 JPN function, plus one JPN
placeholder), MEDIUM, LOW/MEDIUM, and function-symbol buckets have grown;
the data bucket has fallen from 6 to 4; and the placeholder bucket is now
zero in both regions.

## Recommendation

Do not open another bespoke port-recovery strategy. The lane is not finished
as a maintenance task: EUR advancement has regenerated a large backlog, and
125 sim==1.0 rows per region are mechanically portable today. Automate a
small periodic `port_census.py` → sim==1.0 `batch_port.py` harvest after EUR
merges, with the existing HIGH floor and gates. Leave the 81/83 current
refusals for a separate symbol/confidence investigation rather than letting
them keep the routine drain open-ended.

## Verification

- `python tools/port_census.py`: current census above; writes
  `build/port_backlog.json`.
- 414 current sim==1.0 rows replayed with `--dry-run --json`; 0 tool errors.
- Whole-suite pytest before this doc-only change: `3150 passed, 16 skipped,
  63 subtests passed`.
