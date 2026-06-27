/* CAMPAIGN-PREP candidate for func_022814f0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch-returning-constant: exact 9 case set, default 0; mwcc rebuilds the compare-tree
 *   risk:       compare-tree pivot/shape (esp. the 0x1281/0x1284 adjacent fork via sub#0x8c/#0x8f) may diverge from mwcc's median split; orig ships as .s. permuter-class
 *   confidence: low
 */
/* func_ov002_022814f0 (ov002, cls C) — sparse-value membership predicate.
 * Returns 1 iff arg0 is one of 9 discrete ids, else 0. Orig is mwcc's
 * signed compare-tree for a switch over these exact case values. */
int func_ov002_022814f0(int arg0) {
    switch (arg0) {
    case 0x10a6: case 0x1281: case 0x1284: case 0x129a: case 0x1310:
    case 0x14a4: case 0x1639: case 0x1657: case 0x172c:
        return 1;
    default:
        return 0;
    }
}
