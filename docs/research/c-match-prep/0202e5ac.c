/* CAMPAIGN-PREP candidate for func_0202e5ac (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sparse membership switch->0/1; one isolated point + one addls run
 *   risk:       decode is clean (one point 0x131d + run 0x1586..0x158d); risk is mwcc choosing same single pivot+jump-table split vs a different decomposition — compiler-internal (permuter-class)
 *   confidence: med
 */
/* func_0202e5ac: sparse membership test on r0, returns 0/1. mwcc lowers to a
 * pivot compare at 0x131d then a cmp #8 + addls jump table over the consecutive
 * run 0x1586..0x158d (0x1585 is a HOLE). Member set:
 *   {0x131d, 0x1586,0x1587,0x1588,0x1589,0x158a,0x158b,0x158c,0x158d}. */
int func_0202e5ac(int id) {
    switch (id) {
    case 0x131d:
    case 0x1586:
    case 0x1587:
    case 0x1588:
    case 0x1589:
    case 0x158a:
    case 0x158b:
    case 0x158c:
    case 0x158d:
        return 1;
    default:
        return 0;
    }
}
