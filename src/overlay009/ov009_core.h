/* ov009_core.h — shared notes for the overlay-009 clean-C co-drain.
 *
 * ov009 is a scene/transition controller overlay (it sits in the overlay-0/2
 * swap base range 0x021aa…0x021ad). It was partially drained by an earlier
 * stub/sinit pass (ov009_*, sinit_ov009_*); this is the first reshape-driven
 * wave over the small-function tail.
 *
 * Two sub-objects drive most of it:
 *   data_ov009_021adc54 — the scene/board controller (021ab848 builds it,
 *                         021ab910 steps it, 021ad73c tears it down).
 *   data_ov009_021adc00 — the input/panel object (021ab7b4 enables it,
 *                         021ab32c polls it, 021ab374/021ad73c drive it).
 * Both are passed by pointer; methods index int fields (o[0x8] surface,
 * o[0xc] frame, o[0x10] live flag, o[0x18] selection, o[0x24] state,
 * o[0x2c] handle, o[0x30] frame-counter).
 *
 * NOTE: ov009 has NO clone families — the size-histogram pairs (0x44/0x80/0xe8)
 * are coincidental, all distinct logic. Each func matched on its own recipe.
 */
#ifndef OV009_CORE_H
#define OV009_CORE_H

extern char data_ov009_021adc54[];
extern char data_ov009_021adc00[];

/* ====================================================================== *
 *  §VERIFIED — co-drain wave 1 (brief 343). 8 .c, all EUR objdiff 100% +   *
 *  ninja rom OK. The recipe library transferred to a 5th overlay; 8 of 12  *
 *  attempts matched (the 4 misses are register-allocation coin-flips).     *
 * ====================================================================== */
/* Picks (by recipe):
 *  - 021ad73c scene-exit TEARDOWN — ov005/ov003 teardown recipe verbatim:
 *    seven fixed shutdown calls + dual func_0208c884(reg, -0x10) (the -0x10
 *    materialises as `mvn r1,#0xf`) + a data_021040ac[0x24] gate. Returns 0/!idle.
 *  - 021ab32c / 021ab8c8 per-entry POLL / TEARDOWN guard-chains (MMIO 0x800
 *    status bit test in data_02104bac[0x54]); 021ab7b4 enable/disable state-setter
 *    (lazy o[0x8] alloc, load o[0x8] ONCE before the a==0 branch via `int s`).
 *  - 021ab848 controller INIT (zero data block + seed fields + alloc + sub-builders).
 *  - 021ad1bc bit-test `(mask & (1<<(n-1))) != 0` — see lever (2) below.
 *  - 021ab74c frame-retarget SETTER — see lever (1) below (branch-to-shared-return).
 *  - 021ad6bc per-frame STEP + `&&`-return — see lever (3) below (orr operand order).
 *
 * Reshape levers re-proven / refined this wave:
 *  (1) BRANCH-TO-SHARED-RETURN (021ab74c, re-proven from ov003 021cce58): a guard
 *      `if (cond) return K; <work>; return K;` (same K both sides) emits an INLINE
 *      conditional return (moveq/ldmeqia); rewrite as `if (!cond) { <work> } return
 *      K;` (guard skips the work, single trailing return) to get the orig's branch.
 *  (2) `&` OPERAND ORDER picks the tst register (021ad1bc): `mask & (1<<s)` put the
 *      mask in the wrong reg; `(1<<s) & mask` flipped it to 100%.
 *  (3) SHIFTED-OPERAND-FIRST for an `orr` dest reuse (021ad6bc, NEW): `A | (B<<k)`
 *      made mwcc reuse B's reg as the destination; writing `(B<<k) | A` makes it
 *      reuse A's reg (matching the orig `orr Rd, RA, RB lsl#k` with Rd==RA).
 *
 * DEFERRED (attempted, register-allocation coin-flips -> Mac lane):
 *  - 021ac458 (66%) point-in-rect `&&`-chain: the `&&`-return fixed the branch
 *    structure but the per-pair cmp ties register AND operand order to source —
 *    field<=coord gives right cmp/wrong regs, coord>=field gives right regs/wrong
 *    cmp; can't get both (caller-saved coin-flip).
 *  - 021ab910 (60%) display state machine: switch discriminant lands in r0 not r1,
 *    rotating the whole body (incl. the dual-engine 0x4000000/+0x1000 MMIO block);
 *    declaration-order did NOT move it (discriminant coin-flip, = ov003 021cbe8c).
 *  - 021ad7d4 (72%) blx dispatch: the clean-tail idiom `if(cb){if(cb())…;return 0;}
 *    return 1;` fixed the no-handler tail (45->72), but the post-blx increment block
 *    rotates registers (orig reuses the dead r0 blx-result reg for the ptr) —
 *    permuter-class post-blx allocation.
 *  - 021aa59c (73%) BGxCNT field reset: structure matches but the orig parks the
 *    extracted field in the r12 scratch while mine packs it into r2 (register-use
 *    difference; operand-swap + temp-bind both tried). */

#endif /* OV009_CORE_H */
