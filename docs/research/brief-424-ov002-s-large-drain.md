[//]: # (markdownlint-disable MD013 MD041)

# Brief 424 — ov002 reg-alloc → `.s`, large drain wave (Windows lane)

**Brief:** 424 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog at the scaled cadence (#954 = 28 ships). Keep using the `dsd dis`-panic
workaround, append carve blocks + run `tools/sort_delinks.py` before committing,
gate on 3-region `ninja sha1`. Target ~28.

## Headline — 28 upper-half `.s` shipped, 3-region `ninja sha1` green

**28 byte-exact upper-half ov002 `.s` shipped.** Probed 48 candidates across 4
parallel batches → **42 clean (87.5%)**, took 28 (held 14 for the next wave).
This wave is the **0x64–0x70** band (the smallest uncarved upper-half funcs:
8×0x64, 7×0x68, 6×0x6c, 7×0x70). Same `dsd dis`-panic workaround as #954.

## `dsd dis` still panics — same symbols-vs-delinks workaround

`dsd dis` still aborts with `index out of bounds: the len is 640 but the index
is 640` at `cli/src/cmd/dis.rs:267` (main func `0x02099928`'s pre-code constant
pool, post-brief-419 main endgame) and emits **0 gap files**. Worked around as in
PR #954 — no `dis` needed:

1. **Enumerate** uncarved = `symbols.txt` funcs **minus** the `delinks.txt`
   carved set (sizes from `symbols.txt`); the delinked gap `.o` from
   `dsd delink` (which still works) feed `asm_escape`.
2. **Probe** with `asm_escape --whole-function` + **post-filter the emitted `.s`**
   (byte-pack / arg-pack / `kind:data`) via `build/probe_filter.py`.

**Still flagged for the brain** — the panic blocks the decomper's gap-`.s`
enumeration too; worth a `dsd` patch.

## ⚠️ Process note — CRLF-poisoned candidate list (re-confirmed gotcha)

The first probe round returned **48/48 spurious `verify-fail`**: the Python
enumerator wrote the candidate file in text mode → **CRLF**, so each address
reached `asm_escape` as `func_ov002_<addr>\r` → "not found in delinks" for every
func (the same `\r` gotcha logged for the decomper's lower-half lane). Fix:
`tr -d '\r'` the candidate list, and **hardened `build/probe_filter.py` to
`.strip()` each arg** so it can't recur. Re-probe was 42/48 clean.

## The 28 ships (all ov002, upper half ≥ 0x02234000, 0x64–0x70)

`0224d4ac` `0224ee48` `0224f8ac` `022538bc` `02264ce4` `022650c0` `022678f8`
`0226ac94` `0226ada4` `0226c584` `022716a8` `0227d5f8` `0227e784` `0227edc4`
`022806a4` `02285d68` `02286df0` `02286fb8` `022880ec` `02288158` `0228824c`
`022883c4` `022885ec` `0228d9ec` `0228da54` `0229049c` `02292578` `02292a90`

All `asm_escape` → `✅ byte-identical vs the delinked .o`. Link-clean — every
`.extern data_` reference is `kind:bss` (the mandatory post-filter), no byte-pack,
no arg-pack. Wired with `sort_delinks.py` (1 inversion → 0, **lossless**: 490 →
518 `.s` entries = +28, address-sorted).

## Drop breakdown (48 probed)

| outcome | n | note |
|---|---:|---|
| **SHIP** | 42 | took 28; 14 held for the next wave |
| byte-pack | 3 | `(u8)`-cast clean-C drainable — left for that lane |
| verify-fail | 2 | rare `to_mwasm` translation gap |
| `kind:data` | 1 | non-linkable data reloc — correctly dropped |

## Thinning watch — years of runway, NOT thinning

Uncarved **upper-half** funcs by size band: `≤0x60` = 33 (drained), `0x61–0x80`
= 114, `0x81–0xc0` = 309, `>0xc0` = 671 → **1127 total**. This wave drew the
bottom of 0x61–0x80; that band alone is ~3 more waves, and 0x81+ is 980 funcs the
store-merge fix reaches. **No thinning** — the cue to pick the next EUR module is
far off.

## Gate — 3-region `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Files

`src/overlay002/` +28 `.s`; `arm9/overlays/ov002/delinks.txt` +28 (sort-normalised).
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: **144** (main 17,
ov002 127).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
