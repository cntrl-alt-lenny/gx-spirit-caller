[//]: # (markdownlint-disable MD013 MD041)

# Brief 430 — ov002 reg-alloc to .s, large drain wave (Windows lane)

**Brief:** 430 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog at the scaled cadence (PR #963 = 28 ships). Keep the `dsd dis`-panic
workaround, append carve blocks + run `tools/sort_delinks.py`, lint the brief,
gate on 3-region `ninja sha1`. Target ~28.

## Headline — 28 upper-half .s shipped, 3-region ninja sha1 green

**28 byte-exact upper-half ov002 `.s` shipped.** Because the clean rate has been
sliding (87.5 → 75 → 69%), this wave **widened the probe pool to 60** (4×15) to
keep a comfortable buffer over 28. Result: **42 clean (70%)**, took 28 (held 14).
Ships are in the **0x80–0x88** sub-band (the 28 lowest-address clean picks).

## ⚠️ Bare `ninja` now fails on an aux target — use `ninja sha1`/`rom`

On this fresh `origin/main`, a plain `ninja` (which I'd used for the baseline)
stopped with `subcommand failed` on a non-ov002, non-main auxiliary target (after
the objdiff report step). **`ninja sha1` is green** (`gx-spirit-caller_eur.nds:
OK`), so **`main` is healthy** and the ROM builds byte-identical — the failure is
a side target bare `ninja` builds that the ROM gate doesn't need (my own memory
note already says "use `ninja sha1`/`rom`, not bare `ninja`"). The ov002 gap `.o`
are produced by `dsd delink` regardless and `asm_escape` verifies against them
fine (2024 gap `.o` present). **Switched the baseline to `ninja sha1`.** Minor
flag for the brain: bare `ninja` tripping on Windows now too.

## dsd dis still panics — same workaround

`dsd dis` still aborts (`index out of bounds: the len is 640 but the index is
640` at `cli/src/cmd/dis.rs:267`) and emits **0 gap files**. Enumerate uncarved
as `symbols.txt` minus the `delinks.txt` carved set; probe with `asm_escape`;
post-filter the emitted `.s` via `build/probe_filter.py`. **Still flagged.**

## The 28 ships (all ov002, upper half ≥ 0x02234000, 0x80–0x88)

`0224c034` `0224c160` `0224c980` `0224cc90` `0224cd18` `0224cf14` `0224d2ec`
`0224d424` `0224d794` `0224d8b4` `0224e230` `0224e490` `0224e660` `0224f7a0`
`022517c0` `02252734` `02252914` `02256084` `022575c8` `0225984c` `02263648`
`0226e9fc` `02280714` `02286e54` `02287474` `0229205c` `02292d20` `0229502c`

All `asm_escape` to `✅ byte-identical vs the delinked .o`. Link-clean — every
`.extern data_` reference is `kind:bss`, no byte-pack, no arg-pack. No
double-carve (each pick asserted absent from `delinks.txt`). Wired with
`sort_delinks.py` (1 inversion to 0, **lossless**: 574 to 602 `.s` entries = +28,
address-sorted).

## Drop breakdown (60 probed)

| outcome | n | note |
|---|---:|---|
| **SHIP** | 42 | took 28; 14 held for the next wave |
| byte-pack | 10 | `(u8)`-cast clean-C drainable |
| verify-fail | 6 | `to_mwasm` translation gap |
| `kind:data` | 2 | non-linkable data reloc — correctly dropped |

70% clean over 60 probes — the slide has flattened (69 → 70%). Widening the pool
to 60 kept the buffer healthy (42 clean ≫ 28). The `probe_filter.py` CRLF-hardening
held (0 spurious verify-fail).

## Markdown lint — `build/mdcheck.py`

The brief was linted with `build/mdcheck.py` (mirrors the repo's
`.markdownlint.jsonc` enabled rules; agrees with `pymarkdownlnt` and CI). Clean.
No line starts with a `#NNN` PR ref (the MD018 nit); PR refs are kept mid-line.

## Thinning watch — overall NOT thinning; small-end nearly drained

Uncarved **upper-half** funcs by size band: `≤0x60` = 33 (drained), `0x61–0x80`
= 30 (nearly drained — was 58, 86, 114), `0x81–0xc0` = 309, `>0xc0` = 671 →
**1043 total**. The cheap small-end is ~1 wave from gone; the cadence is now
essentially all `0x81–0xc0`. **No overall thinning** — 980 funcs ≥0x81 remain,
all reachable. The 70% clean rate over a 60-probe pool is sustainable; the watch
item stays the yield, not the supply.

## Gate — 3-region ninja sha1

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Files

`src/overlay002/` +28 `.s`; `arm9/overlays/ov002/delinks.txt` +28 (sort-normalised).
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: **228** (main 17,
ov002 211).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
