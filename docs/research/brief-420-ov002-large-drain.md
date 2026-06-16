[//]: # (markdownlint-disable MD013 MD041)

# Brief 420 - ov002 large drain

**Brief:** 420 (scaffolder). Start fresh from latest `main`, stay in ov002,
and drain the newly-unblocked large whole-function `.s` lane after the
brief-418 intermediate-pool tool landed.

## Headline - 30 largest remaining ov002 funcs ship byte-identical

Current `origin/main` had already drained the explicit `>=0x109c` ov002 tier:
the fresh census found **0 uncarved functions >=0x109c** and **2397 uncarved
ov002 functions** overall. This wave therefore started at the largest remaining
below-edge candidates (`0xf6c` downward), probed 32 address/symbol candidates,
and shipped 30 whole-function `.s` carves.

No `REFUSE` verdicts were hit. Two candidates were parked as runtime walls with
no emitted file and no delink block:

| func | addr | size | outcome |
|---|---:|---:|---|
| `func_ov002_022b88c4` | `0x022b88c4` | `0xa8c` | whole-function emit timed out |
| `func_ov002_021aec04` | `0x021aec04` | `0x99c` | preflight timed out |

## Shipped funcs

Each shipped candidate ran
`python3.13 tools/asm_escape.py --classify-data --version eur <func>` first and
then `python3.13 tools/asm_escape.py --whole-function --version eur <func>
--out src/overlay002/<func>.s`. Every emitted file reported byte-identical.

| func | exact range | size | preflight | byte check |
|---|---:|---:|---|---|
| `func_ov002_021b4be4` | `0x021b4be4-0x021b59b0` | `0xdcc` | CLEAN | byte-identical, 883 words |
| `func_ov002_021b59b0` | `0x021b59b0-0x021b6418` | `0xa68` | CLEAN | byte-identical, 666 words |
| `func_ov002_021b7d54` | `0x021b7d54-0x021b86f4` | `0x9a0` | CLEAN | byte-identical, 616 words |
| `func_ov002_021be4a0` | `0x021be4a0-0x021bf294` | `0xdf4` | CLEAN | byte-identical, 893 words |
| `func_ov002_021bf294` | `0x021bf294-0x021bff00` | `0xc6c` | CLEAN | byte-identical, 795 words |
| `func_ov002_021dbf98` | `0x021dbf98-0x021dcc48` | `0xcb0` | CLEAN | byte-identical, 812 words |
| `func_ov002_021dcc48` | `0x021dcc48-0x021dd950` | `0xd08` | CLEAN | byte-identical, 834 words |
| `func_ov002_021dfa80` | `0x021dfa80-0x021e05fc` | `0xb7c` | CLEAN | byte-identical, 735 words |
| `func_ov002_021e06e4` | `0x021e06e4-0x021e104c` | `0x968` | CLEAN | byte-identical, 602 words |
| `func_ov002_02200908` | `0x02200908-0x0220136c` | `0xa64` | CLEAN | byte-identical, 665 words |
| `func_ov002_022451b8` | `0x022451b8-0x02245cc8` | `0xb10` | CLEAN | byte-identical, 708 words |
| `func_ov002_0225b338` | `0x0225b338-0x0225bcf4` | `0x9bc` | CLEAN | byte-identical, 623 words |
| `func_ov002_0225ca60` | `0x0225ca60-0x0225d628` | `0xbc8` | CLEAN | byte-identical, 754 words |
| `func_ov002_022651c4` | `0x022651c4-0x02265bd8` | `0xa14` | CLEAN | byte-identical, 645 words |
| `func_ov002_0226eb5c` | `0x0226eb5c-0x0226f4dc` | `0x980` | CLEAN | byte-identical, 608 words |
| `func_ov002_0226f4dc` | `0x0226f4dc-0x02270184` | `0xca8` | CLEAN | byte-identical, 810 words |
| `func_ov002_02271ab4` | `0x02271ab4-0x02272414` | `0x960` | CLEAN | byte-identical, 600 words |
| `func_ov002_02275ebc` | `0x02275ebc-0x022768b4` | `0x9f8` | CLEAN | byte-identical, 638 words |
| `func_ov002_02277e4c` | `0x02277e4c-0x02278780` | `0x934` | CLEAN | byte-identical, 589 words |
| `func_ov002_02278780` | `0x02278780-0x022796ec` | `0xf6c` | CLEAN | byte-identical, 987 words |
| `func_ov002_02279b84` | `0x02279b84-0x0227a8fc` | `0xd78` | CLEAN | byte-identical, 862 words |
| `func_ov002_0227b9b8` | `0x0227b9b8-0x0227c630` | `0xc78` | CLEAN | byte-identical, 798 words |
| `func_ov002_0227ddf8` | `0x0227ddf8-0x0227e76c` | `0x974` | CLEAN | byte-identical, 605 words |
| `func_ov002_02289dfc` | `0x02289dfc-0x0228a6e0` | `0x8e4` | CLEAN | byte-identical, 569 words |
| `func_ov002_0228fa1c` | `0x0228fa1c-0x0229049c` | `0xa80` | CLEAN | byte-identical, 672 words |
| `func_ov002_0229f9a4` | `0x0229f9a4-0x022a04b0` | `0xb0c` | CLEAN | byte-identical, 707 words |
| `func_ov002_022a74e0` | `0x022a74e0-0x022a7e00` | `0x920` | CLEAN | byte-identical, 584 words |
| `func_ov002_022ab3e4` | `0x022ab3e4-0x022abf88` | `0xba4` | CLEAN | byte-identical, 745 words |
| `func_ov002_022ad7e4` | `0x022ad7e4-0x022ae284` | `0xaa0` | CLEAN | byte-identical, 680 words |
| `func_ov002_022b0484` | `0x022b0484-0x022b13ec` | `0xf68` | CLEAN | byte-identical, 986 words |

## Delink audit

The 30 added carve blocks are exact symbol-sized `.text` ranges in
`config/eur/arm9/overlays/ov002/delinks.txt`. They were deduped against
`origin/main` before the final gate and sorted with the canonical delink sorter.

```
config/eur/arm9/overlays/ov002/delinks.txt: 1450 blocks, 0 inversions -> 0; no-op (already sorted)
text intervals: 1405
shipped exact blocks: 30/30
duplicate exact ranges in working tree: 0
overlaps: 0
dedup vs origin/main exact ranges: 0 duplicates
```

## Verification

| gate | result |
|---|---|
| fresh-main census | `uncarved=2397`; `large>=0x109c=0` |
| preflight classify | 30 CLEAN ships; 0 REFUSE; 2 timeout parks |
| `asm_escape --whole-function --version eur` | 30/30 shipped funcs byte-identical |
| delink sorter | no-op after final sort; 0 inversions |
| exact block / dedup / overlap audit | 30/30 exact; 0 duplicates; 0 overlaps; 0 already on `origin/main` |
| EUR `python3.13 tools/configure.py eur && ninja sha1` | OK: `gx-spirit-caller_eur.nds: OK` |

Brain should run the full EUR/USA/JPN SHA gate on merge.
