/* CAMPAIGN-PREP candidate for func_020a3ed8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: keep (x+k)<<2 unfolded; signed compare result (movlt/movge); mla operand order
 *   risk:       reshape-able: mwcc may constant-fold ((b+0x20)<<2)+0x70 into (b<<2)+0xf0 (orig kept add #0x20;lsl;add #0x70). If folded, reorder/parenthesize to force the inner add.
 *   confidence: med
 */
/* func_020a3ed8: two unsigned range gates then a linear index < bound (class D).
 * valid a in [0xe4,0x1fe], b in [8,0x10]; else return 0.
 * keep (b+0x20)<<2 and (a+0x26)<<2 un-folded (orig did not fold the +k). */
int func_020a3ed8(unsigned int a, unsigned int b, int c) {
    int mult;
    int base;

    if (a > 0x1fe || a < 0xe4)
        return 0;
    if (b > 0x10 || b < 0x8)
        return 0;

    mult = (int)(((b + 0x20) << 2) + 0x70);
    base = 0x14a + (int)((a + 0x26) << 2);
    return (c * mult + base) < 0x15e0;
}
