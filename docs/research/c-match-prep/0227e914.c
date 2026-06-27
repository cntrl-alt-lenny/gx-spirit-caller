/* CAMPAIGN-PREP candidate for func_0227e914 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch returns constants; dense run->addpl jump-table; sparse->compare probes; signed
 *   risk:       mwcc must split the same way — jump-table for 0x18a6-0x18a9 (sub#0xa7 base, addpl), compare-BST for the 4 outliers around pivot 0x194d; a different table boundary diverges. reshape-able
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0227e914 (ov002, class D, MED tier) — brief 0080.
 * UNVERIFIED + ITERATION-EXPECTED. Literals known (0x194d/0x18f9); dense run 0x18a6..0x18a9.
 *   recipe:     switch returning small constants; dense run -> addpl-jumptable, sparse -> compare probes; signed
 *   confidence: med
 */
/* func_ov002_0227e914 (cls D) — switch(a): 0x18a6..0x18a9 -> 1..4 (jump table);
 * 0x18f9->5; 0x194d->6; 0x194e->7; 0x197f->8; default 0. Signed (bgt/bge),
 * pivot 0x194d, contiguous cluster compiled via `addpl pc,pc,r,lsl#2`. */

int func_ov002_0227e914(int a) {
    switch (a) {
    case 0x18a6: return 1;
    case 0x18a7: return 2;
    case 0x18a8: return 3;
    case 0x18a9: return 4;
    case 0x18f9: return 5;
    case 0x194d: return 6;
    case 0x194e: return 7;
    case 0x197f: return 8;
    }
    return 0;
}
