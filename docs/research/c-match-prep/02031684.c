/* CAMPAIGN-PREP candidate for func_02031684 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: switch in-set->0 default->1 (INVERTED polarity); exact 12-set
 *   risk:       polarity is flipped (member->0); if campaign assumes member->1 the two return-blocks invert. Otherwise tree-balance/pivot choice is the residual, permuter-class.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02031684 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Membership predicate with INVERTED
 * polarity: the case-set returns 0, the default returns 1 (.L_1140 is
 * `mov r0,#0`, .L_1148 is `mov r0,#1`). Same mwcc binary-search
 * compare-tree (base 0x18fd as r2, plus 0x14c7/0x1a53 sub-pivots,
 * `subne;cmpne` cluster for 0x18fb..0x18fd). Exact 12-value set recovered
 * by ARM flag-emulation (the SMALLER side = the case-set).
 *   recipe:     CLASS D: switch; in-set->0, default->1 (polarity flipped).
 */
int func_02031684(int x) {
    switch (x) {
    case 0x14b6:
    case 0x14c7:
    case 0x14da:
    case 0x157e:
    case 0x18fb:
    case 0x18fc:
    case 0x18fd:
    case 0x1936:
    case 0x1955:
    case 0x19d6:
    case 0x1a53:
    case 0x1ac8:
        return 0;
    default:
        return 1;
    }
}
