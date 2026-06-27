/* CAMPAIGN-PREP candidate for func_0208b1e0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: 9 unrolled (s64)in[i]*scale>>12; 3 scale groups r2/r3/5th-arg
 *   risk:       5th arg (s2) must land via [sp,#8] not a 5th reg; mwcc's >>12 is smull;lsr#0xc;orr lsl#0x14 - solid. permuter-class only if scratch reg rotation (lr/r4) reorders. reshape-able.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0208b1e0 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. recipe: D divmod (fixed-point >>12 via
 * (s64)x*s) over 9 unrolled elements; 3 scale groups (r2/r3/[sp+8]).
 * func(in=r0, out=r1, s0=r2, s1=r3, s2=5th-arg). out[i]=(int)(((s64)in[i]*s)>>12).
 * Elems 0..2 use s0, 3..5 use s1, 6..8 use s2. Likely a 3x3 / 3-vec3 scale.
 */

void func_0208b1e0(int *in, int *out, int s0, int s1, int s2)
{
    out[0] = (int)(((long long)in[0] * s0) >> 12);
    out[1] = (int)(((long long)in[1] * s0) >> 12);
    out[2] = (int)(((long long)in[2] * s0) >> 12);
    out[3] = (int)(((long long)in[3] * s1) >> 12);
    out[4] = (int)(((long long)in[4] * s1) >> 12);
    out[5] = (int)(((long long)in[5] * s1) >> 12);
    out[6] = (int)(((long long)in[6] * s2) >> 12);
    out[7] = (int)(((long long)in[7] * s2) >> 12);
    out[8] = (int)(((long long)in[8] * s2) >> 12);
}
