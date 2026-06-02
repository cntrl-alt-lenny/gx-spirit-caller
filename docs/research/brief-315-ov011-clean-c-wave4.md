[//]: # (markdownlint-disable MD013 MD041)

# Brief 315 — ov011 clean-C wave 4 (drain remnants + THINNING FLAG)

**Brief:** 315 (decomper). Continue the ov011 clean-C drain (waves 1-3 = briefs
308/311/313, 49 `.c`). Recipe: `m2c_feed` → `#include "ov011_core.h"` + guards →
coerce → 3-region `ninja sha1`. **If ov011's reachable is thinning, flag it
(next overlay for wave 5).**

## Headline — ov011 clean-C is TAPPED (pivot recommended)

**2 shipped, 3-region `ninja sha1` = OK.** The reachable `<0x100` cohort has
collapsed to **6 candidates** (was 38 in wave 3, 78 in wave 2) — and 4 of those
are register-/scheduling-/pooling-walled. This wave matched the 2 tractable ones
and confirmed the rest are walls. The 0x100-0x200 tier (13 functions) is
entirely large composites (loops, jump tables, fixed-point, state machines) — no
clean-C-shippable shapes. **ov011 clean-C is done; wave 5 should pivot to a
fresh overlay (survey below).**

## The 2 picks

| # | func | size | shape |
|---|---|---|---|
| 1 | `021ccad8` | 0x94 | view-mode-3 coord-change detector (`021d1080` out-param, `\|\|` compare, `021ccf3c` + RMW, ret 0/1) |
| 2 | `021caafc` | 0xc0 | coord classification readback (`021ca400`, 2 out-params, dual 305f/3178 byte table) |

Both are branchy `<0x100` composites — they matched with careful phrasing (the
guard-flip + `||` + read-twice patterns from waves 2-3), confirming the walls are
*specific* (reg-numbering / scheduling / pooling), not "all branchy functions".

## `<0x100` cohort final state (6 candidates)

| func | size | result |
|---|---|---|
| `021ccad8` | 0x94 | **shipped** |
| `021caafc` | 0xc0 | **shipped** |
| `021cc814` | 0xa8 | **1-register wall** — byte-identical except the case-0 nibble load lands r2 vs orig r0 (load-dest reg-numbering). Banked: the `asr#11; add lsr#20; asr#12` idiom is mwcc's **signed `/4096`**. |
| `021cd2d4` | 0x88 | wall — 3374/3376 multi-table reg/scheduling (same as wave-2 `021d18b4`) |
| `021cfa50` | 0xc0 | wall — field-address pooling, pervasive across the multi-RMW teardown (cached-base doesn't recover) |
| `021cca04` | 0xd4 | wall — mwcc folds `floor<<12` to immediate + branches the mode ternary + r7/r8 alloc (three coupled) |

## 0x100-0x200 tier (13, all walls/composites — none shippable)

All are 0x110-0x1d4, 65-116 instructions: dense jump tables (`021d1d30`,
`021d1f04`), big state machines with the nibble-reposition fusion inside
(`021d0938`), value-maps (`021d1b70`), validators with deep block layout
(`021ce3a4`, `021ce190`), accumulation loops (`021d2de4`, `021d12c0`,
`021d0cac`), and the fixed-point cell-renderer (`021cc664`). These are
GLOBAL_ASM/permuter territory.

## Next-overlay survey (for wave-5 pivot)

Un-carved function counts from the `_dsd_gap@ovN` objects (EUR), excluding ov002
(parked GLOBAL_ASM), ov006 (scaffolder's co-drain), and ov011 (this — its 50
`<0x100` are ~44 walls + the 6 above):

| overlay | defined | `<0x100` | `<0x40` | note |
|---|---:|---:|---:|---|
| **ov004** | 265 | **168** | **39** | **richest untapped vein by far** (but see the brain's #818 dsd-check-symbols diagnosis) |
| ov000 | 88 | 65 | 17 | strong, trivial-heavy |
| ov008 | 80 | 49 | 4 | wave-1 runner-up |
| ov010 | 67 | 38 | 2 | |
| ov016 | 63 | 35 | 4 | |
| ov015 / ov020 | 48 / 47 | 33 / 33 | 4 / 4 | |

**Recommendation: pivot wave 5 to ov004** (168 `<0x100`, 39 `<0x40` — 2× the next
vein, and the `<0x40` trivial count is the standout). If ov004's dsd issues block
it, **ov000** (65 `<0x100`, 17 `<0x40`) or **ov008** (the wave-1 runner-up) are
clean alternates.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | **OK** (byte-identical, both carved) |
| USA / JPN `ninja sha1` | OK (intact; EUR-only ship) |
| `check_match_invariants.py` | 0 errors (4968 warns, pre-existing) |
| `ruff check .` | clean |
| `tests/` | passed |

EUR-only config change (`config/eur/.../ov011/delinks.txt` +2 `complete` blocks).
No tool/USA/JPN/symbol change. `src/overlay011/` gains 2 `.c`.

## Recommendation for the brain

1. **ov011 clean-C is tapped — do not queue wave 5 on ov011.** Across waves 1-4
   it gave 51 byte-identical `.c`; the reachable `<0x100` is now 6 (4 walled, 2
   shipped this wave) and the 0x100-0x200 tier is all large composites.
2. **Pivot wave 5 to ov004** (richest untapped vein), with ov000/ov008 as
   alternates. A fresh `ovNNN_core.h` + the cell-config / cached-base / guard-flip
   recipes carry over.
3. **ov011's walled tail** (the ~44 `<0x100` walls + the 13 composites) is a
   GLOBAL_ASM / permuter job, same as the ov002 tail.

## Cross-references

- `docs/research/brief-313-ov011-clean-c-wave3.md` — wave 3 (12 picks; the
  inflection this wave confirms).
- `src/overlay011/ov011_core.h` — §VERIFIED updated with the wave-4 picks +
  the signed-`/4096` idiom + the tapped flag.
