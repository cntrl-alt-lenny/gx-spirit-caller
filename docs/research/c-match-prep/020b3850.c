/* CAMPAIGN-PREP candidate for func_020b3850 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     divmod-class: plain `unsigned long long` multiply -> umull+mla+mla
 *   risk:       reshape-able (or intrinsic): mla operand order is a.lo*b.hi then b.lo*a.hi; if mwcc inlines the other commutation or calls __mul64 instead, swap arg order / try `long long`. May ship as .s if mwcc routes to a helper.
 *   confidence: med
 */
/* func_020b3850: 64-bit unsigned multiply, low 64 bits.
 *   umull r5,r4,r0,r2   ; a.lo*b.lo -> r4:r5
 *   mla   r4,r0,r3,r4   ; += a.lo*b.hi
 *   mla   r4,r2,r1,r4   ; += b.lo*a.hi
 *   return {r0=r5(lo), r1=r4(hi)}
 * (r1:r0) and (r3:r2) are the two 64-bit args; result is their product
 * truncated to 64 bits. This is the mwcc __mul64 long-long-multiply pattern. */
unsigned long long func_020b3850(unsigned long long a, unsigned long long b) {
    return a * b;
}
