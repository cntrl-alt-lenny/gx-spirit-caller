/* CAMPAIGN-PREP candidate for func_02253b6c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: hold arg0; if/else const-assign lo,hi; rely on -O4 to hoist the invariant 5 and 1 into callee regs r5/r4 like the orig
 *   risk:       reshape-able: orig pre-loads the call constants 5 and 1 into callee regs (mov r5,#5;mov r4,#1) before the loop; if mwcc re-materializes them per-iteration, bind them as named locals declared before the loop.
 *   confidence: med
 */
/* func_ov002_02253b6c: 2x(lo..hi) nested dispatch (sibling of 02253928).
 * func_0202e234(arg0) picks inner [lo,hi]; for each (i in 0..1, j in lo..hi):
 * if 021baca8(i,j,arg0) then 021e2d94(i,j,5,1). The 5 and 1 are loop-invariant
 * and the orig hoists them into callee regs before the loop. */
extern int  func_0202e234(int x);
extern int  func_ov002_021baca8(int a, int b, int code);
extern void func_ov002_021e2d94(int a, int b, int c, int d);

void func_ov002_02253b6c(int arg0) {
    int lo, hi;
    int i, j;

    if (func_0202e234(arg0) != 0) {
        lo = 0; hi = 4;
    } else {
        lo = 5; hi = 9;
    }
    for (i = 0; i < 2; i++) {
        for (j = lo; j <= hi; j++) {
            if (func_ov002_021baca8(i, j, arg0) != 0)
                func_ov002_021e2d94(i, j, 5, 1);
        }
    }
}
