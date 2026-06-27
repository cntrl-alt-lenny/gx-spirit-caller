/* CAMPAIGN-PREP candidate for func_0202ed04 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sparse membership switch->0/1; binary-search tree with addne/cmpne triple
 *   risk:       7 members in two adjacent clusters (0x1a6d-6f via addne/cmpne chain, 0x1b4c-4e); mwcc must pick same pivots+equality-chain lowering — compiler-internal tree shape (permuter-class)
 *   confidence: med
 */
/* func_0202ed04: sparse membership test on r0, returns 0/1. mwcc lowers to a
 * binary-search compare tree (pivots 0x1b4c, 0x19fd; the 0x1a6d..0x1a6f triple
 * via an addne/cmpne equality chain). Member set decoded:
 *   {0x19fd, 0x1a6d,0x1a6e,0x1a6f, 0x1b4c,0x1b4d,0x1b4e}. */
int func_0202ed04(int id) {
    switch (id) {
    case 0x19fd:
    case 0x1a6d:
    case 0x1a6e:
    case 0x1a6f:
    case 0x1b4c:
    case 0x1b4d:
    case 0x1b4e:
        return 1;
    default:
        return 0;
    }
}
