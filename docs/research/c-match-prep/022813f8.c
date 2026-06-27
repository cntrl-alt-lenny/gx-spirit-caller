/* CAMPAIGN-PREP candidate for func_022813f8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch-returning-constant: exact 13 case set, default 0; let mwcc rebuild the compare-tree
 *   risk:       mwcc's switch-tree pivot choice/shape may not reproduce orig's exact cmp/bgt/bge ladder (orig ships as .s). If tree shape differs no C reshape fixes it. permuter-class
 *   confidence: low
 */
/* func_ov002_022813f8 (ov002, cls C) — sparse-value membership predicate.
 * Returns 1 iff arg0 is one of 13 discrete ids, else 0. The orig is mwcc's
 * balanced signed compare-tree for a switch with these exact case values. */
int func_ov002_022813f8(int arg0) {
    switch (arg0) {
    case 0x12ac: case 0x1437: case 0x1441: case 0x147c: case 0x14ac:
    case 0x1596: case 0x1598: case 0x1645: case 0x1770: case 0x1855:
    case 0x19ff: case 0x1a00: case 0x1aad:
        return 1;
    default:
        return 0;
    }
}
