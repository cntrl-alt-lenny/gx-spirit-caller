[//]: # (markdownlint-disable MD013 MD041)

# Brief 313 — ov011 clean-C wave 3 (hard-tail drain)

**Brief:** 313 (decomper). Continue the ov011 clean-C drain (waves 1/2 = briefs
308/311, 19 + 18 `.c`). Recipe: `m2c_feed` → `#include "ov011_core.h"` + guards →
coerce → 3-region `ninja sha1`. Pull latest ov011 delinks + subtract the matched
set first. Family-first. Target ~12-18 picks.

## Headline

**12 shipped (all `.c`), 3-region `ninja sha1` = OK** (EUR byte-identical with
all 12 carved; USA/JPN intact — region-divergent addresses, brain wires on
merge). This wave drained the **hard tail**: the easy `<0x60` cohort was fully
taken in waves 1-2, so every wave-3 pick is `0x6c-0xb0` and the dominant
deliverable is **cracking the cell-config sink families** (`func_0201e964 /
0201eaa0 / 0201ef90`) plus the finding that the rest of the tail is
register-numbering / scheduling / layout walled (GLOBAL_ASM/permuter territory,
mirroring brief-305's ov002 conclusion).

Attempt rate: 12 shipped / ~26 attempted ≈ 46% (vs 58% in wave 2, 86% in wave 1
— the curve is exactly the thinning predicted in brief 311).

## The 12 picks

| # | func | size | family / shape |
|---|---|---|---|
| 1 | `021cd65c` | 0x74 | view-mode-1 settle (`2d6c`/`2ca8`/`2da0`, 3900 table) |
| 2 | `021d1230` | 0x6c | slot enable-bit RMW + `021d11c8` settle |
| 3 | `021cb500` | 0x74 | fade + sound 0x4B3/0x4B1, cached 403c base |
| 4 | `021d0c38` | 0x74 | find-free-slot loop + `021d0bb0` init + counter |
| 5 | `021cc8bc` | 0x8c | **cell-config** (`0201e964`, 12-arg + 2-int local) |
| 6 | `021cc424` | 0xa4 | cell-config sib (`e964`, incoming stack args + tail) **[sib]** |
| 7 | `021cc5c4` | 0xa0 | cell-config sib (`e964`, ov000 75cc table) **[sib]** |
| 8 | `021cbb64` | 0xa4 | **cell-config** (`0201eaa0`, 0x4000/96) |
| 9 | `021cd048` | 0x94 | **cell-config** (`0201ef90`, address-of-field args) |
| 10 | `021ca324` | 0xb0 | task-recreate: guard + 2-case switch + call seq |
| 11 | `021cad00` | 0xa4 | view-mode-3 place (`021d1110` out-param, `\|\|` double-call) |
| 12 | `021cf228` | 0x90 | 5-slot per-frame update loop (`i==4` case, `&&` guard) |

## New sub-recipes banked (wave 3)

1. **Cell-config sink reconstruction (the headline lever).** `func_0201e964 /
   0201eaa0 / 0201ef90` are stack-arg-heavy cell-config sinks with **no prior C
   calling convention** (only used in `.s` before). Reconstruct from the frame:
   4 register args (r0-r3) + N stack args at `sp[0], sp[4], …` (= args 5+), with
   any function locals allocated **above** the outgoing-arg area. `e964`'s arg2 =
   `h->unk2C`; `eaa0`'s arg2 = `h` directly. A small local config struct is
   passed by `&`. mwcc emits `stmib` for the consecutive arg stores — **matches
   for the 6-param variants** (`021cc8bc/424/5c4/bb64`).
2. **`for(;;)` + explicit `break` to defeat loop rotation.** A `while(cond){…}`
   got peeled/rotated by mwcc (first test hoisted, duplicated at the bottom);
   `for(;;){ if(!cond) break; … }` kept the orig's single top-test (`021d0c38`).
3. **Uninitialized-var switch default.** A `switch` over `{0,1}` with **no
   default** leaves the temp uninitialized — the orig uses whatever's in the
   register on the default path (`021ca324`). Don't add a default.
4. (carried, reconfirmed) **Cached-base for callee-saved retention across
   calls/loops** (`021cb500` 403c across calls; `021d0c38` 4660 across the loop +
   init call); **declaration-order register flip** (`021cf228` `i` before `e` →
   r7/r8); **guard-flip for block layout** (`021cad00`: write `if (hot) { …;
   return; } cold();` so the cold path lands last, matching the orig `bne`-to-end).

## Walls surfaced (deferred — GLOBAL_ASM / permuter tail)

- **Load-/mul-destination register-numbering** (clean 2-register swaps,
  unsteerable from C): `021d0bb0` (the `v` temp r0↔r1), `021d1080`/`021d1110`
  (the `arg0*40` mul destination in the else branch).
- **`stmib`-grouping scheduling** (the 8-param `eaa0` variants `021cc194`,
  `021cc27c`, `021cd0dc`): orig groups `{p8,a3,a2}` into a 3-register `stmib`;
  the extra `p7 & 0xFFFF` arg computation makes mwcc split the 3rd store out.
  Precomputing it into a local forces a callee-saved register (strictly worse).
- **Table-walk addressing** (`021cd190`/`021cd1fc`/`021cd268`): a row-struct at
  `32d8`/`334a` (stride 114) where mwcc picks a non-obvious base + negative
  offsets and re-loads the count; the natural C produces different addressing.
- **Predication vs branch** (`021ceebc`): mwcc branches a dual-assignment if/else
  that the orig rendered with predicated `ldreq/lsleq/lslne/ldrne`.
- **Dense jump-table layout** (`021d1f04`): the brief-305 switch-case-body wall.
- **Constant-fold of `idx-N`** (`021cd574`): orig keeps `mov r0,#7; sub r1,r0,#8`
  (= −1); mwcc folds the literal to `mvn`.
- **Duplicated/convoluted logic** (`021d2008`): twin task blocks + a mask that
  folds to a no-op — not faithfully reconstructable.
- **Overlay-swap call targets** (`021ca0ac`): two `bl`s hit unnamed ov0/ov6
  shared-base addresses (no symbol) — not expressible in C.
- (carried) **nibble-reposition fusion** (`021cef38`).

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | **OK** (byte-identical, all 12 carved) |
| USA / JPN `ninja sha1` | OK (intact; EUR-only ship — addresses region-divergent) |
| per-pick | dcheck (GNU-objdump-normalised) vs `m2c_feed`; branchy gated by EUR sha1 |
| `tools/check_match_invariants.py` | 0 errors (4951 warns, pre-existing) |
| `ruff check .` | clean |
| `tests/` (full suite) | passed |

EUR-only config change (`config/eur/.../ov011/delinks.txt` +12 `complete`
blocks). No tool change, no USA/JPN config change, no symbol renames.
`src/overlay011/` gains 12 `.c`.

## Recommendation for the brain

1. **ov011 clean-C has reached the ov002/brief-305 inflection.** The reachable
   `<0x100` cohort is now the hard tail (`0x6c-0xfc`), dominated by
   register-numbering, `stmib`-scheduling, table-walk, and layout walls. Yield is
   ~46% and the remaining functions are larger and harder.
2. **The cell-config sink families are the last clean-C vein.** `e964`/`eaa0`/
   `ef90` callers are formulaic once the arg convention is known (this wave banked
   it) — a handful more likely exist in the `0x100-0x200` tier. The 8-param
   `eaa0` variants are `stmib`-walled (3 of them surfaced here).
3. **Pivot recommendation.** For the walled tail, the GLOBAL_ASM / register-rename
   `.s` path or a permuter pass is now the only mechanism (same call brief 305
   made for ov002). Alternatively pivot the decomper to a fresh overlay
   (ov008/ov010/ov016 from the wave-1 survey) for clean-C velocity.

## Cross-references

- `docs/research/brief-311-ov011-clean-c-wave2.md` — wave 2 (18 picks; the
  cached-base / decl-order / guard-flip recipes this wave reuses).
- `docs/research/brief-305-coldre-wave16-dispatcher-tier.md` — the ov002 clean-C
  inflection this wave reaches for ov011.
- `src/overlay011/ov011_core.h` — §VERIFIED updated with the wave-3 cell-config
  families + walls.
