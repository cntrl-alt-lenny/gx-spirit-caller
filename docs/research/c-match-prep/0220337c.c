/* CAMPAIGN-PREP candidate for func_0220337c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     plain double for-loop; count declared first -> high saved reg; >1 value-map
 *   risk:       Reg rotation of count/i/j over r7/r5/r6: orig gives the accumulator the highest saved reg (r7) and also keeps a 4th reg (r4) holding the inner-init 0. If mwcc assigns count=r4 or drops the held zero, the prologue regset/mov chain diverges. reshape-able (decl-order: try count first vs last to flip the saved-reg ordering).
 *   confidence: med
 */
/* func_ov002_0220337c (cls C): nested counted loop accumulator.
 * Count (i in 0..1, j in 0..4) where func_021bc55c(i,j) != 0; return count > 1.
 * Inner bound is `j <= 4` (ble), outer `i < 2` (blt). count lives in the high
 * callee-saved reg (r7) across all calls; i=r5, j=r6. */

extern int func_ov002_021bc55c(int i, int j);

int func_ov002_0220337c(void) {
    int count = 0;
    int i;
    int j;
    for (i = 0; i < 2; i++) {
        for (j = 0; j <= 4; j++) {
            if (func_ov002_021bc55c(i, j) != 0)
                count++;
        }
    }
    return count > 1;
}
