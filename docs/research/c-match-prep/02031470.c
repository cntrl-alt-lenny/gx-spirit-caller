/* CAMPAIGN-PREP candidate for func_02031470 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: switch over exact 15-value set; in-set->1 default->0
 *   risk:       tightly-packed runs 0x1a24/25 and 0x1b41-44 use `subne;cmpne;cmpne` equality chains; mwcc may instead emit a tiny jump-table or reorder pivots. tree-balance is permuter-class.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02031470 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Larger membership predicate; PURE
 * binary-search compare-tree (NO jump-table despite the triage note),
 * reusing two literal bases (0x168f as r3, plus per-subtree r2 pivots) via
 * sub/add #imm and `subne/cmpne` equality clusters for the
 * 0x1a24/0x1a25 and 0x1b41..0x1b44 runs. Exact 15-value set recovered by
 * ARM flag-emulation.
 *   recipe:     CLASS D: switch over exact case-set; in-set->1, default->0.
 */
int func_02031470(int x) {
    switch (x) {
    case 0xfe0:
    case 0xfee:
    case 0x114f:
    case 0x158a:
    case 0x1594:
    case 0x168f:
    case 0x1774:
    case 0x179c:
    case 0x1a24:
    case 0x1a25:
    case 0x1a60:
    case 0x1b41:
    case 0x1b42:
    case 0x1b43:
    case 0x1b44:
        return 1;
    default:
        return 0;
    }
}
