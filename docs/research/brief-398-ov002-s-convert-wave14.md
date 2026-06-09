[//]: # (markdownlint-disable MD013 MD041)

# Brief 398 — ov002 reg-alloc → `.s`, upper-half wave 14

**Brief:** 398 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog from waves 1–13 (= 104 ships). The `.s` endgame is the volume lane
(permuter niche — brief 383; clean-C tapped). Scaffolder remains **sole owner**
of `ov002/delinks.txt` (decomper on ov004 Thumb) — keep it canonically
address-sorted with `tools/sort_delinks.py`. Per-pick `asm_escape` byte-identity
+ the `kind:bss` link gate; EUR `ninja sha1` per-pick. Target ~8.

## Headline — 8 upper-half `.s` shipped (all 0x50), EUR `ninja sha1` green

**8 byte-exact upper-half ov002 `.s` shipped**, all link-clean (every `data_`
ref is `kind:bss`; 2 of 8 carry no data ref). Lossless carve (ov002 `.s`
func-entries 249 → 257 = **+8 exactly = ship count**, **0 overlaps**), EUR
`ninja sha1` **OK**.

## The 8 ships (all ov002, upper half, size 0x50)

| addr | bl | data ref (kind) |
|---|---|---|
| `022882bc` | 1 | `ov002_022cf178` (bss) |
| `0228bb58` | 0 | `ov002_022d016c` (bss) |
| `0228bba8` | 1 | — |
| `0228deec` | 2 | `ov002_022cf16c` (bss) |
| `02294428` | 2 | — |
| `022946e4` | 1 | `ov002_022cf17c` (bss) |
| `022aecd0` | 4 | `ov002_022d0f2c` (bss) |
| `022b03f4` | 0 | `021064a8` (bss, **main** — cross-module) |

All `asm_escape --whole-function` → `✅ whole-function .s byte-identical vs the
delinked .o`. Genuine reg-alloc walls:

- **`022b03f4`** (leaf, `bl=0`): bound-checks → a **signed modulo-by-32 idiom**
  (`asr#4`/`lsr#1b`/`ror#1b`) → table lookup → bit-test → value-map. References
  the **main** bss table `data_021064a8`; the cross-module link is validated by
  `ninja sha1` (byte-identical), so `kind:bss` holds across modules.
- **`022aecd0`**: a `func_02037208` status-message call carrying the
  `mov r0,#0x3a / sub r1,r0,#0x3b` **`mov;sub` −1 quirk** (= `func_02037208(0x3a,
  -1, 0, 1)`).
- **`0228bba8`**: stack-frame func with **frame-cleanup-on-early-return**
  (`addeq sp,#8` + `ldmeq`) — the inline-vs-branch ordering mwcc can't be steered
  to.
- **`022882bc`**: bit-extract (`lsl#1f/lsr#1f`) + CSE'd index (`mul`/`ldr`) +
  shifted compare (`cmp r1, r0, lsl#1`) + value-map.

No byte-pack.

## Per-pick verification — the `kind:bss` link gate

Swept the 30 smallest uncarved upper-half candidates: **23/30 CLEAN**. The **7
drops** each reference a `kind:data(any)` symbol (would `Undefined`-fail the link
even at objdiff-100% — briefs 361/364):

| dropped | offending ref |
|---|---|
| `02297c3c` | `022c9508` |
| `0229a060` | `022ca370` |
| `02253638` | `022cad34` |
| `022aaf38` | `022cc498` |
| `022aafe4` | `022cc4d0` |
| `022627ac` | `022cb96c` |
| `0229ad88` | `022cba04` |

The first 5 are the parked set (wave-9 trio member `02253638` + the 5 wave-13
drops); `022627ac` (the wave-11 drop) and `0229ad88` are the 2 new this wave.
All caught **before** carving.

## Carve audit — +8 exactly, 0 overlaps

| metric | before | after | Δ |
|---|---|---|---|
| ov002 `.s` func-entries | 249 | 257 | **+8** |
| ov002 total func `.text` entries | 1143 | 1151 | **+8** |

`sort_delinks.py`: 1 inversion → **0**. Delinks diff = **24 insertions, 0
deletions**. An explicit overlap scan over all **1200** `.text` intervals reports
**NONE** — note `0228bb58` and `0228bba8` are *adjacent* (`end == next.start`,
half-open intervals), which is correctly **not** an overlap.

## Gate — `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **unaffected** | **unaffected** |

EUR: `gx-spirit-caller_eur.nds: OK` (byte-identical) with all 8 carved. USA/JPN:
`_is_region_source_excluded` returns `region != "eur"` for no-region-prefix
paths (`configure.py:1176`), so `src/overlay002/*.s` is excluded from those
builds; config change is under `config/eur/`. Brain reproduces the full 3-region
SHA1 on merge.

## Thinning watch — `kind:data` fraction rising into the 0x54–0x58 band

The classifier hit **7** `kind:data` drops in the first 30 probed (vs 5/28 in
wave 13) — the data-table-referencing funcs cluster in the 0x54–0x58 band I'm now
entering. ~**54** shippable upper-half `≤0x60` candidates remain after this wave
→ **~6–7 waves** of runway; past `0x60` widens it. Still healthy (23/30 clean).

## Files

`src/overlay002/` +8 `.s`; `arm9/overlays/ov002/delinks.txt` +8 blocks
(sort-normalised). No main/USA/JPN source or delink change. Running total
scaffolder reg-alloc `.s`: **112** (main 17, ov002 upper-half 95).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
