/* CAMPAIGN-PREP candidate for func_02031208 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: switch over exact 8-value set; in-set->1 default->0
 *   risk:       mwcc may pick a different pivot/balance for the search tree than orig (base=0x1695, sub-imm clusters). reshape-able only by matching case-set; if shape still differs it is permuter-class (switch heuristic).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02031208 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Membership predicate over a sparse
 * integer set; mwcc lowered the ORIGINAL `switch` into a balanced
 * binary-search compare-tree that reuses one literal base (0x1695) via
 * `sub r1,base,#imm`. Feeding the EXACT case set back as a switch is the
 * lever that regenerates that tree.
 *   recipe:     CLASS D: switch over exact case-set; in-set->1, default->0.
 *   set decoded by full ARM flag-emulation of the compare-tree (8 values).
 */
int func_02031208(int x) {
    switch (x) {
    case 0x1610:
    case 0x1611:
    case 0x1615:
    case 0x161a:
    case 0x1695:
    case 0x16de:
    case 0x186a:
    case 0x1983:
        return 1;
    default:
        return 0;
    }
}
