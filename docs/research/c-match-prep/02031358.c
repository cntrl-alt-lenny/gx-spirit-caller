/* CAMPAIGN-PREP candidate for func_02031358 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: switch incl. dense run 0x10f9-0x1100 -> mwcc re-emits jump-table
 *   risk:       mwcc's density threshold decides jump-table vs tree for the 0x10f9-0x1100 run; if it picks a different cut the 10-slot table diverges. struct-guessed-free but jump-table cut is permuter-class.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02031358 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Membership predicate; mwcc split it
 * into a compare-tree PLUS one embedded 10-slot jump-table
 * (`subs r1,r0,#0x10f8; addpl pc,pc,r1,lsl#2`) for the DENSE consecutive
 * run 0x10f9..0x1100. The dense run MUST stay contiguous in the case list
 * so mwcc re-derives the jump-table; sparse values stay as the tree.
 * Set recovered by ARM emulation + hand-decode of the pc-relative table
 * (base 0x12f0; 20 values total, 8 of them the dense run).
 *   recipe:     CLASS D: switch over exact case-set incl. dense run; in->1.
 */
int func_02031358(int x) {
    switch (x) {
    case 0x10f9:
    case 0x10fa:
    case 0x10fb:
    case 0x10fc:
    case 0x10fd:
    case 0x10fe:
    case 0x10ff:
    case 0x1100:
    case 0x12cc:
    case 0x12ce:
    case 0x12e8:
    case 0x12e9:
    case 0x12ec:
    case 0x12f0:
    case 0x12fa:
    case 0x1307:
    case 0x1324:
    case 0x1325:
    case 0x132b:
    case 0x1804:
        return 1;
    default:
        return 0;
    }
}
