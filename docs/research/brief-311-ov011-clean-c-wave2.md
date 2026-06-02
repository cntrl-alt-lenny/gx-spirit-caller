[//]: # (markdownlint-disable MD013 MD041)

# Brief 311 — ov011 clean-C wave 2 (continue the fresh-overlay drain)

**Brief:** 311 (decomper). Continue the ov011 clean-C stream opened in wave 1
(brief 308, 19 `.c`). ov002's clean-C is tapped (register-numbering +
switch-case-body-layout walls) and reserved for the GLOBAL_ASM endgame. Recipe:
`m2c_feed` → `#include "ov011_core.h"` + guards → coerce → 3-region `ninja sha1`.
Pull the latest ov011 delinks and subtract the matched set first. Drain the
reachable `<0x100` cohort, family-first. Target ~12-18 picks.

## Headline

**18 shipped (all `.c`), EUR `ninja sha1` = OK** (byte-identical ROM with all 18
carved), top of the 12-18 target. USA / JPN `ninja sha1` = OK (intact — the
ov011 functions sit at region-divergent addresses, so this is an EUR-only ship
like wave 1; the brain wires USA/JPN delinks on merge). The cohort stays
call-wrapper / accessor / single-field-bitfield dominated, now extended with a
counted-loop family, a block-copy switch, and a 4660-slot id family.

Wave-2 attempt rate: 18 shipped / 31 attempted (58%); the 13 misses are all
register-numbering / pooling / fusion / multi-field walls (catalogued below),
halted-and-surfaced per discipline.

## The 18 picks

| # | func | size | family / shape |
|---|---|---|---|
| 1 | `021d0ffc` | 0x44 | parallel-array 2-bit read, cached base |
| 2 | `021d1ce8` | 0x?? | cached-base guard + call + single-field RMW |
| 3 | `021c9da0` | 0x?? | single-field RMW + `GetSystemWork` bit, inlined |
| 4 | `021d1fc8` | 0x?? | ldrb-table forwarder (`6A`→`2D` special-case) |
| 5 | `021cf060` | 0x?? | read-only predicate, cached 403c base |
| 6 | `021c9dd8` | 0x?? | `&&`-chain shared-tail **[sib]** |
| 7 | `021c9e2c` | 0x?? | sibling of `021c9dd8` (final helper `02006194`) |
| 8 | `021cff48` | 0x54 | actor `unk8` byte remap, shift-form `(u8)`, `02018bc0` ×2 |
| 9 | `021cff9c` | 0x48 | 2 single-field RMW split by 2 calls |
| 10 | `021cc7a0` | 0x3c | ternary→cond-move nested call (default+`if`) |
| 11 | `021ca4d8` | 0x4c | out-param coords (`02006110`) + origin bias, `&0xF` |
| 12 | `021cc948` | 0x6c | MMIO BG-scroll double-write (`0x04000010/14`), guard |
| 13 | `021cc9b4` | 0x50 | 2-case switch + 12-byte struct copy → `ldm`/`stm` |
| 14 | `021cb218` | 0x44 | `\|\|`-with-embedded-assignment, cached base across calls |
| 15 | `021d1884` | 0x2c | clean 10-iter counted loop |
| 16 | `021cc3d4` | 0x50 | 5-iter actor-table reset loop + final RMW |
| 17 | `021d0ed0` | 0x48 | 4660-slot id RMW (bits 18:11) + flag **[sib]** |
| 18 | `021d0e88` | 0x48 | 4660-slot search loop (sibling of `021d0ed0`) |

(Picks 1-7 carried over from the pre-compaction half of the session; 8-18 this
half. Sizes left `0x??` where not re-measured — all are `<0x100`.)

## New sub-recipes banked (wave 2)

1. **Struct-copy → `ldm`/`stm`.** A 12-byte (3-`int`) POD-struct assignment
   `*(struct blk3 *)dst = *(struct blk3 *)src` emits `ldm`/`stm` — the lever for
   matching block copies (`021cc9b4`). A sparse 2-case `switch` (cases 0/1 +
   default) lowers to a `cmp`/`beq` chain, **not** a jump table, so it dodges the
   brief-305 switch-case-body-layout wall.
2. **Cached-base for callee-saved retention across calls/loops.** Caching
   `char *b = data_…;` at function top makes mwcc hold the base in a
   callee-saved reg across intervening calls or a loop body, matching origs that
   keep the base live (`021cb218` across two predicate calls; `021cc3d4` across
   the 5-iteration loop). Distinct from wave-1's cached-base-for-pool-hoist.
3. **Declaration-order register flip.** When two locals reg-number-swap vs orig
   (loop counter ↔ pointer, or two field temps), swapping their declaration
   order flips the `r4`/`r5` (resp. `ip`/`lr`) assignment (`021cc948`,
   `021d1884`). Cheap one-line fix for a clean 2-register swap.
4. **Ternary vs default-then-`if`.** `v = c ? A : B` emits *both* arms
   conditional (`moveq`/`movne`); `v = B; if (c) v = A;` emits an unconditional
   default + a single conditional override. Match whichever shape the orig uses
   (`021cc7a0` needed the latter).
5. **2-RMW split by calls = two single-field RMWs.** When ≥2 field RMWs on the
   same base are separated by a call, the base reloads after the call, so each
   RMW is isolated and matches cleanly (`021cff9c`). This is **not** the
   multi-field wall — that needs ≥2 RMWs holding the base/mask with *no*
   intervening reload.
6. **Shift-form `(u8)` extract.** `(unsigned)(x << 24) >> 24` for a byte read
   fed to a compare/value — `(unsigned char)x` instead emits `and #255`, but the
   orig uses `lsl #24; lsr #24` (`021cff48`). Extends wave-1's nibble shift-form
   to bytes.
7. **`||` with embedded assignment.** `if ((A && B) || (v = expr) != 0) { v =
   f(); }` faithfully emits the short-circuit with the side-effect assignment
   supplying `v` on the fall-through path (`021cb218`).
8. **MMIO double-write under a guard.** The packed value is recomputed in each
   branch (the guard prevents cross-branch CSE) with `volatile` stores
   (`021cc948`).

## Walls surfaced (deferred — GLOBAL_ASM tail / permuter candidates)

- **Field-address pooling on a post-call single access (NEW sub-variant).** A
  single-field RMW or counter `+= 1` *after* a call fuses `base + offset` into
  one pooled constant (`ldr r1,POOL; ldr r0,[r1]`) instead of `[base, #offset]`;
  the orig reuses the base's pool entry + an immediate offset. Cached-base does
  not fix it (mwcc either still fuses, or pins the base callee-saved and skips
  the reload — neither is orig's reload+offset shape). Hit: `021ccf8c`,
  `021cefb4`, `021d0afc`, `021d0b4c`.
- **`(n<<K1)>>K2` nibble-reposition fusion.** mwcc collapses
  `((unsigned)(v<<23)>>28) << 28` to `(v<<23) & 0xF0000000`, skipping the orig's
  explicit `lsr #28; lsl #28`. A named intermediate local does not block it.
  Hit: `021ceffc`.
- **Load-destination register-numbering.** A CSE'd load lands in `r1` vs orig's
  `r0`, cascading a clean 2-register swap through the rest of the body; not
  C-steerable. Hit: `021d20e8`, `021d18b4` (`ip`↔`lr`).
- **Argument-evaluation-order register cascade.** The orig evaluates the second
  call-arg's partial first (right-to-left), keeping the loaded value live in
  `r0`; mine goes left-to-right. Hit: `021cd700`, `021ce344`.
- **Multi-field RMW holding the base (wave-1 wall, recurs).** ≥2 field RMWs
  holding the base/mask with no intervening reload. Hit: `021d1c80` (3 RMWs on
  403c), `021ce344`.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | **OK** (byte-identical with all 18 carved) |
| USA / JPN `ninja sha1` | OK (intact; EUR-only ship — addresses region-divergent) |
| per-pick | dcheck byte-identical vs `m2c_feed` disasm (branchy gated by EUR sha1) |
| `tools/check_match_invariants.py` | 0 errors (4919 warns, pre-existing) |
| `ruff check .` | clean |
| `tests/` (full suite) | passed |

EUR-only config change (`config/eur/arm9/overlays/ov011/delinks.txt` gains 18
`complete .text` blocks). No tool change, no USA/JPN config change, no symbol
renames. `src/overlay011/` gains 18 `.c`.

## Recommendation for the brain

1. **ov011 clean-C remains live but is thinning.** 18 byte-identical `.c` this
   wave; ~37 reachable (`<0x100`) functions remain, but the wall rate is rising
   (13/31 attempts walled here vs 3/22 in wave 1). The cohort is now picked over
   for the easy accessor/forwarder shapes.
2. **Run 3-region SHA1 + wire USA/JPN on merge.** Per-pick gate here is EUR; the
   ov011 functions are at region-divergent addresses (JPN has no ov011
   `delinks.txt`), so USA/JPN need their own delink wiring once the address map
   is known.
3. **The field-address-pooling-on-post-call wall is the new dominant drain.**
   Four picks (`021ccf8c`/`021cefb4`/`021d0afc`/`021d0b4c`) are byte-correct
   except for `base+offset` pool fusion after a call — prime register-rename
   `.s` / permuter targets, like the ov002 reg-walled tail.

## Cross-references

- `docs/research/brief-308-ov011-clean-c-wave1.md` — wave 1 (19 picks, the
  multi-field-RMW wall, the families this wave clones).
- `docs/research/brief-305-coldre-wave16-dispatcher-tier.md` — the switch-case
  layout wall this wave's sparse-switch (`021cc9b4`) sidesteps.
- `src/overlay011/ov011_core.h` — the ov011 vocabulary header (§VERIFIED updated
  with the wave-2 families).
