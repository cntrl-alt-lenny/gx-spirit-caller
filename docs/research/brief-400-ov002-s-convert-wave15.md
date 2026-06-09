[//]: # (markdownlint-disable MD013 MD041)

# Brief 400 — ov002 reg-alloc → `.s`, upper-half wave 15

**Brief:** 400 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog from waves 1–14 (= 112 ships). The `.s` endgame is the volume lane
(permuter niche — brief 383; clean-C tapped). Scaffolder remains **sole owner**
of `ov002/delinks.txt` (decomper on ov004 Thumb) — keep it canonically
address-sorted with `tools/sort_delinks.py`. Per-pick `asm_escape` byte-identity
+ the `kind:bss` link gate; EUR `ninja sha1` per-pick. Target ~8.

## Headline — 8 upper-half `.s` shipped (0x54–0x58), EUR `ninja sha1` green

**8 byte-exact upper-half ov002 `.s` shipped**, all link-clean (every `data_`
ref is `kind:bss`; 6 of 8 carry no data ref). Lossless carve (ov002 `.s`
func-entries 257 → 265 = **+8 exactly = ship count**, **0 overlaps**), EUR
`ninja sha1` **OK**.

## The 8 ships (all ov002, upper half, 0x54–0x58)

| addr | size | bl | data ref (kind) |
|---|---|---|---|
| `02286a94` | 0x54 | 0 | `ov002_022cf16c` (bss) |
| `022875c4` | 0x54 | 3 | — |
| `0228de58` | 0x54 | 3 | — |
| `022933c4` | 0x54 | 3 | — |
| `02294370` | 0x54 | 2 | — |
| `02294504` | 0x54 | 3 | — |
| `0224375c` | 0x58 | 2 | — |
| `0226c930` | 0x58 | 1 | `ov002_022d016c`, `ov002_022d0e6c` (bss) |

All `asm_escape --whole-function` → `✅ whole-function .s byte-identical vs the
delinked .o`. Genuine reg-alloc walls: bit-extract + CSE'd index + shifted
compare + **dual value-map** (`movls #1` / `movcs #1` / `movcc #0`) in a leaf
(`02286a94`, `bl=0`); an accumulator (`r5`) held across two identical calls then
a guard early-return-vs-tail-call (`022875c4`); multi-stage shift extraction
(`lsl#17/lsr#17`, `lsl#10/lsr#10/asr#8`) feeding an inline-vs-branch dispatch
(`0224375c`); and a stack-arg guard chain with `movne #0x800` value-map
(`0226c930`). No byte-pack.

## Per-pick verification — the `kind:bss` link gate

Swept the 34 smallest uncarved upper-half candidates: **25/34 CLEAN**. The **9
drops** each reference a `kind:data(any)` symbol (would `Undefined`-fail the link
even at objdiff-100% — briefs 361/364):

| dropped | offending ref | note |
|---|---|---|
| `02297c3c` | `022c9508` | parked |
| `0229a060` | `022ca370` | parked |
| `02253638` | `022cad34` | parked (wave-9 trio #1) |
| `022aaf38` | `022cc498` | parked |
| `022aafe4` | `022cc4d0` | parked |
| `022627ac` | `022cb96c` | parked |
| `0229ad88` | `022cba04` | parked |
| `022aaf8c` | `022cc4b4` | **new** |
| `0225368c` | `022cad38` | **new (wave-9 trio #2)** |

The parked set grows to 9; the wave-9 `kind:data` trio is now 2/3 surfaced
(`02253638`, `0225368c` — the third, `022536e8`, likely in the next band). All
caught **before** carving.

## Carve audit — +8 exactly, 0 overlaps

| metric | before | after | Δ |
|---|---|---|---|
| ov002 `.s` func-entries | 257 | 265 | **+8** |
| ov002 total func `.text` entries | 1151 | 1159 | **+8** |

`sort_delinks.py`: 2 inversions → **0**. Delinks diff = **24 insertions, 0
deletions**. Overlap scan over all **1208** `.text` intervals → **NONE**.

## Gate — `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **unaffected** | **unaffected** |

EUR: `gx-spirit-caller_eur.nds: OK` (byte-identical) with all 8 carved. USA/JPN:
`src/overlay002/*.s` is EUR-only (`configure.py:1176`); config change under
`config/eur/`. Brain reproduces the full 3-region SHA1 on merge.

## Thinning watch — `kind:data` drop rate still climbing

Drop rate by wave: **18 % (5/28, w13) → 23 % (7/30, w14) → 26 % (9/34, w15)** —
the data-table-referencing funcs cluster in the 0x54–0x5c band. ~**46**
shippable upper-half `≤0x60` candidates remain after this wave → **~5–6 waves**
of runway; past `0x60` re-widens the pool. Still healthy (25/34 clean).

## Files

`src/overlay002/` +8 `.s`; `arm9/overlays/ov002/delinks.txt` +8 blocks
(sort-normalised). No main/USA/JPN source or delink change. Running total
scaffolder reg-alloc `.s`: **120** (main 17, ov002 upper-half 103).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
