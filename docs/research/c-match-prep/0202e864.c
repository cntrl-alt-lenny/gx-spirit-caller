/* CAMPAIGN-PREP candidate for func_0202e864 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sparse membership switch->0/1; small binary-search compare tree
 *   risk:       6 sparse members; risk is mwcc reproducing the subne/cmpne adjacent-pair chain for 0x16b8/0x16b9 and the same pivot order — compiler-internal (permuter-class if it diverges)
 *   confidence: med
 */
/* func_0202e864: sparse membership test on r0, returns 0/1. mwcc lowers to a
 * binary-search compare tree (pivots 0x1754, 0x117b). Member set decoded:
 *   {0x117b, 0x16b8,0x16b9, 0x1754, 0x17df, 0x18be}. */
int func_0202e864(int id) {
    switch (id) {
    case 0x117b:
    case 0x16b8:
    case 0x16b9:
    case 0x1754:
    case 0x17df:
    case 0x18be:
        return 1;
    default:
        return 0;
    }
}
