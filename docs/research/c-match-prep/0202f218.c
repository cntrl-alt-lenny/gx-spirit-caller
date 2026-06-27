/* CAMPAIGN-PREP candidate for func_0202f218 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class-D switch->membership, sparse cmp-tree; ascending cases
 *   risk:       Widely-spread cases force a multi-pool cmp-tree; risk is which constants mwcc loads as ldr pivots vs derives via +offset (0x182a..2c, 0x183f), and tree balance. permuter-class (switch tree/pool choice).
 *   confidence: med
 */
/* func_0202f218: card-id membership test (switch -> 1, default 0).
 * Sparse binary-search tree (no jump-table) with several distinct loaded
 * literals (0x1477,0x1128,0xfe5,0x1246,0x182a) as tree pivots, plus the
 * 0x181f / 0x182a..0x182c / 0x183f cluster derived via +offset. */
int func_0202f218(int a0) {
    switch (a0) {
    case 0xfe4:
    case 0xfe5:
    case 0x1128:
    case 0x1246:
    case 0x1477:
    case 0x181f:
    case 0x182a:
    case 0x182b:
    case 0x182c:
    case 0x183f:
        return 1;
    }
    return 0;
}
