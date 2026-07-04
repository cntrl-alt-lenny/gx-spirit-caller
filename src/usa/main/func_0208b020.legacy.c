/* CAMPAIGN-PREP candidate for func_0208b020 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: smull+lsr12|lsl20 => (int)((s64)mult*x>>12); runtime mult, explicit 64-bit
 *   risk:       reshape-able: the >>12 of a 64-bit product is exactly smull;lsr#0xc;orr lsl#0x14. Risk is operand order in smull (mult,x vs x,mult) and whether mwcc reuses out-ptr writes in [0,4,8,c] order; both follow source.
 *   confidence: med
 */
/* func_0208b020 (main, class D): 4-lane Q20.12 fixed-point multiply.
 * For each of 4 ints at [r0+0,4,8,c], compute (s64)mult * x >> 12 and
 * store to [r1+...]. First two lanes use mult=r2 (arg2), last two r3.
 *   smull lo,hi,mult,x ; lo>>12 | hi<<20  => (int)(((s64)mult*x)>>12).
 * NOT a constant divide — mult is a runtime arg, so write the explicit
 * 64-bit shift, do not let it fold to a `/`. */
void func_0208b020(int *in, int *out, int m01, int m23) {
    out[0] = (int)(((long long)m01 * in[0]) >> 12);
    out[1] = (int)(((long long)m01 * in[1]) >> 12);
    out[2] = (int)(((long long)m23 * in[2]) >> 12);
    out[3] = (int)(((long long)m23 * in[3]) >> 12);
}
