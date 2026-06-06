[//]: # (markdownlint-disable MD013 MD041)

# Brief 356 — ov002 deep-drain wave 5 (last select wave)

**Brief:** 356 (decomper). The *last pure-easy select* wave on ov002. Work the
untouched ≤0x38 clusters in fresh address regions + any remaining indirect-dispatch
(`02257594`/`c54`/`ca8`) or `021d479c` arg-pack family members; **defer** the
codegen-finicky bodies (don't grind); and **flag the easy-tier exhaustion count** —
that signal triggers brief 358 (the dedicated ov002 routing/permuter pass). ov002 is
2.0-only (no dual-compile). Gate = 3-region `ninja sha1` (NOT `ninja check`);
carve-size audit; GOTCHA-18; divmod. Target ~10–14.

## Headline

**12 shipped, 3-region `ninja sha1` = EUR / USA / JPN all OK** (mid-target). The
wave drained the last of the genuinely-easy ≤0x38 shapes and, crucially, **partially
un-walled two formerly-deferred classes** with two new C levers (the `(u8)` byte-pack
cast, the dispatch-order inversion). It also produces the **easy-tier exhaustion
count** the brief asked for, which arms brief 358.

## The 12 picks

| addr | size | shape |
|---|---|---|
| `021f81a4` | 0x28 | 2-way kind dispatch (inversion-steered branch order) |
| `0223b430` | 0x38 | guard + 2-way call (inversion-steered) |
| `0221292c` | 0x28 | flag+const predicate (pass-through arg1) |
| `0228de04` | 0x30 | per-player compare, `2000 ± f(a,b)` (pass-through arg1) |
| `022477a0` | 0x38 | forwarder → `func_022470c4`, value-map `!=0?2048:0` |
| `022b9350` | 0x38 | open/stamp/close handle sequence |
| `021f85f8` | 0x34 | lazy-init guard + forward |
| `02288214` | 0x38 | u16-holder table lookup → score ≥ 1200 |
| `02271a78` | 0x3c | dispatch + `arg1?2:arg0` selector + latch-clear |
| `0229d154` | 0x30 | counter loop `for(i<53) if(a[i]) a[i+53]++` |
| `0226b0f0` | 0x2c | byte-pack → kind-14 request (`(u8)` lever) |
| `0226b22c` | 0x2c | byte-pack → kind-21 request (`(u8)` lever) |

## New recipes banked

1. **Dispatch-order inversion** — for a 2-way `if (k > N) special(); else default()`
   where the orig *branches* the `>N` case (so `default` is inline), write it as
   **`if (k <= N) return default(); return special();`** → mwcc emits `bhi special`
   (default inline). The C condition's polarity picks which arm inlines vs branches.
   Resolved `021f81a4` and `0223b430` (both first compiled as `bls`/`ble` = inverted).
2. **The `(u8)` byte-pack lever** — `(u8)lo | ((u8)hi << 8)` compiles to
   `and; and; orr …, lsl #8` (matches the orig), whereas the natural
   `(lo & 0xff) | ((hi & 0xff) << 8)` triggers mwcc's `lsl #24; … lsr #16` peephole.
   **The `(u8)` cast is the steer.** This means a chunk of the "byte-pack" defer class
   is actually *recoverable in C* — brief 358 should re-try the catalogued byte-pack
   near-misses with this cast before sending them to the permuter.
3. **Halfword sink params are `u16`, not `short`** — a sink that `strh`-stores its
   args must declare them `u16`; a `short` param makes *callers* truncate with `asr`
   (sign-extend) where the orig uses `lsr`. Fixed the `0226b0f0`/`22c` callers (the
   `0226acf8` sink itself stays deferred on store-scheduling — see below).
4. **`arg1 ? 2 : arg0`** (ternary whose *else* is an incoming arg already in r0) →
   `cmp r1,#0; movne r0,#2` (no `moveq`, since r0 already holds arg0) (`02271a78`).
5. **Counter loops match when the body is a scaled index** — `for (i<N) if (a[i])
   a[i+K]++` compiled byte-exact (`0229d154`, no strength-reduction). But a loop that
   *returns* `base + i*8` **does** get an induction variable (`0223b3cc` walled) — so
   "loop" is not uniformly a defer; the return-of-address sub-shape is.
6. **Pass-through arg1 re-confirmed** as the fix for "field/base lands in r2" near-
   misses (`0228de04`, `021f81a4`): forward the live arg to the sink.

## Easy-tier exhaustion — the brief-358 trigger

Post-wave census of **uncarved** ov002 functions (gap objdump `F .text`):

| band | count | composition |
|---|---:|---|
| uncarved total | ~2748 | (the whole remaining overlay) |
| **uncarved ≤0x38** | **27** | **13 catalogued finicky-defers + 14 not-yet-examined** |
| uncarved ≤0x40 | 45 | (≤0x38 set + the 0x3c–0x40 finicky band) |

The ≤0x38 tier stood at ~38 before this wave; draining 11 leaves **27**. Of those,
roughly half (13) are already on the finicky-defer list, and the 14 not-yet-examined
will — at this wave's grain — yield only a handful more clean shapes before the
finicky class dominates. **The pure-easy select tier on ov002 is effectively
exhausted.** Continuing to "select" yields single-digit waves from here.

### → This arms brief 358 (the routing / permuter pass)

The accumulated finicky backlog is now sizable and **uniform by class**, which is
exactly what a dedicated routing pass wants:

| defer class | examples | route |
|---|---|---|
| predicate-vs-branch (early `return CONST`) | `021f95f8`, `0220c2c0`, `02267f90`, `021efd38`, `02201e38`/`0220d7c0`/`02205dc8` | permuter / `asm_escape --c` (2.0-OK) |
| store-scheduling | `0226acf8`, `022592b8`, `02259324` | permuter |
| **byte-pack** | catalogued near-misses | **re-try the `(u8)` lever first**, then permuter |
| loop strength-reduction (return-of-addr) | `0223b3cc` | permuter / `.s` |
| mirror-reg without a sink to forward to | `02273b1c`, `0220cff8` | permuter |
| range-opt `==N\|\|==N+1` | `022abf88`, `0220cf0c` | permuter |
| reg-choice (load-into-r1-vs-r0) | `022576d8` | permuter |
| instruction scheduling | `021d90c0` (1 insn swapped) | permuter |
| legacy-frame straggler | `021b91d0` | `.s`-escape |

Brief 358 should (a) sweep the byte-pack class with the new `(u8)` lever (likely
recovers several as clean C), then (b) run the permuter on the predicate-vs-branch,
store-scheduling, reg-choice, scheduling, and mirror-reg classes, and (c) `.s`-escape
the genuine stragglers (`0223b3cc` return-of-addr loop, `021b91d0`).

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | **OK** (byte-identical, all 12 carved) |
| `check_match_invariants.py` | 0 errors (5376 warns, pre-existing placeholder names) |
| `ruff check .` | clean |
| `tests/` | passed |
| GOTCHA-18 cross-wire | clean (no pick references an ov000/005/008 symbol; sha1 proves isolation) |

Carve-size audit caught **1 mis-size** (`0221292c` carried 0x30 vs the true 0x28 —
would have overlapped the next function) — fixed before the gate, 0 mismatches after.
EUR-only config change (+12 `complete` blocks); `ov002_core.h` §VERIFIED extended.

## Recommendation for the brain

**Pivot the decomper off ov002's select tier.** The pure-easy ≤0x38 vein is
exhausted (27 left, half finicky). Two options:

1. **Run brief 358** (the routing/permuter pass) on the catalogued finicky backlog —
   the `(u8)` byte-pack lever alone should recover several as clean C, and the
   permuter is the right tool for the predicate-vs-branch / store-scheduling /
   reg-choice classes. This keeps mining ov002 but with the right instrument.
2. **Pivot the clean-C decomper to a fresh overlay's easy tier** (the scaffolder's
   co-drain overlays — ov005 etc. — still have unmined small tiers) and reserve ov002
   for the permuter pass.

Either way, **stop hand-selecting on ov002** — the marginal clean shape now costs
more than a fresh overlay's first wave.

## Cross-references

- `src/overlay002/ov002_core.h` — §VERIFIED now through brief 356 + the new levers.
- `docs/research/brief-354-ov002-deep-drain-wave4.md` — wave 4 (the inline-vs-branch
  dominant defer class this wave's exhaustion census builds on).
- `docs/research/brief-350-ov002-deep-drain-wave2.md` — the original byte-pack defer
  observation (now partially un-walled by the `(u8)` lever).
