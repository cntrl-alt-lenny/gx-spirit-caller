[//]: # (markdownlint-disable MD013 MD041)

# Brief 396 — ov002 reg-alloc → `.s`, upper-half wave 13

**Brief:** 396 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog from waves 1–12 (= 96 ships). The `.s` endgame is the volume lane
(permuter is niche — brief 383; clean-C is tapped). Scaffolder remains **sole
owner** of `ov002/delinks.txt` (decomper is on ov004 Thumb, brief 395) — keep it
canonically address-sorted with `tools/sort_delinks.py`. Per-pick `asm_escape`
byte-identity + the `kind:bss` link gate; EUR `ninja sha1` per-pick. Target ~8.

## Headline — 8 upper-half `.s` shipped (0x48–0x50), EUR `ninja sha1` green

**8 byte-exact upper-half ov002 `.s` shipped**, all link-clean (every `data_`
ref is `kind:bss`; 3 of 8 carry no data ref). Lossless carve (ov002 `.s`
func-entries 241 → 249 = **+8 exactly**, **0 overlaps**), EUR `ninja sha1`
**OK**. USA/JPN unaffected by construction (`src/overlay002/*.s` is EUR-only;
config change under `config/eur/`).

## The 8 ships (all ov002, upper half ≥ 0x02234000)

| addr | size | bl | data ref (kind) |
|---|---|---|---|
| `022b53c4` | 0x48 | 4 | — |
| `02281a28` | 0x4c | 1 | `022cf16c` (bss) |
| `0228b1b8` | 0x4c | 2 | `022cd3f4` (bss) |
| `0229288c` | 0x4c | 1 | `022cf16c` (bss) |
| `022374e8` | 0x50 | 5 | — |
| `0226d814` | 0x50 | 0 | — |
| `0227aee0` | 0x50 | 2 | `022cf1a4` (bss) |
| `022869d0` | 0x50 | 0 | `022cf16c` (bss) |

All `asm_escape --whole-function` → `✅ whole-function .s byte-identical vs the
delinked .o`. Genuine reg-alloc walls: guarded value-map chains with
`movne #1 / moveq #0` reg-reuse (`022b53c4`), index-compute (`mla`/`lsl`) →
bitfield-extract → dispatch with inline-vs-branch return (`02281a28`), a leaf
value-map whose literal is reused via `add r1, r1, #0xc0` then `bx lr`
(`0226d814` — `bl=0`), and call sequences with `lsl#1f/lsr#1f` bit-tests
(`022374e8`). No byte-pack.

## Per-pick verification — the `kind:bss` link gate

Swept the 28 smallest uncarved upper-half candidates through
`asm_escape --whole-function` + a global symbol→kind lookup: **23/28 CLEAN**.
The **5 drops** each reference a `kind:data(any)` symbol (would `Undefined`-fail
the link even at objdiff-100% — briefs 361/364; the comparator wildcards relocs
but the linker needs the symbol):

| dropped | offending ref | kind |
|---|---|---|
| `02297c3c` | `data_ov002_022c9508` | data |
| `0229a060` | `data_ov002_022ca370` | data |
| `02253638` | `data_ov002_022cad34` | data |
| `022aaf38` | `data_ov002_022cc498` | data |
| `022aafe4` | `data_ov002_022cc4d0` | data |

(`02253638` is the known wave-9 `kind:data` trio member; `0229a060` also refs an
`02104f4c` that *is* bss — one `kind:data` ref is enough to drop.)

## Carve audit — +8 exactly, 0 overlaps

| metric | before | after | Δ |
|---|---|---|---|
| ov002 `.s` func-entries | 241 | 249 | **+8** |
| ov002 total func `.text` entries | 1135 | 1143 | **+8** |

`sort_delinks.py`: 3 inversions → **0**. The delinks diff is **24 insertions, 0
deletions** (the file was already address-sorted, so the 8 blocks slotted in as
pure interleaved insertions). An explicit overlap scan over all **1192** `.text`
intervals reports **NONE** — every carve is disjoint. `dsd` is
block-order-agnostic, so the sort is pure merge-hygiene; `ninja sha1` confirms
the file links byte-identically.

## Gate — `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **unaffected** | **unaffected** |

EUR: `gx-spirit-caller_eur.nds: OK` (byte-identical) with all 8 carved. USA/JPN:
`_is_region_source_excluded` returns `region != "eur"` for no-region-prefix
paths (`configure.py:1176`), so `src/overlay002/*.s` is excluded from those
builds and the config change is under `config/eur/`. Nothing in the USA/JPN
build changed. The brain reproduces the full 3-region SHA1 on merge.

## Thinning watch — NOT thinning

Uncarved upper-half `≤0x60` at wave-13 start: **70** funcs (excl. `__sinit_*`).
The classifier hit 5 `kind:data` drops in the first 28 probed, so ~**62**
shippable remain after this wave's 8 → **~7–8 waves** of runway at this band;
past `0x60` widens it. The 23/28 clean rate says the vein is still healthy.

## Files

`src/overlay002/` +8 `.s`; `arm9/overlays/ov002/delinks.txt` +8 blocks
(sort-normalised). No main/USA/JPN source or delink change. Running total
scaffolder reg-alloc `.s`: **104** (main 17, ov002 upper-half 87).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
