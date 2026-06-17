[//]: # (markdownlint-disable MD013 MD041)

# Brief 422 — ov002 reg-alloc → `.s`, large drain (Windows lane)

**Brief:** 422 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog at the scaled cadence (#952 = 30 ships). Append carve blocks, run
`tools/sort_delinks.py` before committing, gate on 3-region `ninja sha1`. Target
~20–30.

## Headline — 28 upper-half `.s` shipped, 3-region `ninja sha1` green; worked around a `dsd dis` panic

**28 byte-exact upper-half ov002 `.s` shipped.** Probed 56 candidates across 4
parallel batches → **49 clean (88%)**, took 28. The `≤0x4c` seam is long gone, so
this wave is the **0x64–0x88** band. Notable: **`dsd dis` now panics** on the
post-main-endgame state — I enumerated and shipped without it (workaround below).

## ⚠️ `dsd dis` panics on the post-brief-419 main state

`dsd dis` aborts with `index out of bounds: the len is 640 but the index is 640`
at `cli/src/cmd/dis.rs:267`, right after
`Function at 0x02099928 was adjusted to include pre-code constant pool at
0x02099914` — i.e. the **main** module's disassembly (likely shaken loose by the
2600-`.s` main endgame in brief 419), **not** ov002 and **not** a conflict marker
(0 markers). It produces **0 gap files**, so the usual "re-dis → enumerate gap
`.s`" path is dead for every lane until `dsd` is fixed.

**Workaround (used this wave, needs no `dis`):**

1. **Enumerate** uncarved funcs as `symbols.txt` funcs **minus** the `delinks.txt`
   carved set (sizes from `symbols.txt`). The delinked gap `.o` (from `dsd delink`,
   which still works — the build is fine) are present for `asm_escape`.
2. **Probe** with `asm_escape --whole-function` (reads the gap `.o`, not `dis`).
3. **Post-filter the emitted `.s`** instead of pre-filtering the disasm: drop
   byte-pack (`and #0xff`/`orr lsl#8`), arg-pack (`021d479c` ref), and any
   `kind:data` extern. (`build/probe_filter.py` does verify + all three filters.)

**FLAG for the brain:** the `dsd dis` panic blocks the decomper's gap-`.s`
enumeration too — worth a `dsd` patch or circulating the symbols-vs-delinks
workaround.

## The 28 ships (all ov002, upper half ≥ 0x02234000, 0x64–0x88)

`022342d0` `02234b4c` `022386f8` `02239160` `02239700` `0223b1c4` `0223bdb8`
`02240650` `022420ec` `02242ea8` `022440d8` `022449e4` `02247670` `022483ac`
`02248b5c` `02248ce8` `02249310` `02249790` `0224a4f8` `0224a6f4` `0224aac0`
`0224ab44` `0224ae3c` `0224b158` `0224b27c` `0224b550` `0224b948` `0224bb54`

All `asm_escape` → `✅ byte-identical vs the delinked .o`. Link-clean — every
`data_` reference `kind:bss` (the mandatory post-filter; **0** `kind:data` in this
band), no byte-pack, no arg-pack. Wired with `sort_delinks.py` (1 inversion → 0,
**lossless**: +28 funcs, 0 dropped, address-sorted).

## Drop breakdown (56 probed)

| outcome | n | note |
|---|---:|---|
| **SHIP** | 49 | took 28; 21 held for the next wave |
| byte-pack | 6 | `(u8)`-cast clean-C drainable — left for that lane |
| verify-fail | 1 | rare `to_mwasm` translation gap |
| `kind:data` | 0 | (lower than the 0x50–0x60 band's ~25%) |

## Thinning watch — years of runway, NOT thinning

Uncarved **upper-half** funcs by size band: `≤0x60` = 33 (drained), `0x61–0x80`
= 129, `0x81–0xc0` = 322, `>0xc0` = 671 → **1155 total**. The decomper's wave-23
capability edge is ~0x1000, so nearly all of these are reachable. This wave drew
from 0x61–0x80; that band alone is ~16 more waves. **No thinning** — the cue to
pick the next EUR module is far off.

## Gate — 3-region `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Files

`src/overlay002/` +28 `.s`; `arm9/overlays/ov002/delinks.txt` +28 (sort-normalised).
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: **116** (main 17,
ov002 99).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
