/* CAMPAIGN-PREP candidate for func_02090868 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clz scan 2 words; 0x40/0x60 if-tail; clear top free bit, bic store-order
 *   risk:       asm advances base ptr (add r3,#4) then reuses [r3] for the final load/bic/store; if mwcc reloads data_027fffb0[1] vs the held r3, an extra ldr diverges. reshape-able (single bound pointer p reused). clz idiom is mwcc-version-specific.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02090868 (main, class D, MED tier) — EUR .s front-load.
 * UNVERIFIED + ITERATION-EXPECTED: class-D rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, applies the risk note if <100%.
 *   recipe:     clz bit-scan over a 64-bit free-bitmap word pair; base 0x40/0x60 if-tail; clear highest free bit via (0x80000000>>n) bic; store in asm order
 *   risk:       see header field below
 * func_02090868: allocate from a 2-word (64-bit) free-bitmap at data_027fffb0.
 *   w0 = bitmap[0]; n = clz(w0);            // count leading ZEROS
 *   if (n != 0x20) { r = 0x40; }            // free bit in word0
 *   else { w1 = bitmap[1]; n = clz(w1);
 *          if (n == 0x20) return -3;        // both words full
 *          r = 0x60; word = &bitmap[1]; }
 *   r += n;
 *   *word &= ~(0x80000000u >> n);           // claim that bit
 *   return r;
 * mwcc CLZ intrinsic spelled __builtin_clz (front-load reviewer swaps to project spelling).
 */

extern int __builtin_clz(unsigned int x);

extern unsigned int data_027fffb0[2];

int func_02090868(void) {
    unsigned int *p = data_027fffb0;
    unsigned int n;
    int r;

    n = (unsigned int)__builtin_clz(p[0]);
    if (n != 0x20) {
        r = 0x40;
    } else {
        p = &data_027fffb0[1];
        n = (unsigned int)__builtin_clz(p[0]);
        if (n == 0x20)
            return -3;
        r = 0x60;
    }
    r += n;
    p[0] &= ~(0x80000000u >> n);
    return r;
}
