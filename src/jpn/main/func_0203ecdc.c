/* CAMPAIGN-PREP candidate for func_0203ecdc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     explicit do-while shift loop (i pre-inc, cmp i,k); manual rev via shift+and+orr
 *   risk:       reshape-able-ish: the 4 orr/and terms must schedule into the asm's r1/r0/r2/r3 order; operand-order of the final orr chain (orr r0,r2,r0 then orr r0,r1,r0) may differ -> reorder the | terms. Could still be a scheduling coin-flip (permuter-class).
 *   confidence: med
 */
/* func_0203ecdc — build mask (~0u << (32-n)) by a shift loop, then byteswap it.
 * Class D: loop-built shift + 4-byte reverse (and/orr assembly).
 * Leaf, no struct. arg r0 = n (1..32). */
unsigned func_0203ecdc(int n) {
    int k = 0x20 - n;
    unsigned mask = ~0u;
    int i = 0;
    if (k > 0) {
        do { i++; mask <<= 1; } while (i < k);
    }
    /* byteswap mask: rev32 via shift+mask+orr in this exact lane order */
    return ((mask >> 24) & 0xff)
         | ((mask >> 8)  & 0xff00)
         | ((mask << 8)  & 0xff0000)
         | ((mask << 24) & 0xff000000u);
}
