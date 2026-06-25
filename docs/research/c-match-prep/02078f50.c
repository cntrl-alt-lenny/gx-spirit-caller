/* CAMPAIGN-PREP candidate for func_02078f50 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: src=src+(count-1) before loop; ldrb hi first picks add operand-order; count>1 / count>0 if-assign tails
 *   risk:       Tail `cmp r5,#0; ldrgtb; strgth` is predicated, not branched. If mwcc lowers the final `if(count>0)` to a branch+store instead of ldrgtb/strgth, two ops diverge. reshape-able (keep as trailing if, no else).
 *   confidence: med
 */
/* func_02078f50 — zero-fill dst then copy `count` halfwords from the
 * END of a byte buffer, byte-swapping each pair into dst (big-endian
 * source -> little-endian halfword store). Trailing odd byte stored
 * as a lone high byte.
 */

extern void func_020945f4(void *dst, int val, int nbytes);

void func_02078f50(unsigned short *dst, unsigned char *src, int count, int n) {
    func_020945f4(dst, 0, n << 1);
    src = src + (count - 1);
    while (count > 1) {
        unsigned int hi = src[0];
        unsigned int lo = src[-1];
        count -= 2;
        *dst++ = (unsigned short)(hi + (lo << 8));
        src -= 2;
    }
    if (count > 0) {
        *(unsigned short *)dst = src[0];
    }
}
