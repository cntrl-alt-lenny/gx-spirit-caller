[//]: # (markdownlint-disable MD013 MD041)

# Brief 426 — ov002 reg-alloc → `.s`, large drain wave (Windows lane)

**Brief:** 426 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog at the scaled cadence (#957 = 28 ships). Keep the `dsd dis`-panic
workaround, append carve blocks + run `tools/sort_delinks.py` before committing,
gate on 3-region `ninja sha1`. Target ~28.

## Headline — 28 upper-half `.s` shipped, 3-region `ninja sha1` green

**28 byte-exact upper-half ov002 `.s` shipped.** Probed 48 candidates across 4
parallel batches → **36 clean (75%)**, took 28 (held 8). This wave is the
**0x64–0x78** band — the `0x61–0x80` small-end is thinning (86 left), so the pool
was extended to `≤0xc0`; the resulting band has a denser byte-pack rate (see
drops). Same `dsd dis`-panic + symbols-vs-delinks workaround as #954/#957.

## `dsd dis` still panics — same workaround

`dsd dis` still aborts (`index out of bounds: the len is 640 but the index is
640` at `cli/src/cmd/dis.rs:267`, main func `0x02099928`'s pre-code pool) and
emits **0 gap files**. Enumerate uncarved = `symbols.txt` minus `delinks.txt`
carved set; probe with `asm_escape` (gap `.o` from `dsd delink`, still working);
post-filter the emitted `.s` (`build/probe_filter.py`). **Still flagged for the
brain** — blocks the decomper's gap-`.s` enumeration too.

## The 28 ships (all ov002, upper half ≥ 0x02234000, 0x64–0x78)

`02251d00` `02253928` `02253af8` `02256a50` `02257a44` `02262738` `02264da0`
`022662e4` `02266358` `0226ead0` `02281920` `02281a74` `02281ae8` `02286a20`
`02288350` `02293a5c` `02294558` `022949f4` `022952dc` `02295350` `02295b50`
`02295d14` `02296134` `022963c4` `02296ac0` `02296d14` `02296e48` `0229cde8`

All `asm_escape` → `✅ byte-identical vs the delinked .o`. Link-clean — every
`.extern data_` reference is `kind:bss`, no byte-pack, no arg-pack. No
double-carve (asserted each pick is absent from `delinks.txt`). Wired with
`sort_delinks.py` (1 inversion → 0, **lossless**: 518 → 546 `.s` entries = +28,
address-sorted).

## Drop breakdown (48 probed)

| outcome | n | note |
|---|---:|---|
| **SHIP** | 36 | took 28; 8 held for the next wave |
| byte-pack | 8 | `(u8)`-cast clean-C drainable — denser in the larger 0x80–0xc0 funcs |
| verify-fail | 3 | rare `to_mwasm` translation gap |
| `kind:data` | 1 | non-linkable data reloc — correctly dropped |

The 75% clean rate (vs 87.5% last wave) is the expected cost of reaching past
0x80: bigger funcs touch more packed fields, so the byte-pack share rises. Still
a comfortable 36-from-48.

## Thinning watch — overall NOT thinning; small-end softening

Uncarved **upper-half** funcs by size band: `≤0x60` = 33 (drained), `0x61–0x80`
= 86 (softening — down from 114), `0x81–0xc0` = 309, `>0xc0` = 671 → **1099
total**. The small-end (`0x61–0x80`) is now ~3 waves from drained, so waves from
here on will draw increasingly from `0x81–0xc0` (309 funcs, byte-pack-denser but
plenty). **No overall thinning** — 980 funcs ≥0x81 remain, all reachable. Will
re-flag if the clean-rate or the ≥0x81 pool actually drops.

## Gate — 3-region `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Files

`src/overlay002/` +28 `.s`; `arm9/overlays/ov002/delinks.txt` +28 (sort-normalised).
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: **172** (main 17,
ov002 155).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
