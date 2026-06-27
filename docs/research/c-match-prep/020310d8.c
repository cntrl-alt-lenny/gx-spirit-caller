/* CAMPAIGN-PREP candidate for func_020310d8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class-D multi-return switch; cases grouped by return, source-ascending order
 *   risk:       struct-guessed: batch JSON truncated the body+pool; case values reconstructed from on-disk src/main/func_020310d8.s (_LIT0=0x1695,_LIT1=0x128e,_LIT2=0x1817) -- confirm that .s is the EUR target. Also jump-table stores distinct consts; tail order must match. permuter-class on tree shape.
 *   confidence: low
 */
/* func_020310d8: card-id -> small enum switch (returns 1, 3, 5, 0xff;
 * default 0).  NOTE: the batch JSON truncated this function's body and
 * literal pool; case values reconstructed from the on-disk .s pool
 * (_LIT0=0x1695, _LIT1=0x128e, _LIT2=0x1817) via full ARM simulation.
 * mwcc lowers it to a binary-search tree over pivot 0x1695 plus an
 * 11-entry pl jump-table for the 0x1610..0x161a window. Case order below
 * is source-ascending so the tree pivots / table direction reproduce. */
int func_020310d8(int a0) {
    switch (a0) {
    case 0x128e:
        return 1;
    case 0x1610:
    case 0x1611:
        return 3;
    case 0x1615:
        return 0xff;
    case 0x1617:
        return 1;
    case 0x161a:
        return 3;
    case 0x1624:
        return 0xff;
    case 0x1695:
        return 0xff;
    case 0x16de:
        return 0xff;
    case 0x1817:
        return 5;
    case 0x186a:
        return 0xff;
    case 0x1983:
        return 0xff;
    }
    return 0;
}
