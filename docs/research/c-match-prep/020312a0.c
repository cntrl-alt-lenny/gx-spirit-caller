/* CAMPAIGN-PREP candidate for func_020312a0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: switch over exact 9-value set; in-set->1 default->0
 *   risk:       orig has TWO separate `mov r0,#1;bx lr` tails (.L_d2c/.L_d34); a single `return 1` may fold to ONE tail. tail-duplication is mwcc-internal, permuter-class if it diverges.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020312a0 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Membership predicate; mwcc switch
 * lowering -> binary-search compare-tree with two distinct `mov r0,#1`
 * return blocks (.L_d2c and .L_d34) that the compiler emitted as two
 * separate tails. Exact case-set recovered by ARM flag-emulation (9 vals).
 *   recipe:     CLASS D: switch over exact case-set; in-set->1, default->0.
 */
int func_020312a0(int x) {
    switch (x) {
    case 0x16fe:
    case 0x1837:
    case 0x18f8:
    case 0x1913:
    case 0x1962:
    case 0x19b2:
    case 0x19bf:
    case 0x1a0c:
    case 0x1a8d:
        return 1;
    default:
        return 0;
    }
}
