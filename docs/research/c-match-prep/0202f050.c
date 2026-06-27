/* CAMPAIGN-PREP candidate for func_0202f050 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class-D switch->membership, pure cmp-tree; cases source-ascending
 *   risk:       Pure binary-search tree (no table): the exact pivot picks and add/sub-from-base offset derivations (e.g. add r2,#1/#2 for 0x1ab9..abc) must match mwcc's tree balancer. permuter-class (tree shape, no C reshape).
 *   confidence: med
 */
/* func_0202f050: card-id membership test (switch -> 1, default 0).
 * Larger binary-search tree (no jump-table) over pivot 0x1ab9 with
 * lit-base +offset derivations; small contiguous runs at 0x18ab..0x18ad,
 * 0x1ab9..0x1abc and the 0x1b14/0x1b15/0x1b17 cluster. */
int func_0202f050(int a0) {
    switch (a0) {
    case 0x18ab:
    case 0x18ac:
    case 0x18ad:
    case 0x19aa:
    case 0x19ad:
    case 0x19ae:
    case 0x19b2:
    case 0x19bb:
    case 0x1ab9:
    case 0x1aba:
    case 0x1abb:
    case 0x1abc:
    case 0x1b14:
    case 0x1b15:
    case 0x1b17:
        return 1;
    }
    return 0;
}
