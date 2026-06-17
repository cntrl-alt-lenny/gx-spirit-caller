[//]: # (markdownlint-disable MD013 MD041)

# Brief 434 — ov002 reg-alloc to .s, large drain wave (Windows lane)

**Brief:** 434 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog at the scaled cadence (PR #968 = 28 ships). Keep the `dsd dis`-panic
workaround, append carve blocks + run `tools/sort_delinks.py`, lint the brief,
gate on 3-region `ninja sha1`. Target ~28.

## Headline — 28 upper-half .s shipped, 3-region ninja sha1 green

**28 byte-exact upper-half ov002 `.s` shipped.** With the small-end drained and
the yield sliding, this wave **widened the probe pool to 72** (4×18). Result:
**44 clean (61%)**, took 28 (held 16). Ships are in the **0x8c–0x94** band (mostly
0x90) — the cadence has worked up to the larger funcs. Gated with `configure.py
eur && ninja sha1` (the brief 432 lesson: re-configure after adding `.s` so the
new `.o` get a compile edge).

## dsd dis still panics — same workaround

`dsd dis` still aborts (`index out of bounds: the len is 640 but the index is
640` at `cli/src/cmd/dis.rs:267`) and emits **0 gap files**. Enumerate uncarved
as `symbols.txt` minus the `delinks.txt` carved set; probe with `asm_escape` (gap
`.o` from `dsd delink`, still working — 2041 present); post-filter the emitted
`.s` via `build/probe_filter.py`. **Still flagged for the brain.**

## The 28 ships (all ov002, upper half ≥ 0x02234000, 0x8c–0x94)

`02234bc0` `02235d78` `02236cc4` `02237ca4` `0224db94` `022550b8` `0225585c`
`02256150` `02257ab8` `0226d6f4` `0226d784` `0226daec` `0226de80` `0227da08`
`0228387c` `022862cc` `022872bc` `0228878c` `0228c3d4` `0228d95c` `022921e0`
`02293234` `02293e80` `02294478` `02295438` `02295c3c` `02295fb8` `0229cf10`

All `asm_escape` to `✅ byte-identical vs the delinked .o`. Link-clean — every
`.extern data_` reference is `kind:bss`, no byte-pack, no arg-pack. No
double-carve (each pick asserted absent from `delinks.txt`). Wired with
`sort_delinks.py` (1 inversion to 0, **lossless**: 630 to 658 `.s` entries = +28,
address-sorted).

## Drop breakdown (72 probed)

| outcome | n | note |
|---|---:|---|
| **SHIP** | 44 | took 28; 16 held for the next wave |
| byte-pack | 13 | `(u8)`-cast clean-C drainable |
| verify-fail | 9 | `to_mwasm` translation gap |
| `kind:data` | 6 | non-linkable data reloc — correctly dropped |

The clean rate held at **61%** (63% last wave). Widening to 72 was the right call
— it returned 44 clean, a comfortable buffer over 28. The persistent small-size
drops (`0228acbc`, `022b2fbc` etc. — byte-pack funcs that re-appear each wave) are
re-probed but absorbed by the wider pool.

## Markdown lint — `build/mdcheck.py`

Brief linted clean with `build/mdcheck.py` (mirrors the repo's
`.markdownlint.jsonc` enabled rules; agrees with `pymarkdownlnt` and CI). No line
starts with a `#NNN` PR ref. Pre-push: `origin/main` had not moved since branch,
so no tools-index drift.

## Thinning watch — overall NOT thinning; small-end drained

Uncarved **upper-half** funcs by size band: `≤0x60` = 33 (drained), `0x61–0x80`
= 24 (drained), `0x81–0xc0` = 259, `>0xc0` = 671 → **987 total**. The cadence is
entirely `0x81–0xc0` now (and will move into `>0xc0` eventually). **No overall
thinning** — 930 funcs ≥0x81 remain, all reachable. The watch item stays the
yield (~61%, stable), mitigated by the 72-probe pool.

## Gate — 3-region ninja sha1

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Files

`src/overlay002/` +28 `.s`; `arm9/overlays/ov002/delinks.txt` +28 (sort-normalised).
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: **284** (main 17,
ov002 267).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
