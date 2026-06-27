/* CAMPAIGN-PREP candidate for func_0202e6f4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sparse membership switch->0/1; all-points binary-search compare tree
 *   risk:       9 sparse points; mwcc must reproduce the exact pivot ordering (0x1656 then 0x1531) and adjacent-pair equality folds (0x143f/0x1440, 0x1685/0x1686) — compiler-internal tree shape (permuter-class)
 *   confidence: med
 */
/* func_0202e6f4: sparse membership test on r0, returns 0/1. mwcc lowers to a
 * binary-search compare tree (pivots 0x1656, 0x1531). All members are isolated
 * points / tiny adjacent pairs (no jump-table run). Member set decoded:
 *   {0x143f,0x1440, 0x1531, 0x161e, 0x1656, 0x1685,0x1686, 0x169e, 0x16a3}. */
int func_0202e6f4(int id) {
    switch (id) {
    case 0x143f:
    case 0x1440:
    case 0x1531:
    case 0x161e:
    case 0x1656:
    case 0x1685:
    case 0x1686:
    case 0x169e:
    case 0x16a3:
        return 1;
    default:
        return 0;
    }
}
