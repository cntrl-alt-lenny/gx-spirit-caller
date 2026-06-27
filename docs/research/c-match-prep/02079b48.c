/* CAMPAIGN-PREP candidate for func_02079b48 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: decl i first; borrow=(t>>16)&1; if-break via goto for the beq; i++ before tail-copy guard mirrors asm
 *   risk:       The post-break `i++; if(i>=n)` before the copy loop and the `dst==src` early-out ordering. reshape-able by exact statement order, but mwcc may hoist the i<<1 index recompute (mov lr/ip) differently. reshape-able.
 *   confidence: med
 */
/* func_02079b48 — big-integer subtract-immediate with borrow over a
 * u16 limb array: dst[i] = src[i] - borrow, borrow = bit16, stop once
 * borrow clears; then copy the untouched tail when dst != src.
 */

void func_02079b48(unsigned short *dst, unsigned short *src,
                   unsigned int sub, int n) {
    int i = 0;
    if (n > 0) {
        do {
            unsigned int t = src[i] - sub;
            sub = (t >> 16) & 1;
            dst[i] = (unsigned short)t;
            if (sub == 0) goto tail;
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
