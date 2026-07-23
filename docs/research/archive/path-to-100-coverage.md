# Path to ~100% byte coverage

> Superseded by [endgame-ledger.md](../campaign-analytics/endgame-ledger.md), the definitive
> post-drain residual ledger (Brief 576).

Snapshot: 2026-07-13. Build-free, from `origin/main` at commit `6a3ec942`.
The USA/JPN drain and the EUR closeout are active work, so these counts are a
moving target and should be refreshed after those branches land.

## Finish-line estimate

| Region | Estimated remaining ships | Estimated waves/passes |
| --- | ---: | ---: |
| USA | **110 ships** | **2 waves** (post-ov002 Waves 9-10) |
| JPN | **110 ships** | **2 waves** (post-ov002 Waves 9-10) |
| EUR | **77 functions** | **1 closeout pass** |

The USA/JPN total is 220 ships across the two regions, or 110 per region.
The EUR number is the 77-function closeout floor, less the zero Brief 572
ships visible in this snapshot (see the EUR section).

## USA/JPN: post-ov002 drain still outstanding

The runbook and drain work order record Waves 9 and 10 as the remaining
post-ov002 waves. Their expected counts are per region; the runbook's wave
totals count USA and JPN together.

| Wave | Module | Expected ships per region | Runbook min address | Status in this snapshot |
| ---: | --- | ---: | --- | --- |
| 9 | `ov003` | 21 | `0x021c9c80` | Not recorded as done |
| 9 | `ov007` | 19 | `0x021b2180` | Not recorded as done |
| 9 | `ov021` | 18 | `0x021aa3c0` | Not recorded as done |
| 9 | `ov012` | 16 | `0x021c9c80` | Not recorded as done |
| 9 | `ov022` | 13 | `0x021aa3c0` | Not recorded as done |
| **Wave 9 total** | | **87** | | **174 USA/JPN combined** |
| 10 | `ov013` | 9 | `0x021c9c80` | Not recorded as done |
| 10 | `ov018` | 9 | `0x021aa3c0` | Not recorded as done |
| 10 | `ov001` | 4 | `0x021c9c80` | Not recorded as done |
| 10 | `ov023` | 1 | `0x021b2180` | Not recorded as done |
| **Wave 10 total** | | **23** | | **46 USA/JPN combined** |
| **Waves 9-10 total** | | **110** | | **220 USA/JPN combined** |

Sources: `docs/research/campaign-analytics/post-ov002-runbook.md` and its
per-module census/work order, `post-ov002-drain-workorder.md`. No committed
completion report for Waves 9-10 is present on `origin/main` in this snapshot.

## EUR: closeout floor

`docs/research/campaign-analytics/eur-floor-closeout.md` identifies a
77-function closeout floor: 68 C-absorbed recoverable functions plus 9 clean
PASS functions. Its two data-blob ASMFAIL entries are not included in that
77-function closeout number, and the permanent ISA floor is separately
excluded.

Brief 572 has no committed report or branch delta visible from this fresh
`origin/main` snapshot, so the mechanically supportable subtraction is **0
known ships**. EUR therefore remains **77 functions** in this tracker until
Brief 572 lands and its actual closeout count can be subtracted.

## Tracked `.s` inventory snapshot

These are `git ls-files '*.s'` counts, not a claim that every file is still an
unmatched function. EUR includes `src/main/**` and `src/overlay*/**`; USA and
JPN include their complete `src/usa/**` and `src/jpn/**` trees.

| Region | Tracked `.s` files |
| --- | ---: |
| EUR (`src/main` + `src/overlay*`) | **6,290** |
| USA (`src/usa/**`) | **6,432** |
| JPN (`src/jpn/**`) | **6,432** |
| **All three trees** | **19,155** |

### Per-module counts

| Module | EUR | USA | JPN |
| --- | ---: | ---: | ---: |
| `main` | 2,509 | 2,878 | 2,878 |
| `overlay000` | 59 | 86 | 86 |
| `overlay001` | 5 | 1 | 1 |
| `overlay002` | 2,805 | 2,854 | 2,854 |
| `overlay003` | 21 | 1 | 1 |
| `overlay004` | 181 | 166 | 166 |
| `overlay005` | 34 | 1 | 1 |
| `overlay006` | 175 | 254 | 254 |
| `overlay007` | 12 | 2 | 2 |
| `overlay008` | 71 | 72 | 72 |
| `overlay009` | 18 | 1 | 1 |
| `overlay010` | 55 | 1 | 1 |
| `overlay011` | 91 | 102 | 102 |
| `overlay012` | 17 | 1 | 1 |
| `overlay013` | 10 | 1 | 1 |
| `overlay014` | 23 | 1 | 1 |
| `overlay015` | 31 | 1 | 1 |
| `overlay016` | 44 | 1 | 1 |
| `overlay017` | 31 | 1 | 1 |
| `overlay018` | 11 | 1 | 1 |
| `overlay019` | 26 | 1 | 1 |
| `overlay020` | 33 | 1 | 1 |
| `overlay021` | 11 | 2 | 2 |
| `overlay022` | 14 | 1 | 1 |
| `overlay023` | 3 | 1 | 1 |
| **Total** | **6,290** | **6,432** | **6,432** |
