/* ov015_core.h — ov015 per-overlay vocabulary (brief 331, co-drain wave 1).
 *
 * Scaffolder's drain stream pivoted ov005 -> ov015 (ov005's easy tier drained,
 * brief 329). Direct-mwcc per-pick gate (EUR objdiff 100%); the brain runs the
 * 3-region SHA1 on merge. Own src/overlay015/ + ov015 delinks.txt + this header.
 *
 * ov015 is singleton-dominated (like ov005) — small dispatchers / accessors /
 * predicates over two central state objects, NOT a clone-family state machine
 * like ov006. Bring the wave-2 register-reshape recipe (ov005_core.h §VERIFIED):
 * for a 70%+ reg-alloc near-miss, reshape before deferring — min/max as explicit
 * if-assign (not ternary), bind a call result to a temp before reuse, reuse a
 * PARAM in place (not a fresh local).
 *
 * Dominant state objects (the central structs the cohort reads):
 *   data_ov015_021b5e44 (18 refs) — base/table holder (+0xa78 table, +0xa7c base)
 *   data_ov015_021b5e28 (17 refs) — companion flags (+0xa94 guard)
 */
#ifndef OV015_CORE_H
#define OV015_CORE_H

extern char data_ov015_021b5e44[];
extern char data_ov015_021b5e28[];

/* func_020b3870 is mwcc's renamed SIGNED DIVMOD runtime: quotient in r0,
 * REMAINDER in r1. Call it EXPLICITLY by name for `a/b` (variable divisor) —
 * the `/`,`%` operators emit `_s32_div_f` instead and trap (symbol mismatch).
 *   quotient:  `extern int func_020b3870(int,int);  q = func_020b3870(a,b);`
 *   remainder: `extern long long func_020b3870(int,int);
 *               r = (int)(func_020b3870(a,b) >> 32);`  (the >>32 picks up r1) */

/* ====================================================================== *
 *  §VERIFIED — co-drain wave 1 (brief 331). 12 .c, all EUR objdiff 100% + *
 *  ninja rom OK. ov015's reachable cohort is small dispatchers/accessors  *
 *  over the two central structs + a text-metrics layer that leans on the  *
 *  divmod above and on ov005's shared metrics (021ac9c8 / 021ab108).      *
 * ====================================================================== */
/* Picks (all <0x80 singletons except the 0x78 dispatch clone pair):
 *  - 021b5a6c init+return-self · 021b2bf8 register-2-callbacks.
 *  - 021b2b08 / 021b2b80: 8-case VRAM-bank selectors (jump table, tail-call per
 *    case) — clone pair differing only in the 8 dispatched helpers.
 *  - 021b35d0 cell-addr resolve (two guards → base + table[idx*4]); BIND the
 *    multiply-referenced struct base (021b5e44) to a `char *cell` local so it
 *    loads once up front (else it loads late → reg mismatch).
 *  - 021b31f0 load-rect+seed · 021b3528 printer-config (the +0x5c attr 4-bit
 *    field reads as `((unsigned)h<<22)>>28`; the data_02104f4c channel is the
 *    `unsigned :3` bitfield).
 *  - 021b34cc scroll-advance · 021b23f4/021b238c/021b2490 interp (clamp +
 *    span*(pos-lo)/(hi-lo) via the divmod quotient; 021b238c uses a 1-bit
 *    dirty-flag bitfield struct so the test compiles to `lsl#31;lsr#31`).
 *  - 021b3578 build-2-printers (stack cfg) · 021b36c4 run-width (uses the divmod
 *    REMAINDER: `w += n - (w%n)` via the long-long trick above).
 *  - 021b59a4 text-job teardown (guarded frees over both structs).
 *
 * Register-reshape recipe (carried from ov005_core.h, applied here): for a 70%+
 * reg-alloc/scheduling near-miss, reshape before deferring — bind a value to a
 * named temp so it loads/stays in the right register, reuse a param in place,
 * write min/max as an explicit if-assign, force a bitfield extraction with a
 * `:N` struct (not `&mask`, which mwcc emits as `and`).
 *
 * DEFERRED near-misses (NOT shipped):
 *  - 021b5a14 (0x50) indirect-dispatch via `blx` through a fn-ptr table —
 *    PERMUTER class (same as ov005 021acfb0 / ov008 021aafa4). Catalogue for
 *    the Mac permuter lane; do not grind direct-mwcc.
 *  - 021b23f4 (0x5c) clamp-interp — 78% (reshaped from 65%); the two span-part
 *    loads stay split across the lo-clamp + an sa/sb r2/r3 allocator coin-flip.
 *  - 021b28a8 (0x48) edge predicate — 89%; the case-1 `!=0` bool emits
 *    `movne;moveq` where the orig is `moveq;movne` (cond-move order; resists
 *    `==0?0:1`). Both are direct-mwcc reg/codegen-order misses, not permuter. */

/* ====================================================================== *
 *  §VERIFIED — co-drain wave 2 (brief 333). 5 .c, all EUR objdiff 100% +  *
 *  ninja rom OK. The 0x80+ tier: constructors / fade-tickers / blit setups *
 *  over the two central structs. Yields lower than wave 1 — see TIER below.*
 * ====================================================================== */
/* Picks:
 *  - 021b3170 scroller constructor (open stream, seed window geometry, derive
 *    the +0x64 row count); the orig CONSTANT-FOLDS `o[0x5a]-o[0x56]` (just-stored
 *    0xc0/0) to the literal 0xc0 — write the literal `func_020b3870(0xc0, ...)`.
 *  - 021b4740 / 021b46c8 fade-out / fade-in tickers (decrement +0x28, push the
 *    31-step `level*31/scale` brightness via func_0208e318, blank/release at 0).
 *    Siblings differing only in the 4th/5th func_0208e318 arg order + the tail.
 *  - 021b3614 cell blit (table lookup → build glyph on a stack printer → blit).
 *  - 021b3028 two-field status redraw (open temp render per field, blit, free).
 *
 * THE LEVER for this tier — BIND THE STRUCT BASE TO A LOCAL.  These funcs touch
 * data_ov015_021b5e44 (and /28) MANY times across calls; the orig keeps the base
 * in a callee-saved reg (r4/r5) loaded ONCE up front, but a direct
 * `data_ov015_021b5e44 + off` reference reloads it each time → big diff (021b4740
 * was 22%→100%, 021b3614 88%→100%, like wave-1 021b35d0). Always `char *s =
 * data_ov015_021b5e44;` at the top. See [[ ov005_core.h reshape recipe ]].
 *
 * ⚠️ TIER TRANSITION: waves 1+2 = 17 matched; the easy/linear <0x100 tier is
 * now largely drained. The REMAINING ~17 funcs are render/layout-heavy (nested
 * tile loops, stack-struct glyph builders, MMIO bit-packers, big rect math) and
 * direct-mwcc-RESISTANT — every wave-2 miss was a local-variable register/store
 * CHOICE the recipes can't steer (distinct from the struct-base loads, which
 * they fix). Wave 2 hit 5 of 10 attempts. Recommend the brain weigh a 3rd ov015
 * wave (~5/wave) vs a fresh overlay, and route the tail to the m2c/permuter Mac
 * lane.
 *
 * DEFERRED near-misses (NOT shipped — all reshaped per brief, then catalogued):
 *  - 021b5a14 (0x50) indirect-blx dispatch — PERMUTER class (ov005 021acfb0 kin).
 *  - 021b3f98 (0xa8, 76%) the `col` local lands in r0 not r1 (alloc coin-flip).
 *  - 021b27d8 (0x84, 71%) the req[0]/req[1] stores want `stmia`, mwcc splits them.
 *  - 021b30f0 (0x78, 34%) nested tile-fill loop — pointer-IV factoring + loop
 *    lowering diverge. - 021b2490 (0x64, 61%) the `phase` param register.
 *  - 021b43a8 (0x9c, 44%) whole r4-r7 allocation rotated (a/b/acc/s).
 *  (Plus wave-1: 021b28a8 cond-move order, 021b23f4 sa/sb alloc.) */

#endif /* OV015_CORE_H */
