/* CAMPAIGN-PREP candidate for func_0202ed90 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class-D switch->membership; cases source-ascending so tree+jump-table reproduce
 *   risk:       Pivot/tree-balance: mwcc must split the 0x1a02-05 run into the pl jump-table and pick 0x1a61 as root; if it balances differently the cmp-tree diverges. permuter-class (switch shape, not reshape-able).
 *   confidence: med
 */
/* func_0202ed90: card-id membership test (switch -> 1, default 0).
 * mwcc lowers this sparse switch into a binary-search compare tree
 * (cmp/bgt/bge) plus a 4-entry pl jump-table for the 0x1a02..0x1a05 run
 * and lit-base +offset derivations around pivot 0x1a61. */
int func_0202ed90(int a0) {
    switch (a0) {
    case 0x1a02:
    case 0x1a03:
    case 0x1a04:
    case 0x1a05:
    case 0x1a60:
    case 0x1a61:
    case 0x1a62:
    case 0x1a63:
    case 0x1a64:
    case 0x1a65:
    case 0x1b25:
        return 1;
    }
    return 0;
}
