/* CAMPAIGN-PREP candidate for func_021b2490 (ov015, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     declare span(f56-f4e) first; signed-divmod by name; if-assign early returns; phase tested ==0
 *   risk:       ov015 catalogues this at 61% — the `phase` param (movs r2,r1 parks it in r2 while testing ==0) lands in the wrong register vs orig; decl-order/operand-swap did not move it. permuter-class (register coin-flip on the phase param; campaign runs permuter or ships .s).
 *   confidence: low
 */
/* func_ov015_021b2490 (ov015, class C): early-return clamps + mul/div; decl-order.
 * func_020b3870 is the SIGNED DIVMOD runtime (quotient r0) — call by name, NOT '/'.
 * The diff `span = f56 - f4e` is computed up front (r3) and reused as the clamp
 * store AND a mul operand, so declare it FIRST. The `phase` param (r1) is tested
 * ==0 via `movs r2,r1` (also parks it in r2). Fields are signed 16-bit (ldrsh). */

extern int func_020b3870(int a, int b);

void func_ov015_021b2490(char *o, int phase) {
    int span = *(short *)(o + 0x56) - *(short *)(o + 0x4e);
    int lo, hi, w;

    *(int *)(o + 0x64) = phase;
    if (phase == 0) {
        *(int *)(o + 0xc) = 0;
        return;
    }

    hi = *(int *)(o + 0x60);
    lo = *(int *)(o + 0x5c);
    if (lo == hi) {
        *(int *)(o + 0xc) = 0;
        return;
    }

    w = (lo - hi) << 1;
    if (phase >= w) {
        *(int *)(o + 0xc) = span;
        return;
    }

    *(int *)(o + 0xc) = func_020b3870(span * phase, w);
}
