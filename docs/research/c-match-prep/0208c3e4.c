/* CAMPAIGN-PREP candidate for func_0208c3e4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: (s64) dot a[1]+a[0]+a[2], +0x800 round, >>12; smull/smlal accumulate
 *   risk:       the +0x800 round must apply to the 64-bit sum before >>12 (asm: adds r0,#0x800; adc r1,#0; lsr#0xc; orr lsl#0x14). Order [1],[0],[2] is load-driven. reshape-able if accumulation order flips.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0208c3e4 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. recipe: D, fixed-point dot product with
 * round-to-nearest. dot = a.x*b.x + a.y*b.y + a.z*b.z accumulated in signed
 * 64-bit (smull + 2 smlal), eval order [1],[0],[2]; add 0x800 (round half),
 * then >>12. func(a=r0, b=r1) -> int.
 */

int func_0208c3e4(int *a, int *b)
{
    long long dot = (long long)a[1] * b[1] + (long long)a[0] * b[0] + (long long)a[2] * b[2];
    return (int)((dot + 0x800) >> 12);
}
