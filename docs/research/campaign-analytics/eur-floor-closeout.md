# EUR residual floor closeout census (Brief 570)

Build-free census for planning the EUR closeout wave. The raw tracked `.s`
count is an assembly-inventory count; it is intentionally reported separately
from the reconciled 79-function closeout floor, because many tracked `.s`
files are already-carved assembly and some functions live inside multi-function
C translation units.

## Closeout queue, smallest effort first

| Rank | Module | Closeout-floor funcs | C-absorbed recoverable | Other closeable | Genuine/non-closeable | EUR `.s` files | delinks `.s` entries | First `.text` base | Recommended command |
|---:|---|---:|---:|---:|---:|---:|---:|---|---|
| 1 | `ov002` | 2 | 2 | 0 | 0 | 2805 | 2794 | `0x021aa4a0` | `python tools/batch_carve.py --version eur --overlay ov002 --srcdir src/overlay002 --min-addr 0x021aa4a0 --batch 20 --limit 150` |
| 2 | `ov006` | 4 | 4 | 0 | 0 | 175 | 175 | `0x021b2280` | `python tools/batch_carve.py --version eur --overlay ov006 --srcdir src/overlay006 --min-addr 0x021b2280 --batch 20 --limit 150` |
| 3 | `ov004` | 9 | 9 | 0 | 0 | 181 | 172 | `0x021c9d60` | `python tools/batch_carve.py --version eur --overlay ov004 --srcdir src/overlay004 --min-addr 0x021c9d60 --batch 20 --limit 150` |
| 4 | `main` | 64 | 53 | 9 | 2 data blobs | 2509 | 2507 | `0x02000000` | `python tools/batch_carve.py --version eur --srcdir src/main --min-addr 0x02000000 --batch 20 --limit 150` |
| **Total** | | **79** | **68** | **9** | **2** | | | | |

The recommended command already routes pure C-absorbed REFUSEs through the
brief-549-fixed `--allow-absorbed-offset` path. The 2 main data blobs are
`020b2d2c` and `020b3c78`; they need a whole-function-as-data emitter, not a
normal `batch_carve` retry.

## Raw EUR `.s` inventory by module

These are the requested `git ls-files` counts, cross-checked against the
number of `.s` source entries in the corresponding EUR `delinks.txt`. They
are inventory numbers, not the 79-function closeout-floor total.

| Module | `.s` files | delinks `.s` | First `.text` base |
|---|---:|---:|---|
| `ov023` | 3 | 3 | `0x021b2280` |
| `ov001` | 5 | 5 | `0x021c9d60` |
| `ov013` | 10 | 10 | `0x021c9d60` |
| `ov018` | 11 | 11 | `0x021aa4a0` |
| `ov007` | 12 | 12 | `0x021b2280` |
| `ov012` | 17 | 17 | `0x021c9d60` |
| `ov009` | 18 | 18 | `0x021aa4a0` |
| `ov003` | 21 | 20 | `0x021c9d60` |
| `ov014` | 23 | 23 | `0x021b2280` |
| `ov019` | 26 | 26 | `0x021b2280` |
| `ov005` | 34 | 34 | `0x021aa4a0` |
| `ov021` | 11 | 11 | `0x021aa4a0` |
| `ov016` | 44 | 44 | `0x021b2280` |
| `ov017` | 31 | 31 | `0x021b2280` |
| `ov010` | 55 | 51 | `0x021b2280` |
| `ov000` | 59 | 59 | `0x021aa4a0` |
| `ov008` | 71 | 71 | `0x021aa4a0` |
| `ov011` | 91 | 89 | `0x021c9d60` |
| `ov015` | 31 | 29 | `0x021b2280` |
| `ov022` | 14 | 14 | `0x021aa4a0` |
| `ov004` | 181 | 172 | `0x021c9d60` |
| `ov006` | 175 | 175 | `0x021b2280` |
| `ov002` | 2805 | 2794 | `0x021aa4a0` |
| `main` | 2509 | 2507 | `0x02000000` |

`src/main/itcm/func_01ff8400.s` and `src/main/itcm/func_01ff86fc.s` are the
two `.s` files absent from the main `delinks.txt`; the improvement-swarm note
calls out the ITCM lane as invisible to the ordinary closeout census.

## Ledger reconciliation

- Brief 488’s authoritative EUR residue split was approximately 68 REFUSE,
  9 PASS, 2 data-blob ASMFAIL, and 41 already-carved/semantic-name noise.
  Removing that noise gives the 79-function floor used here.
- Brief 549 establishes the C-absorbed comparator fix and the recoverable
  `base+offset` path. Brief 554 records the last ov002 absorbed-routed
  candidate in the regional drain; Brief 558 records ov002 at zero remaining
  candidates in those regional lanes. For the EUR floor, the two ov002 ledger
  members remain in the EUR residual accounting above.
- Brief 543’s 15-function ov004/ov006 validation proves the same offset path
  end-to-end; those EUR entries were not changed by that USA/JPN validation.
- The permanent ISA floor is excluded from the 79: the 42 canonical
  `mcr`/`mrc`/`swi` assembly files listed in
  `docs/research/campaign-analytics/cmatch-parked-and-floor.md`. They remain
  inline-assembly-only and are not batch-carve targets.

**Closeable EUR funcs found: 77** (68 C-absorbed-recoverable + 9 clean PASS).
The remaining 2 are the data blobs above; no build, baserom, source, or
delinks file was changed for this census.
