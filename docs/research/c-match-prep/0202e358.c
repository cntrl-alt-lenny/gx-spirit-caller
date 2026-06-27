/* CAMPAIGN-PREP candidate for func_0202e358 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sparse membership switch returning 0/1; let mwcc rebuild binary-search tree
 *   risk:       mwcc must re-derive the exact pivot tree (0x12be,0x1561) + fold 0x1564..0x1566 run to addls table with 0x1563 hole; compiler-internal, not C-reshapeable if it diverges (permuter-class -> escape to .s)
 *   confidence: med
 */
/* func_0202e358: sparse membership test on r0 (an int "id"), returns 1 if in the
 * set, else 0. mwcc lowers it to a binary-search range tree (pivots 0x12be then
 * 0x1561; the consecutive 0x1563..0x1566 tail folds to a cmp #3 + addls jump
 * table). Member set decoded from the asm compare tree.
 *   {0x1123, 0x127d,0x127e,0x127f, 0x12a5, 0x12be, 0x154a, 0x1561,0x1562,
 *    0x1564,0x1565,0x1566}  (note 0x1563 is a HOLE inside the tail run). */
int func_0202e358(int id) {
    switch (id) {
    case 0x1123:
    case 0x127d:
    case 0x127e:
    case 0x127f:
    case 0x12a5:
    case 0x12be:
    case 0x154a:
    case 0x1561:
    case 0x1562:
    case 0x1564:
    case 0x1565:
    case 0x1566:
        return 1;
    default:
        return 0;
    }
}
