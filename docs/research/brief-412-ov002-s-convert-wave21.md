[//]: # (markdownlint-disable MD013 MD041)

# Brief 412 — ov002 `.s` wave 21: 20 ships (12 lower-pool + 8 upper-half)

**Brief:** 412 (scaffolder). ov002 reg-alloc → `.s` wave 21. Sweep both
upper-half ≤0x6c and lower-pool bands; target ~8–12 ships; EUR `ninja sha1`
per-pick; delinks sorted + carve-overlap-clean per batch. Brain runs 3-region
on merge.

## Headline — 20 ships, 0 drops, lower pool exhausted for this band

20 whole-function `.s` ships — 12 from the lower pool (0x021b…/0x021a…
addresses) and 8 from the upper half (0x0220…/0x0221…/0x0222…/0x0223…).
All 20 byte-identical on the first attempt; EUR `ninja sha1` OK after every
batch. 0 kind:data REFUSEs.

| pick | func | size | band | data-ref class |
|------|------|------|------|----------------|
| 1 | `func_ov002_021bc6e8` | 0x44 | lower | B-gap (`022bdfc4`) |
| 2 | `func_ov002_021b97d4` | 0x5c | lower | none |
| 3 | `func_ov002_021bc1d0` | 0x5c | lower | none |
| 4 | `func_ov002_021bc22c` | 0x5c | lower | none |
| 5 | `func_ov002_021bd308` | 0x5c | lower | none |
| 6 | `func_ov002_021ba230` | 0x64 | lower | none |
| 7 | `func_ov002_021bb950` | 0x64 | lower | none |
| 8 | `func_ov002_021bc16c` | 0x64 | lower | none |
| 9 | `func_ov002_021bb264` | 0x68 | lower | none |
| 10 | `func_ov002_021bbf98` | 0x68 | lower | none |
| 11 | `func_ov002_021bd198` | 0x68 | lower | none |
| 12 | `func_ov002_021bd030` | 0x6c | lower | B-gap (`022bdfd8`) |
| 13 | `func_ov002_022038d8` | 0x58 | upper | none |
| 14 | `func_ov002_02204a10` | 0x58 | upper | none |
| 15 | `func_ov002_02205d70` | 0x58 | upper | none |
| 16 | `func_ov002_0220a184` | 0x58 | upper | none |
| 17 | `func_ov002_0220bdbc` | 0x58 | upper | none |
| 18 | `func_ov002_0220dcdc` | 0x58 | upper | none |
| 19 | `func_ov002_022175e0` | 0x58 | upper | none |
| 20 | `func_ov002_02230260` | 0x58 | upper | none |

## Enumeration fix

Prior waves enumerated uncarved funcs by searching for `func_ov002_XXXXXXXX`
in delinks.txt. Wave 21 discovered this under-counts: some early carves used
the old path convention `src/overlay002/ov002_XXXXXXXX.c` (no `func_` prefix).
The correct approach is to check by **address range** — parse all `.text
start:…end:…` intervals from delinks.txt and reject any function whose start
address falls within a carved interval. This reduced the apparent candidate pool
from 190 → 127 (the 63 difference were already carved in `.c` files).

## Pool state after wave 21

- **Lower pool (021a…–021b… band ≤0x6c):** **exhausted** — all 12 remaining
  candidates shipped. Next lower-pool wave requires stepping above 0x6c.
- **Upper half (022+, ≤0x6c):** ~107 uncarved remaining (~13 waves runway at
  8/wave). Wave swept the 0x44–0x58 tier; 0x5c–0x6c tier untouched.
- **Total scaffolder `.s`:** ≈ 196 (prior ≈ 176 + 20 this wave).
- **kind:data drop rate:** 2/20 candidates had kind:data refs — both B-gap
  (linkable); **0 REFUSEs; 0 new parks**.

## Verification

| gate | result |
|------|--------|
| `asm_escape --whole-function` | 20/20 byte-identical (first attempt) |
| EUR `ninja sha1` (per-batch + final) | **OK** |
| overlap audit | 0 overlaps across 1284 `.text` intervals (1264 → 1284 = +20) |
| kind:data preflight | 18× no data ref; 2× B-gap (auto-pass); 0 REFUSE |

🤖 Generated with [Claude Code](https://claude.com/claude-code)
