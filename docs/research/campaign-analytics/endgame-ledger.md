[//]: # (markdownlint-disable MD013 MD041)

# Endgame ledger: the measured residual

Snapshot generated 2026-07-22 from commit `8b1276d9` (the current queue
worktree). This supersedes the 2026-07-16 ledger. It is a mechanical snapshot:
the byte totals come from `tools/progress.py`, and the wall buckets come from
`tools/wall_aware_headroom.py`. Neither is a prediction of what can be
matched.

## Headline

The true current code gap is **54,728 B across the three regions**:

| Region | Matched code / total code | Arithmetic | Code gap |
|---|---:|---:|---:|
| EUR | 2,374,884 / 2,388,172 | 2,388,172 − 2,374,884 | **13,288 B** |
| USA | 2,366,408 / 2,387,188 | 2,387,188 − 2,366,408 | **20,780 B** |
| JPN | 2,366,528 / 2,387,188 | 2,387,188 − 2,366,528 | **20,660 B** |
| **Total** | | 13,288 + 20,780 + 20,660 | **54,728 B** |

This is the `.s`/`.c` code-coverage gap, not the readable-C gap. The same
snapshot's readable-C numerator is 201,966 B (EUR), 171,612 B (USA), and
171,620 B (JPN), against `.text` denominators of 2,385,948 B / 2,384,964 B /
2,384,964 B. Therefore the remaining readable-C area is 2,183,982 B /
2,213,352 B / 2,213,344 B respectively. `progress.py` reports both metrics;
the endgame byte gap above is the one that reconciles to all shipped code.

## Byte gap by module

These are the non-zero per-module gaps from the same `progress.py
--by-module` output. Rows sum to the regional totals above; they include
alignment/data-range differences exactly as the committed delinks tier does.

| Module | EUR gap | USA gap | JPN gap |
|---|---:|---:|---:|
| main | 2,270 | 4,328 | 4,208 |
| itcm | 1,884 | 2,156 | 2,156 |
| ov001 | 452 | 452 | 452 |
| ov002 | 0 | 304 | 304 |
| ov003 | 872 | 916 | 916 |
| ov004 | 5,902 | 7,104 | 7,104 |
| ov005 | 0 | 224 | 224 |
| ov006 | 0 | 484 | 484 |
| ov007 | 0 | 176 | 176 |
| ov008 | 0 | 108 | 108 |
| ov009 | 0 | 136 | 136 |
| ov010 | 0 | 368 | 368 |
| ov011 | 0 | 52 | 52 |
| ov013 | 0 | 20 | 20 |
| ov014 | 816 | 948 | 948 |
| ov015 | 180 | 284 | 284 |
| ov016 | 0 | 220 | 220 |
| ov017 | 0 | 284 | 284 |
| ov018 | 0 | 348 | 348 |
| ov019 | 912 | 1,044 | 1,044 |
| ov020 | 0 | 476 | 476 |
| ov021 | 0 | 88 | 88 |
| ov022 | 0 | 160 | 160 |
| ov023 | 0 | 100 | 100 |
| **Total** | **13,288** | **20,780** | **20,660** |

The largest residual is ov004: 20,110 B across the regions, followed by
main: 10,806 B and ITCM: 6,196 B. The old ledger's missing ov004 row and its
stale EUR/ITCM prose are superseded by this arithmetic.

## Corrected wall-aware candidate buckets

`python tools/wall_aware_headroom.py --json` scans the **EUR baseline live
source set** (`src/main` and `src/overlayNNN`, filtered by committed delinks).
USA/JPN use the EUR C source once a match is ported, so this is the project's
canonical candidate census rather than three independent source trees.

| Bucket | Files | Meaning |
|---|---:|---|
| Confirmed permanent | 32 | P-NN or unconditional coprocessor/SWI/system-register instruction |
| Coercible | 116 | C-NN citation; a documented lever exists, not a guarantee |
| Unknown / never independently assessed | 5,945 | cohort stamp or free-form wall prose; upper-bound candidate pool |
| No marker | 32 | no machine-readable wall evidence |
| **Candidate total** | **6,093** | 116 + 5,945 + 32; not a work-list |

The major module buckets are:

| Module | Permanent | Coercible | Unknown | No marker | Candidate |
|---|---:|---:|---:|---:|---:|
| ov002 | 0 | 14 | 2,736 | 0 | 2,750 |
| main | 31 | 58 | 2,370 | 28 | 2,456 |
| ov004 | 0 | 8 | 150 | 3 | 161 |
| ov006 | 0 | 3 | 158 | 0 | 161 |
| ov011 | 1 | 15 | 70 | 1 | 86 |
| all other overlays | 0 | 18 | 461 | 0 | 479 |
| **Total** | **32** | **116** | **5,945** | **32** | **6,093** |

This classifier deliberately does not call a `GLOBAL_ASM` or brief 294/302
cohort stamp permanent. A stamped file is only evidence that a mechanical
whole-function carve was used; it is not a per-function proof of an ISA wall.
Likewise, C-NN is coercible, not permanent. These corrections are the reason
the old “44 convertible” headline must not be used.

## ov002: verified wall cohort

The 2,750 live `.s` files remaining in ov002 are not a fresh, unclassified
pool. Brief 654 mechanically accounted for the residue, and the current
classifier still reports the same 2,750 files:

| Residue | Count | Current treatment |
|---|---:|---|
| GLOBAL_ASM / brief-294 reg-alloc cohort | 2,719 | documented negative reg-alloc result; unknown to the classifier, not a new sweep target |
| brief-288/290 commutative-add/CSE prose cohort | 17 | documented near-miss/negative result; 15 narrow cases plus 2 boundary overlaps |
| Current C-34 coercible residue | 14 | listed by `--coercible`; includes the seven giant duplicate-pool cases and parked small cases |
| **Total ov002 `.s`** | **2,750** | 2,736 unknown + 14 coercible |

The source reports 2,719 + 17 = 2,736 files carrying the two older negative
cohort families. The classifier leaves them in `unknown` because their prose
does not prove a P-NN wall. Brief 654's direct re-test reproduced the
reg-alloc signature on a brief-288/290 file, so the cohort is verified as
historical evidence, not silently promoted to “permanent.”

The 14 current ov002 C-34 paths are:

`021aba60`, `021c4c9c`, `021d9828`, `021e4ba8`, `021ef7b4`, `021efac8`,
`021f2ca8`, `021ff6d0`, `0220eb00`, `022476e8`, `02247ad8`, `02247b6c`,
`022a1870`, and `022b595c`.

## ITCM residual

ITCM is a real code gap, not a 39-function EUR-only floor. The current
per-module report gives:

| Region | Matched / total code | Unmatched functions in prior census | Gap |
|---|---:|---:|---:|
| EUR | 272 / 2,156 | 11 | **1,884 B** |
| USA | 0 / 2,156 | 14 | **2,156 B** |
| JPN | 0 / 2,156 | 14 | **2,156 B** |
| **Total** | | **39** | **6,196 B** |

The 11 EUR addresses are `01ff8000`, `01ff8098`, `01ff8180`, `01ff81d8`,
`01ff8334`, `01ff8414`, `01ff8544`, `01ff8624`, `01ff8664`, `01ff86c4`, and
`01ff87c0`. USA/JPN add `01ff8400`, `01ff86fc`, and `01ff8770`; all other
addresses are shared with the EUR list. Source: the corrected ITCM census in
the prior ledger and the current `progress.py --by-module` totals.

## Confirmed-permanent ISA floor

These are the 32 live EUR-baseline files classified permanent by
`wall_aware_headroom.py`: 31 in main and one in ov011. They carry a P-NN
classification or an unconditional `mcr`, `mrc`, `swi`, `msr`, or `mrs` in
the instruction body. They are ISA-permanent under the current toolchain;
only an inline-assembly wrapper lane is appropriate.

```text
src/main/BitUnPack.s
src/main/Div.s
src/main/func_02000950.s
src/main/func_020009fc.s
src/main/func_02000a78.s
src/main/func_020922d8.s
src/main/func_02092324.s
src/main/func_0209286c.s
src/main/func_02092898.s
src/main/func_020928cc.s
src/main/func_020928e8.s
src/main/func_02092904.s
src/main/func_02092940.s
src/main/func_02092e90.s
src/main/func_02092f18.s
src/main/func_02092fa8.s
src/main/func_020b2978.s
src/main/func_020b2a10.s
src/main/func_020b2ab4.s
src/main/func_020b2b50.s
src/main/func_020b2bdc.s
src/main/func_020b2c68.s
src/main/func_020b2cc4.s
src/main/GetCRC16.s
src/main/IsDebugger.s
src/main/LZ77UnCompReadByCallbackWrite16bit.s
src/main/Mod.s
src/main/RLUnCompReadByCallbackWrite16bit.s
src/main/RLUnCompReadNormalWrite8bit.s
src/main/SoftReset.s
src/main/VBlankIntrWait.s
src/overlay011/func_ov011_021d2ca8.s
```

The permanent count is a classifier count, not a claim that every
cross-region copy has a distinct physical file. The 32-file list is the
current live EUR baseline; region-specific delinks must be checked before
using it as a USA/JPN file inventory.

## Closed or superseded prose rows

- The EUR data blobs `020b2d2c` and `020b3c78` are matched and contribute no
  current gap.
- The old EUR ov006 verify-fail parks are phantom: current ov006 is complete
  on the EUR delinks tier (`102,972 / 102,972` code bytes).
- The old seven-address USA/JPN “main floor” is no longer a valid permanent
  row. Only current byte gaps, above, are authoritative; tool-error and
  verify-fail classifications require a warm-tree re-census before being
  parked.

## Reproduction and limits

Run, without a build:

```text
python tools/progress.py --version eur
python tools/progress.py --version usa
python tools/progress.py --version jpn
python tools/progress.py --version eur --by-module
python tools/wall_aware_headroom.py --json
```

The progress totals are committed-delinks values and therefore move when a
new C or `.s` ship lands. `wall_aware_headroom.py` is EUR-baseline and
live-delinks filtered; it is a classification upper bound, not a promise of
6,093 readable-C wins. The three region totals, the per-module rows, and the
bucket totals above were captured from the same snapshot.
