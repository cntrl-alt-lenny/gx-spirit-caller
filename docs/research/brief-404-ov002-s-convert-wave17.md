[//]: # (markdownlint-disable MD013 MD041)

# Brief 404 — ov002 reg-alloc → `.s`, upper-half wave 17

**Brief:** 404 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog from waves 1–16 (= 128 ships). The `.s` endgame is the volume lane
(permuter niche — brief 383; clean-C tapped). Scaffolder remains **sole owner**
of `ov002/delinks.txt` — kept canonically address-sorted with
`tools/sort_delinks.py`. Candidate band `≤0x6c` (widened in wave 16). Per-pick
`asm_escape --whole-function` byte-identity + the `kind:bss` link gate; EUR
`ninja sha1` green with all picks carved. Target ~8.

## Headline — 8 upper-half `.s` shipped (0x58–0x5c), EUR `ninja sha1` green

**8 byte-exact upper-half ov002 `.s` shipped** (1× 0x58 + 7× 0x5c), all
link-clean (every `data_` ref is `kind:bss`; 1 carries no data ref at all),
all byte-identical on the **first** `asm_escape` attempt. Lossless carve
(ov002 `.s` func-entries 273 → 281 = **+8 exactly = ship count**, **0
overlaps** across 1224 `.text` intervals), EUR `ninja sha1` **OK**. This wave
also ran the classifier over the **entire** `≤0x6c` pool (82 funcs, not just a
small-end window): only **2 new `kind:data` drops** beyond the 10 already
parked → parked set now **12**; the 0x60–0x6c tier is nearly all clean.

## The 8 ships (all ov002, upper half ≥ 0x02234000)

| addr | size | bl | data ref (kind) |
|---|---|---|---|
| `0225a51c` | 0x5c | 1 | `022d016c`, `022cd3f4` (bss) |
| `02287f2c` | 0x5c | 0 | `022cf180`, `022cf17c` (bss) |
| `022889ec` | 0x5c | 1 | `022d0250` (bss) |
| `0228dd28` | 0x5c | 1 | `022cf16c` (bss) |
| `022926f8` | 0x5c | 3 | — (fn-ptr pool load, see below) |
| `022927d0` | 0x5c | 0 | `022cf16c`, `022cf26c` (bss) |
| `022950e8` | 0x5c | 3 | — |
| `022aebec` | 0x58 | 3 | `022d0f2c` (bss) |

All `asm_escape --whole-function` → `✅ whole-function .s byte-identical vs the
delinked .o`. Genuine reg-alloc walls: the per-player **bit-extract →
`mul`-by-0x868-stride** slot select (`lsl#31/lsr#31` + `rsb` deriving both
player indexes, two `mul`s, dual-table `ldr [base, idx]` compare with early
`bxcs`) (`02287f2c`, leaf); the same stride-select feeding a **flag-chained
`ldrne`/`ldrneh`/`cmpne`/`movne` predication ladder** collapsed into a bool
invert (`moveq #1`/`movne #0`) — C `&&` emits branches instead (`022927d0`,
leaf); pool **literal re-load** around a clamped RMW (`ldr _LIT0` twice
bracketing `cmp #8`/`movlt`/`str` on field `+0xd4`) — the cached-base-vs-
re-load divergence class (`022aebec`); plus conditional-early-return epilogues
(`ldmeqia sp!,{r4,pc}`).

**New lane datum:** `022926f8` pool-loads the **address of a main-arm9
function** (`func_0202e258`). That is a `kind:function` ref, not
`kind:data(any)` — the `.extern` resolves at link, and EUR `ninja sha1`
confirms byte-clean. Function-pointer pool loads do **not** trip the
`kind:data` gate; only `data(any)` targets do.

## Per-pick verification — the `kind:bss` link gate, full-band sweep

This wave classified **all 82** uncarved upper-half `≤0x6c` candidates from
`relocs.txt` `kind:load` targets × `symbols.txt` kinds (instead of only the
N smallest): **70/82 CLEAN**. The 12 drops each reference a `kind:data(any)`
symbol (would `Undefined`-fail the link even at objdiff-100 % — briefs
361/364): the 10 already parked (`02297c3c`, `0229a060`, `02253638`,
`022aaf38`, `022aafe4`, `022627ac`, `0229ad88`, `022aaf8c`, `0225368c`,
`022536e8`) **plus 2 new** — `02297d08` (0x60, `data_ov002_022c9ad0`) and
`022ab038` (0x6c, `data_ov002_022cc4d0` + `022cc498`, the `022aaf38`/
`022aafe4` block). Parked set now **12**. Both caught **before** carving.
Two apparent unknowns resolved clean against main-arm9 `symbols.txt`:
`022926f8` (fn-ptr → `func_0202e258`, shipped) and `022a6fec`
(`data_02104f4c` = main **bss**).

## Carve audit — +8 exactly, 0 overlaps

| metric | before | after | Δ |
|---|---|---|---|
| ov002 `.s` func-entries | 273 | 281 | **+8** |
| ov002 total func `.text` entries | 1167 | 1175 | **+8** |

`sort_delinks.py`: 2 inversions → **0**. Delinks diff = additions only.
Overlap scan over all **1224** `.text` intervals → **NONE**; every carve end =
start + symtab size exactly (`022889ec` lands flush against wave-16's
`02288a48`, `022927d0` flush against pool candidate `0229282c`).

## Gate — `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **unaffected** | **unaffected** |

EUR: `gx-spirit-caller_eur.nds: OK` (byte-identical) with all 8 carved. USA/JPN:
`src/overlay002/*.s` is EUR-only (`configure.py:1176`); config change under
`config/eur/`. Brain reproduces the full 3-region SHA1 on merge.

## Thinning watch — drop rate flat at 28 %; runway ~7 waves

On the wave-16-comparable window (the ~39 smallest, through 0x60) the
`kind:data` drop rate is 11/39 = **28 % — flat vs wave 16** (series 18 → 23 →
26 → 28 → 28 %, w13–17); note that window re-counts the accumulated parked
set, which concentrates at the small end. The full-band sweep is the better
signal: **12/82 = 15 % pool-wide**, only 2 *new* drops among the 72
fresh-swept. After this wave: 82 − 12 parked − 8 shipped = **~62 clean
candidates** → **~7 waves** of runway at 8/wave. Well above the ~2-wave
stop threshold — **no step-up-vs-pivot call needed yet**. The remaining
0x5c stock is 3 (`0229f2f8`, `022ae284`, `022aec74`, all clean); wave 18
starts there and steps into the 17-clean 0x60 tier.

## Files

`src/overlay002/` +8 `.s`; `arm9/overlays/ov002/delinks.txt` +8 blocks
(sort-normalised). No main/USA/JPN source or delink change. Running total
scaffolder reg-alloc `.s`: **136** (main 17, ov002 upper-half 119).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
