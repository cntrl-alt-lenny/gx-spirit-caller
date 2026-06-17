[//]: # (markdownlint-disable MD013 MD041)

# Brief 436 — ov002 reg-alloc to .s, large drain wave (Windows lane)

**Brief:** 436 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog at the scaled cadence (PR #970 = 28 ships). Keep the `dsd dis`-panic
workaround, append carve blocks + run `tools/sort_delinks.py`, lint the brief,
gate on 3-region `ninja sha1`. Target ~28.

## Headline — 28 shipped; a known-drops skip list lifted yield 61% to 75%

**28 byte-exact upper-half ov002 `.s` shipped.** This wave added a persistent
**known-drops skip list** (`build/known_drops_ov002.txt`) seeded from brief 434's
results — the deterministic byte-pack / `kind:data` drops never ship as `.s`, so
re-probing them every wave was pure waste. Excluding them lifted the clean rate
from **61% → 75%** (45 clean from 60 probes, only 2 byte-pack + 0 `kind:data`).
Took 28 (held 17). Ships are in the **0x80–0x9c** band.

## The known-drops skip list (new)

`build/known_drops_ov002.txt` (gitignored) holds addresses that dropped as
**byte-pack / arg-pack / `kind:data`** — permanent non-`.s` outcomes (byte-pack is
a clean-C target; `kind:data` is unlinkable). The enumeration now excludes both
the carved set *and* this list, so the probe pool front-loads likely ships. A
second file `build/known_verifyfail_ov002.txt` tracks `verify-fail` addresses
separately (soft-skip — these could flip if `to_mwasm` improves, so they are
kept out of the permanent list and can be re-probed later). Both will be excluded
from the next wave's enumeration.

- Seeded from brief 434: 19 permanent drops.
- Grew this wave: permanent **21** (+2), verify-fail-soft **13** (+13).

## dsd dis still panics — same workaround

`dsd dis` still aborts (`index out of bounds: the len is 640 but the index is
640` at `cli/src/cmd/dis.rs:267`) and emits **0 gap files**. Enumerate uncarved
as `symbols.txt` minus the `delinks.txt` carved set (now also minus the
skip list); probe with `asm_escape` (gap `.o` from `dsd delink`, 2045 present);
post-filter the emitted `.s`. **Still flagged for the brain.**

## The 28 ships (all ov002, upper half ≥ 0x02234000, 0x80–0x9c)

`02237e00` `02238cb4` `02244a74` `02248a1c` `02249918` `02249a54` `02249af0`
`0224a580` `0224b01c` `0224b1e0` `0224bd3c` `0224c4e8` `0224d5c8` `0224d818`
`0224dafc` `02250670` `022521ac` `02257cfc` `022591e4` `02265130` `0226e918`
`02281760` `0228bbf8` `0228c924` `02296690` `02296c00` `02296ebc` `0229f160`

All `asm_escape` to `✅ byte-identical vs the delinked .o`. Link-clean — every
`.extern data_` reference is `kind:bss`, no byte-pack, no arg-pack. No
double-carve (each pick asserted absent from `delinks.txt`). Wired with
`sort_delinks.py` (1 inversion to 0, **lossless**: 658 to 686 `.s` entries = +28,
address-sorted).

## Drop breakdown (60 probed, skip-filtered)

| outcome | n | note |
|---|---:|---|
| **SHIP** | 45 | took 28; 17 held for the next wave |
| verify-fail | 13 | `to_mwasm` translation gap — now the dominant drop |
| byte-pack | 2 | newly-seen byte-pack (added to the skip list) |
| `kind:data` | 0 | (the skip list pre-removed the known ones) |

With byte-pack / `kind:data` pre-filtered, **verify-fail is now the only
recurring drop** (13/60). Adding those to the soft-skip list should push the next
wave's effective yield higher still.

## Markdown lint — `build/mdcheck.py`

Brief linted clean with `build/mdcheck.py`. Pre-push: `origin/main` had not moved
since branch, so no tools-index drift.

## Thinning watch — overall NOT thinning; small-end drained

Uncarved **upper-half** funcs by size band: `≤0x60` = 33 (drained), `0x61–0x80`
= 21 (drained), `0x81–0xc0` = 234, `>0xc0` = 671 → **959 total** (903 after the
skip list). The cadence is entirely `0x81–0xc0`; `>0xc0` (671 funcs) is the next
tier. **No overall thinning** — the watch item is the yield, now mitigated by
both the wider pool and the skip list.

## Gate — 3-region ninja sha1

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Files

`src/overlay002/` +28 `.s`; `arm9/overlays/ov002/delinks.txt` +28 (sort-normalised).
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: **312** (main 17,
ov002 295).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
