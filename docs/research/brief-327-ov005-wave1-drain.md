[//]: # (markdownlint-disable MD013 MD041)

# Brief 327 — pivot to ov005: clean-C wave 1 (fresh overlay)

**Brief:** 327 (scaffolder, co-drain). ov008's `0x98–0xf4` medium tier is
permuter-bound (brief-325), and direct-mwcc is productive on fresh easy `<0x98`
tiers — so pivot to **ov005**. Per-pick gate = EUR objdiff 100% (direct-mwcc);
the brain reproduces the 3-region SHA1 on merge. Own `src/overlay005/`, the
ov005 `delinks.txt`, and `ov005_core.h`. Target ~12–15; flag thinning.

## Headline

**13 shipped (all `.c`), all EUR objdiff 100%**, all drop out of a clean ov005
re-delink, and **EUR `ninja sha1` PASSES** with the wave applied. ov005 matched:
6 → **19**. Upper-mid of the 12–15 target on the first pass — ov005's easy tier
is productive (like ov008 wave 1), validating the fresh-overlay pivot.

## ⚠️ Overlay-swap flag (sanity check the brief asked for)

**ov005 shares base `0x021aa4a0` with ov000 / ov002 / ov008** — it is a member
of the overlay-swap group (the ov000/ov002 pattern, extended to four overlays;
same memory region, mutually exclusive at load time). This is *not* a blocker:
- It is the known swap zone; the decomper and scaffolder have both worked ov000
  and ov008 (same group) successfully.
- Per-overlay `delinks.txt` + per-overlay gap objects keep ov005 isolated. An
  ov005 function at e.g. `0x021aa540` is a *different* function than ov008's at
  the same address — they never co-exist. No address overlaps any of my ov008
  wave-1 picks.
- **The EUR `ninja sha1` PASS with all 13 applied is the proof** the isolation
  is byte-clean.

Documented at the top of `ov005_core.h` for future waves.

## The 13 picks (per-unit EUR objdiff 100%)

| family | funcs | objdiff |
|---|---|:---:|
| u16-array bit set/clear + 1-bit flag | `021ab32c` (`\|=`) · `021ab354` (`&=~`) | 100% |
| guarded-call (pair / + record-alloc) | `021aaf40` · `021aaf6c` | 100% |
| guard + field setters | `021aca30` | 100% |
| init-sequence | `021acf78` | 100% |
| guarded VRAM clear / clamp + dual-call | `021abc88` · `021abdb8` | 100% |
| guarded flush + MMIO double-RMW | `021ad20c` | 100% |
| MMIO bitfield-RMW leaf | `021b1000` | 100% |
| **bounds-check family** (`&&`-chain) | `021aee84` · `021aeefc` (clone) | 100% |
| node compare + mla | `021ab2e0` | 100% |

All 13: EUR objdiff 100% (direct-mwcc) · 13/13 clean re-delink drop-out · EUR
`ninja sha1` OK.

## Recipes (all carried from ov000/006/008; re-proven on ov005)

- **Bounds-check `&&`-chain** (`021aa578` recipe from ov008): a 0/1 return over
  a comparison chain = `if (A && B && C && D) return 1; return 0;` — the `&&`
  short-circuits each clause to a shared `return 0`. (`021aee84`/`021aeefc`.)
- **MMIO double-RMW → absolute addresses** (ov016 recipe): two MMIO regs cleared
  must be written as absolute `*(volatile int *)0x04000000` /  `…0x04001000`,
  NOT a shared base local (shared → base in r2; absolute → r1 = orig).
  (`021ad20c`.)
- **Unsigned for `lsr`**: an MMIO/field read shifted right must be `volatile
  unsigned *` (else `asr`). (`021b1000`.)
- **Lazy condition read**: `if (w == 0 || *(u16*)(o+22) == 0)` reads the 2nd
  operand inside the `||` so it compiles to `ldrhne` (predicated). (`021abc88`.)
- **`(o + idx)[6]`** (not `o[idx + 6]`) keeps the orig's `base + offset`
  addressing instead of folding `(idx+6)*4`. (`021abc88`.)
- **assign-then-pass**: `o[0] = f(); g(o, o[0]);` sequences the store before the
  arg-setup. (`021aaf6c`.)

## Deferred near-miss

`021acfb0` (indirect-dispatch via `blx` through a fn-ptr table) — 24v26, a
post-`blx` block scheduling/register difference, the same permuter class as
ov008's `021aafa4`. Catalogued; not shipped.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct-mwcc, per-unit) | **13/13 byte-identical** |
| clean re-delink drop-out (disasm-header scan) | **13/13** out of the ov005 gap objects |
| EUR `ninja sha1` | **OK** (full ROM byte-identical; confirms swap-group isolation) |
| `ruff` / `tests/` / `check_match_invariants` | clean / pass / 0 errors |

`src/overlay005/` gains 13 `.c` + the new `ov005_core.h`. EUR ov005
`delinks.txt` +13 `complete` (6 prior → 19). No tool / USA / JPN change.

## Recommendation for the brain

1. **ov005 is a productive clean-C vein — keep the scaffolder here for wave 2.**
   The `<0x98` cohort (25) still has ~10 unexamined medium-leaning funcs (loops,
   predicates, the fn-ptr dispatch family) and the `0x98+` tier is untouched.
2. Route `021acfb0` (and future indirect-dispatch near-misses) to the permuter
   with ov008's `021aafa4` — they are the same shape.
3. The overlay-swap group (0/2/5/8) is fully drainable per-overlay; no special
   handling needed beyond the per-overlay delinks already in place.

## Cross-references

- `docs/research/brief-325-ov008-wave2-medium-tier.md` — the medium-tier
  permuter verdict that triggered this fresh-overlay pivot.
- `src/overlay005/ov005_core.h` — globals / sink sigs / family recipes /
  the overlay-swap note / §VERIFIED wave-1 block.
