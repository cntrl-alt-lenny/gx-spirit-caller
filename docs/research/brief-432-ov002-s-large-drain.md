[//]: # (markdownlint-disable MD013 MD041)

# Brief 432 — ov002 reg-alloc to .s, large drain wave (Windows lane)

**Brief:** 432 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog at the scaled cadence (PR #966 = 28 ships). Keep the `dsd dis`-panic
workaround, append carve blocks + run `tools/sort_delinks.py`, lint the brief,
gate on 3-region `ninja sha1`. Target ~28.

## Headline — 28 upper-half .s shipped, 3-region ninja sha1 green

**28 byte-exact upper-half ov002 `.s` shipped.** Kept the **60-probe pool**
(4×15) since the cheap small-end is nearly drained. Result: **38 clean (63%)**,
took 28 (held 10). Ships are in the **0x80–0x8c** band. Baseline used `ninja
sha1` (bare `ninja` aux-target failure persists; the ROM is byte-identical, so
main is healthy).

## dsd dis still panics — same workaround

`dsd dis` still aborts (`index out of bounds: the len is 640 but the index is
640` at `cli/src/cmd/dis.rs:267`) and emits **0 gap files**. Enumerate uncarved
as `symbols.txt` minus the `delinks.txt` carved set; probe with `asm_escape` (gap
`.o` from `dsd delink`, still working — 2033 present); post-filter the emitted
`.s` via `build/probe_filter.py`. **Still flagged for the brain.**

## The 28 ships (all ov002, upper half ≥ 0x02234000, 0x80–0x8c)

`0224e9cc` `0224eab4` `0224f824` `02250350` `022505e8` `02250d14` `022515b0`
`02251bb0` `02252af8` `02252b80` `02252ca4` `02253304` `02255148` `02257750`
`022633a0` `022636cc` `0226d95c` `0227dce4` `0227dd6c` `0227e88c` `0228887c`
`02295568` `022955f0` `02295748` `02295824` `022961bc` `0229d01c` `0229db44`

All `asm_escape` to `✅ byte-identical vs the delinked .o`. Link-clean — every
`.extern data_` reference is `kind:bss`, no byte-pack, no arg-pack. No
double-carve (each pick asserted absent from `delinks.txt`). Wired with
`sort_delinks.py` (1 inversion to 0, **lossless**: 602 to 630 `.s` entries = +28,
address-sorted).

## Drop breakdown (60 probed)

| outcome | n | note |
|---|---:|---|
| **SHIP** | 38 | took 28; 10 held for the next wave |
| byte-pack | 10 | `(u8)`-cast clean-C drainable |
| verify-fail | 9 | `to_mwasm` translation gap — rising with body size |
| `kind:data` | 3 | non-linkable data reloc — correctly dropped |

The clean rate dipped to **63%** (70% last wave): the `0x80+` funcs are larger
and trip the `to_mwasm` gap more (9 verify-fails). The 60-probe pool still gave a
comfortable 38-from-60. If the rate keeps falling toward ~50%, the next wave
should widen further (e.g. 4×18 = 72) or weigh a fresh module.

## Markdown lint — `build/mdcheck.py`

Brief linted clean with `build/mdcheck.py` (mirrors the repo's
`.markdownlint.jsonc` enabled rules; agrees with `pymarkdownlnt` and CI). No line
starts with a `#NNN` PR ref.

## Thinning watch — overall NOT thinning; small-end essentially gone

Uncarved **upper-half** funcs by size band: `≤0x60` = 33 (drained), `0x61–0x80`
= 26 (essentially drained), `0x81–0xc0` = 285, `>0xc0` = 671 → **1015 total**.
The cadence is now entirely `0x81–0xc0` (byte-pack-denser, more `to_mwasm`
misses). **No overall thinning** — 956 funcs ≥0x81 remain, all reachable; the
watch item stays the yield, mitigated by the wider pool.

## Gate — 3-region ninja sha1

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Files

`src/overlay002/` +28 `.s`; `arm9/overlays/ov002/delinks.txt` +28 (sort-normalised).
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: **256** (main 17,
ov002 239).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
