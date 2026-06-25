/* CAMPAIGN-PREP candidate for func_021f40f4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch over sparse u16 ids -> mwcc binary compare-tree returning small consts
 *   risk:       the orig is a hand-balanced compare tree using anchor-relative immediates (sub r1,#2 / sub r1,#0x70 / sub #0x85 / add #0x23) to fold near-by cases; mwcc's switch will pick its own pivots/immediates and very likely emit a differently shaped tree. permuter-class (compare-tree shape is not C-steerable)
 *   confidence: low
 */
/* func_ov002_021f40f4: classify a u16 id at [arg0] against a sparse set of
 * card-id constants, returning 1, 2, or 0. mwcc builds the compare tree. */
typedef unsigned short u16;

int func_ov002_021f40f4(u16 *p) {
    switch (*p) {
    case 0x14ea: return 2;
    case 0x15f1: return 1;
    case 0x165f: return 1;
    case 0x1661: return 1;
    case 0x1907: return 2;
    case 0x198c: return 1;
    case 0x19af: return 2;
    default:     return 0;
    }
}
