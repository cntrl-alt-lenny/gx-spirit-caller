[//]: # (markdownlint-disable MD013 MD041)

# Brief 402 — ov002 reg-alloc → `.s`, upper-half wave 16

**Brief:** 402 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog from waves 1–15 (= 120 ships). The `.s` endgame is the volume lane
(permuter niche — brief 383; clean-C tapped). Scaffolder remains **sole owner**
of `ov002/delinks.txt` — keep it canonically address-sorted with
`tools/sort_delinks.py`. **New this wave:** widened the candidate enumeration to
`≤0x6c` (the brief's "step up past 0x60 if the band thins"). Per-pick
`asm_escape` byte-identity + the `kind:bss` link gate; EUR `ninja sha1`
per-pick. Target ~8.

## Headline — 8 upper-half `.s` shipped (all 0x58), EUR `ninja sha1` green

**8 byte-exact upper-half ov002 `.s` shipped**, all link-clean (every `data_`
ref is `kind:bss`; 5 of 8 carry no data ref). Lossless carve (ov002 `.s`
func-entries 265 → 273 = **+8 exactly = ship count**, **0 overlaps**), EUR
`ninja sha1` **OK**. The 0x58 band still held 9 clean picks, so the step-up into
0x60–0x6c wasn't needed yet — but the widened probe **confirms the pool
re-widens** (44 uncarved funcs in 0x60–0x6c, most clean).

## The 8 ships (all ov002, upper half, size 0x58)

| addr | bl | data ref (kind) |
|---|---|---|
| `0227b960` | 4 | — |
| `02288a48` | 1 | `ov002_022d0250` (bss) |
| `02291f00` | 0 | `ov002_022cf16c` (bss) |
| `022936e0` | 2 | — |
| `02294ac0` | 3 | — |
| `022a6bdc` | 0 | — |
| `022a6cc4` | 1 | — |
| `022a8694` | 2 | `ov002_022d0f2c`, `ov002_022d1a9c` (bss) |

All `asm_escape --whole-function` → `✅ whole-function .s byte-identical vs the
delinked .o`. Genuine reg-alloc walls: callee-saved-heavy `-1`-sentinel
compare chain (`mvn r1,#0` / `cmp r0,r1`) with `moveq r0,r5` value-map
(`0227b960`); multi-stage shift extraction (`lsl#17/lsr#15`, `lsl#13/lsr#13`)
→ inline-vs-branch (`02288a48`); a leaf abs-value-then-clamp idiom
(`subs`/`rsbmi` → `lsl#5` → `cmp #0x100`/`movge`) (`022a6bdc`, `bl=0`); and
stack-local out-params with frame-cleanup-on-early-return (`addge sp,#8`)
(`022a8694`). No byte-pack.

## Per-pick verification — the `kind:bss` link gate

Swept the 36 smallest uncarved upper-half (`≤0x6c`) candidates: **26/36 CLEAN**.
The **10 drops** each reference a `kind:data(any)` symbol (would `Undefined`-fail
the link even at objdiff-100% — briefs 361/364): the 9 parked
(`02297c3c`, `0229a060`, `02253638`, `022aaf38`, `022aafe4`, `022627ac`,
`0229ad88`, `022aaf8c`, `0225368c`) **plus `022536e8`** — which **completes the
wave-9 `kind:data` trio** (`02253638`/`0225368c`/`022536e8`, all referencing the
`022cad3x` data block). The parked set is now **10**. All caught **before**
carving.

## Carve audit — +8 exactly, 0 overlaps

| metric | before | after | Δ |
|---|---|---|---|
| ov002 `.s` func-entries | 265 | 273 | **+8** |
| ov002 total func `.text` entries | 1159 | 1167 | **+8** |

`sort_delinks.py`: 1 inversion → **0**. Delinks diff = **24 insertions, 0
deletions**. Overlap scan over all **1216** `.text` intervals → **NONE**.

## Gate — `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **unaffected** | **unaffected** |

EUR: `gx-spirit-caller_eur.nds: OK` (byte-identical) with all 8 carved. USA/JPN:
`src/overlay002/*.s` is EUR-only (`configure.py:1176`); config change under
`config/eur/`. Brain reproduces the full 3-region SHA1 on merge.

## Thinning watch — band widened; runway re-expanded

`kind:data` drop rate by wave: **18 % → 23 % → 26 % → 28 %** (w13–16) — still
climbing in the small band. But widening the enumeration to `≤0x6c` re-expands
the pool: the uncarved upper-half `≤0x6c` set is **90** funcs (46 at `≤0x60`,
**44** at 0x60–0x6c: 18/16/14/14 across 0x60/0x64/0x68/0x6c). Netting the ~10
parked `kind:data`, **~72 clean candidates remain** after this wave →
**~9 waves** of runway. Healthy.

## Files

`src/overlay002/` +8 `.s`; `arm9/overlays/ov002/delinks.txt` +8 blocks
(sort-normalised). No main/USA/JPN source or delink change. Running total
scaffolder reg-alloc `.s`: **128** (main 17, ov002 upper-half 111).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
