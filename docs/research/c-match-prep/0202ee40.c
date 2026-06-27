/* CAMPAIGN-PREP candidate for func_0202ee40 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class-D switch->membership; ascending cases drive ls jump-table + cmp-tree
 *   risk:       orig uses an ls (unsigned, cmp r1,#8) bounded 9-entry table for 0x166a-72; mwcc must emit the same window width/bound. If it instead chains compares the table vanishes. permuter-class (switch lowering).
 *   confidence: med
 */
/* func_0202ee40: card-id membership test (switch -> 1, default 0).
 * Binary-search tree around pivot 0x16b4 with a 9-entry ls jump-table
 * for the 0x166a..0x1672 window (true at 0x166a,0x1670,0x1671,0x1672)
 * and lit-base +offset derivations for the scattered upper cases. */
int func_0202ee40(int a0) {
    switch (a0) {
    case 0x166a:
    case 0x1670:
    case 0x1671:
    case 0x1672:
    case 0x1681:
    case 0x16b3:
    case 0x16b4:
    case 0x16cf:
    case 0x17ee:
    case 0x1945:
    case 0x1946:
        return 1;
    }
    return 0;
}
