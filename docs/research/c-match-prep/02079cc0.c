/* CAMPAIGN-PREP candidate for func_02079cc0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: decl i first; add=add+src[i] accumulator operand-order; movs carry=add>>16 then if-break; i++ before tail guard
 *   risk:       `add = add + src[i]` must keep carry as the first add operand (add r2,r2,ip) and `movs r2,r2,lsr#16` sets the branch flag. reshape-able via accumulator-first add + separate >>16 statement; main risk is index recompute scheduling. reshape-able.
 *   confidence: med
 */
/* func_02079cc0 — big-integer add-immediate with carry over u16 limbs:
 * dst[i] = src[i] + carry, carry = bits>>16, stop once carry clears;
 * then copy the untouched tail when dst != src. (add-carry twin of
 * func_02079b48's subtract-borrow.)
 */

void func_02079cc0(unsigned short *dst, unsigned short *src,
                   unsigned int add, int n) {
    int i = 0;
    if (n > 0) {
        do {
            add = add + src[i];
            dst[i] = (unsigned short)add;
            add = add >> 16;
            if (add == 0) goto tail;
            i++;
        } while (i < n);
    }
tail:
    if (dst == src) return;
    i++;
    if (i >= n) return;
    do {
        dst[i] = src[i];
        i++;
    } while (i < n);
}
