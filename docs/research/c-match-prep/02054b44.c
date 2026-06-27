/* CAMPAIGN-PREP candidate for func_02054b44 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hi16/lo16 split; decl hi,lo,ph,pl,x; unsigned> -> bichi/addhi
 *   risk:       reshape-able: the `x > 0x7fffffffU` reductions must stay unsigned to emit cmp #0x7fffffff;bichi;addhi — if mwcc substitutes a sign-bit test (cmp #0;movmi), keep the unsigned literal / mask. pl-first add operand order.
 *   confidence: med
 */
/* func_02054b44 (main, class D) — Park-Miller minstd step: seed*16807 mod 2^31-1,
 * via the hi16/lo16 split and the (x>0x7fffffff -> (x&0x7fffffff)+1) carry fold.
 *   ph = (seed>>16) * 16807;  pl = (seed & 0xffff) * 16807;
 *   x  = pl + ((ph & 0x7fff) << 16);  reduce;
 *   x += ph >> 15;                    reduce.
 * DIVMOD/CARRY recipe: the mod-(2^31-1) reduction as an unsigned '>' + bic/add.
 */

unsigned int func_02054b44(unsigned int seed) {
    unsigned int hi = seed >> 16;
    unsigned int lo = seed & 0xffff;
    unsigned int ph = hi * 16807;
    unsigned int pl = lo * 16807;
    unsigned int x  = pl + ((ph & 0x7fff) << 16);

    if (x > 0x7fffffffU) x = (x & 0x7fffffffU) + 1;
    x = x + (ph >> 15);
    if (x > 0x7fffffffU) x = (x & 0x7fffffffU) + 1;
    return x;
}
