[//]: # (markdownlint-disable MD013 MD041)

# Brief 316 — ov004 clean-C wave 1 (fresh-overlay pivot)

**Brief:** 316 (decomper). Pivot off the tapped ov011 drain to ov004 (the survey
winner: 168 `<0x100`, 39 `<0x40`). Survey → build `ov004_core.h` → drain the
reachable `<0x100` cohort, family-first. Recipe unchanged (`m2c_feed` →
`#include` + guards → coerce → 3-region `ninja sha1`). ⚠️ ov004 has a benign dsd
check-symbols data-label drift (brief 818) — gate is `ninja sha1`, NOT
`ninja check`.

## Headline

**17 shipped, 3-region `ninja sha1` = OK.** The ov011 recipe transferred cleanly
to ov004 — cached-base for global accessors, guard-flip for block layout,
self-ptr record ops, predicates, forwarders. ov004 is a **huge, rich vein** (161
`<0x100` defined-in-gap remaining after this wave) — many more waves available.

## ov004 survey + structure

- **Mixed ARM / THUMB.** The `0x021c9xxx-0x021dexxx` ARM range is game logic over
  a dominant BSS state struct `data_ov004_0220b500` — clean-C-friendly. The
  `0x021dbxxx-0x021dexxx` THUMB range is generic string/crypto utilities
  (memcmp, ascii-validate, byte-accumulate, XOR) that hit the **Thumb
  section-alignment wall** → `.s` escape, NOT clean-C. This wave is all ARM.
- `defined-in-gap = 265, <0x100 = 161, <0x40 = 32` (pre-wave).
- New `ov004_core.h` created: bases `data_ov004_0220b500` (state struct) +
  `0220b568` (table [idx<<2]) + `02211490`/`02211538` (records); field map.

## The 17 picks

| family | funcs |
|---|---|
| b500 global predicate/accessor (cached-base) | `021cbf38` (id-latch), `021ce9b8`, `021d7c54`, `021d9948`, `021ce1bc` (indexed negate) |
| self-ptr record op | `021c9f94` (handle-free ×2), `021d56fc` (timer advance) |
| timer-setter (double-ternary, sibling family) | `021d4004`, `021d4238`, `021d4914` |
| forwarder / call-sequence | `021d2520` (init), `021c9d60` (se-play), `021c9d9c` (&&-predicate), `021cf600` (cell-config), `021d8608` (cached-base + 021c9f94), `021d5b9c` (repeated-call quiesce) |
| MMIO | `021d5d84` (0x0500045e backdrop grayscale) |

## Recipes — what transferred + ov004-specific gotchas

1. **Cached-base is mandatory for ov004 global accessors.** A bare
   `*(int*)(data_ov004_0220b500 + off)` reg-numbers the base (r1 vs orig r2);
   `char *b = data_ov004_0220b500;` fixes it (exactly as ov011). `021c9d60`
   (no global) matched without it.
2. **Guard-flip for block layout** (`021d9948`): `if (active) return cmp;
   return 0;` puts the shared `return 0` last (matches orig `beq <end>`), vs
   `if (!active) return 0;` which inlines a predicated early return.
3. **m2c_feed mislabels main-arm9 data symbols with the ov004 prefix.** A
   `0x0210xxxx` symbol shows as `data_ov004_02104f4c` but the real symbol is
   `data_02104f4c` (no overlay prefix) — using the mislabel → `mwldarm:
   Undefined`. Use the bare `data_0210xxxx` name (caught at link, fixed
   `021d5d84`).
4. **objdump offsets are decimal** (132 = 0x84, 136 = 0x88, 84 = 0x54) — don't
   misread the field offsets.
5. **dcheck tooling:** `arm-none-eabi-objdump` (GNU) renders `bx lr` (`0x_12fff1e`)
   as `msr SP_hyp, lr, lsl pc` — cosmetic; normalised in `/tmp/dcheck.py`. Also
   added `ldr<cond>` pool-load normalisation.

## Wall surfaced (deferred)

- `021d8d1c` — sub-engine BLDCNT (0x04001000) bitfield RMW; byte-identical except
  the orig uses `ip` as a scratch for `field>>8` while mwcc reuses `r2` (MMIO
  bitfield reg-alloc, eval-order-insensitive). 1 register off.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | **OK** (byte-identical, all 17 carved) |
| USA / JPN `ninja sha1` | OK (intact; EUR-only ship) |
| `check_match_invariants.py` | 0 errors (5001 warns, pre-existing + benign ov004 label drift) |
| `ruff check .` | clean |
| `tests/` | passed |
| `ninja check` | NOT run — benign ov004 dsd label drift (brief 818), per the brief |

EUR-only config change (`config/eur/.../ov004/delinks.txt` +17 `complete`
blocks). `src/overlay004/` gains `ov004_core.h` + 17 `.c`.

## Recommendation for the brain

1. **ov004 is the new primary clean-C vein** — 161 `<0x100` remain (this wave: 17,
   ~10% of the cohort). The recipe transfers; expect ov011-like wave sizes
   (12-18) for several waves before the hard tail.
2. **THUMB sub-cohort (021dbxxx) is `.s`-escape territory** (Thumb-align wall) —
   route it to the scaffolder's asm path, not clean-C, if wanted.
3. **The timer-setter family** (`021d4004/4238/4914`) and the b500-predicate
   family clone mechanically — good wave-2 batch starters.

## Cross-references

- `docs/research/brief-315-ov011-clean-c-wave4.md` — the ov011 tap + pivot survey
  that picked ov004.
- `src/overlay004/ov004_core.h` — the new ov004 vocabulary header (§VERIFIED).
