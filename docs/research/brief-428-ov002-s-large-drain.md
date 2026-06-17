[//]: # (markdownlint-disable MD013 MD041)

# Brief 428 — ov002 reg-alloc to .s, large drain wave (Windows lane)

**Brief:** 428 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog at the scaled cadence (PR #960 = 28 ships). Keep the `dsd dis`-panic
workaround, append carve blocks + run `tools/sort_delinks.py` before committing,
markdownlint the brief, gate on 3-region `ninja sha1`. Target ~28.

## Headline — 28 upper-half .s shipped, 3-region ninja sha1 green

**28 byte-exact upper-half ov002 `.s` shipped.** Probed 48 candidates across 4
parallel batches into **33 clean (69%)**, took 28 (held 5). This wave is the
**0x68–0x80** band (mostly 0x7c). The lower yield is the continuing cost of
reaching into the larger funcs as the cheap small-end drains — see the drops and
the thinning watch. Same `dsd dis`-panic + symbols-vs-delinks workaround as the
last three waves.

## dsd dis still panics — same workaround

`dsd dis` still aborts (`index out of bounds: the len is 640 but the index is
640` at `cli/src/cmd/dis.rs:267`, main func `0x02099928`'s pre-code pool) and
emits **0 gap files**. Enumerate uncarved as `symbols.txt` minus the
`delinks.txt` carved set; probe with `asm_escape` (gap `.o` from `dsd delink`,
still working); post-filter the emitted `.s` via `build/probe_filter.py`. **Still
flagged for the brain** — it blocks the decomper's gap-`.s` enumeration too.

## The 28 ships (all ov002, upper half ≥ 0x02234000, 0x68–0x80)

`0224da7c` `0224fad8` `02253b6c` `0225792c` `02259914` `02267d14` `0226a488`
`0226df10` `0227da98` `022870cc` `02287144` `02287240` `02287774` `02288714`
`0228b478` `02291798` `02292454` `02292754` `022945c4` `02294e40` `02295990`
`02296428` `022965c0` `0229cfa0` `0229e0bc` `0229f3b4` `022a5984` `022a6fec`

All `asm_escape` to `✅ byte-identical vs the delinked .o`. Link-clean — every
`.extern data_` reference is `kind:bss`, no byte-pack, no arg-pack. No
double-carve (each pick asserted absent from `delinks.txt`). Wired with
`sort_delinks.py` (1 inversion to 0, **lossless**: 546 to 574 `.s` entries = +28,
address-sorted).

## Drop breakdown (48 probed)

| outcome | n | note |
|---|---:|---|
| **SHIP** | 33 | took 28; 5 held for the next wave |
| byte-pack | 9 | `(u8)`-cast clean-C drainable — denser in the larger funcs |
| verify-fail | 5 | `to_mwasm` translation gap — rises a little with body size |
| `kind:data` | 1 | non-linkable data reloc — correctly dropped |

The 69% clean rate (75% last wave, 87.5% the wave before) tracks the expected
slide as the pool reaches past 0x80: bigger funcs carry more packed-field code
and trip the `to_mwasm` gap slightly more often. Still a comfortable 33-from-48.

## Markdown lint — `build/mdcheck.py` (new)

The brain flagged a recurring MD018/MD022 nit in the brief docs (a wrapped
`#NNN` PR ref landing at a line start gets parsed as a heading). With no
`markdownlint-cli2` on this Windows box, I wrote `build/mdcheck.py` — a targeted
checker mirroring the repo's `.markdownlint.jsonc` enabled rules (MD018, MD019,
MD022, MD023, MD025, MD031, MD012, MD047, MD001, MD003). It agrees with
`pymarkdownlnt` and with the three already-merged briefs (all clean), and catches
the `#NNN`-at-line-start case. This brief passes it.

## Thinning watch — overall NOT thinning; small-end softening continues

Uncarved **upper-half** funcs by size band: `≤0x60` = 33 (drained), `0x61–0x80`
= 58 (softening — was 86, was 114), `0x81–0xc0` = 309, `>0xc0` = 671 → **1071
total**. The cheap `0x61–0x80` band is ~2 waves from drained, so the cadence is
now drawing mostly from `0x81–0xc0` (byte-pack-denser, hence the yield slide).
**No overall thinning** — 980 funcs ≥0x81 remain, all reachable by the
store-merge `.s` path. The watch item is the yield slide, not the supply: if the
clean rate drops below ~50% the next wave should weigh probing a wider pool vs a
fresh module.

## Gate — 3-region ninja sha1

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Files

`src/overlay002/` +28 `.s`; `arm9/overlays/ov002/delinks.txt` +28 (sort-normalised).
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: **200** (main 17,
ov002 183).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
