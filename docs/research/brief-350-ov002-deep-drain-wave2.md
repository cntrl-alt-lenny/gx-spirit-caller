[//]: # (markdownlint-disable MD013 MD041)

# Brief 350 — ov002 deep-drain wave 2

**Brief:** 350 (decomper). Continue ov002 small-first through 0x2c–0x40, start the
matchable mid bodies. NEW: **dual-compile** — try `.legacy.c` (mwcc 1.2/sp2p3) on
2.0 near-misses (brief 349 found ~50% of *main's* walls were legacy). Gate =
3-region `ninja sha1`; carve-size audit; GOTCHA-18; classify. Target 15–19.

## Headline

**17 shipped, 3-region `ninja sha1` = EUR / USA / JPN all OK.** In target. The
wave's main result is a **sub-classification of the 0x2c–0x40 tier**, plus two
banked recipes (the fn-ptr-cast pass-through, the 021d479c arg-pack family) and a
**negative dual-compile finding** (these are 2.0 functions; legacy does not apply).

## The 0x2c–0x40 tier splits in two

| sub-class | match rate | examples |
|---|---|---|
| **(a) clean forwarders / predicates** (wave-1 shapes) | **high** | all 17 picks |
| **(b) arithmetic-combine / inline-vs-branch** | near-miss | the 0x2c arithmetic batch |

Sub-class (b) is **codegen-sensitive**: mwcc -O4 makes choices the orig avoided —
- **byte-pack**: `(x & 0xFF) << 8` → `lsl#24;lsr#16` vs orig `and;orr lsl#8`;
- **range-opt**: `k==6||k==7||k==8` → `sub;cmp;movls` vs orig's three `cmp`s;
- **inline-vs-outlined** constant returns (a shared `return 0` is branched-to in
  orig, inlined by mine);
- **"keep r0 for the return, temp in r2"** register choice.

These are **not walls** (the logic is right) but resist hand-RE — a **soft-wall
sub-tier**. The lever is selection: take (a), defer (b).

## The 17 picks

- **021d479c arg-pack family** (tail-call): `021d873c` / `021d8770` (kind 41),
  `021df708` (43, tag 1), `021e278c` (81) — `func_021d479c((u16)((arg0?0x8000:0)|
  KIND), (u16)arg1, tag, 0)`.
- **sibling predicates**: `0228a888` / `0228a974` (player-flag mismatch);
  flag-compare pair `02206100` / `02206134`.
- **guard + sink + compare**: `0229e814` (chains the wave-1 `0229d2c8`),
  `022aec44` (+ toast 58), `0220de28`, `0220cd40`, `02208004`, `02215bc4`
  (bit-guarded toggle), `021ded54` (bit-test, sibling of wave-1 `021de4b0`),
  `0220623c`, `0220b1dc`.

## Recipes banked

1. **fn-ptr-cast pass-through** — when the live extra arg's sink is declared in
   `ov002_core.h` with too few params, call via a cast:
   `((int (*)(struct Ov002Self *, int))func_ov002_021ff3bc)(self, arg1)`. mwcc
   emits a clean **direct** `bl` and sets up `r1=arg1` (keeps it live). Fixes the
   pass-through without a prototype conflict (`0220623c`).
2. **021d479c arg-pack family** template (above).
3. **flag-vs-bitfield compare** folds the `>>31` into the `cmp`
   (`cmp ip, r2, lsr #31`); the leading `return 0` inlines (`02206100/34`).

## Dual-compile (legacy) — a negative result for ov002

The brief's `.legacy.c` lever did **not** apply here. These ov002 bodies are
**mwcc 2.0** (orig epilogues are `pop {r3,pc}` / `bx lr`). Compiling the same C as
`.legacy.c` (1.2/sp2p3) produces a *different frame* (`stmfd {lr}; sub sp,#4;
bx lr`) that doesn't match. So the predication-vs-branch near-misses here are a
**2.0-internal codegen choice**, not legacy — dual-compile doesn't rescue them.
(Main's stragglers genuinely are legacy; ov002's aren't, at least in this tier.)

The held swap `021b91d0` (`stmfd {r3}; sub sp,#4; …; bx lr`) matches **neither**
2.0 nor sp2p3 nor sp3 (sp3's epilogue is `pop {pc}`) — a genuine straggler (-O0 or
hand-asm), a `.s`-escape candidate.

## Classification refinement

The matchable-C bucket (census ~1738) is real, but it has an internal grain:
- **easy**: forwarders / predicates / tail-call families — fast, high yield;
- **codegen-finicky**: arithmetic-combine, inline-vs-branch, reg-temp bodies —
  matchable in principle, slow to hand-RE, effectively a **partial wall**.

So the back half of ov002 is **less uniformly easy than wave 1 suggested**: the
0x24–0x28 tier was almost all "easy", but from 0x2c up the "finicky" sub-tier
grows. Still majority-matchable; just expect a lower per-wave yield and more
defers as the bodies get more arithmetic.

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | **OK** (byte-identical, all 17 carved) |
| `check_match_invariants.py` | 0 errors (5291 warns, pre-existing placeholder names) |
| `ruff check .` | clean |
| `tests/` | passed |
| GOTCHA-18 cross-wire | clean (no pick references an ov000 symbol; sha1 proves isolation) |

Carve-size audit caught **7 mis-sizes** (a dedup'd worklist carried 0x34-vs-0x30
stale sizes; one overlapped) — fixed before the gate, 0 mismatches after. A stray
`for`-loop heredoc also leaked two space-named files (`…021d8770 41.c`) — removed.
EUR-only config change (+17 `complete` blocks); `ov002_core.h` §VERIFIED extended.

## Recommendation for the brain

Keep the decomper on ov002 (still majority-matchable), but **calibrate expectations
down** for the back half: the easy forwarder/predicate sub-tier yields fast, while
the arithmetic/inline-branch sub-tier is a slow partial-wall. Future waves should
**select the forwarder/predicate/family shapes** and defer the codegen-finicky
bodies to a later permuter/hand-RE pass. The `.legacy.c` dual-compile is **not**
the lever for ov002's 2.0 cohort (it is for main).

## Cross-references

- `src/overlay002/ov002_core.h` — §VERIFIED (waves 1+2) + the pass-through lever
  + the new sub-class split.
- `docs/research/brief-348-ov002-deep-drain-wave1.md` — wave 1 (the pass-through
  lever, the 0x24–0x28 easy tier).
