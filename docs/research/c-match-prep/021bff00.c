/* CAMPAIGN-PREP candidate for func_021bff00 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     do-while j<=4; addne accumulate; 5th arg on stack, 1-arg0 via rsb held in reg
 *   risk:       count(r6) and j(r5) interleave with addne r6 after the j++ in asm (cmp r0,#0; add r5; addne r6) — a plain if(...)count++ may schedule the increments oppositely. reshape-able (do-while w/ post-increment), else permuter-class on the add/addne order.
 *   confidence: med
 */
/* func_ov002_021bff00: loop j=0..4 calling 021bf294(arg0,arg1,1-arg0,j,1),
 * counting nonzero results; return the count. */

extern int func_ov002_021bf294(int a, int b, int c, int d, int e);

int func_ov002_021bff00(int arg0, int arg1) {
    int count = 0;
    int j = 0;
    do {
        if (func_ov002_021bf294(arg0, arg1, 1 - arg0, j, 1) != 0)
            count++;
        j++;
    } while (j <= 4);
    return count;
}
