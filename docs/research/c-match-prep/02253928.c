/* CAMPAIGN-PREP candidate for func_02253928 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: hold arg0/arg1 across calls (callee regs r9/r8); if/else const-assign -> movne-first/moveq lo,hi; natural nested loop
 *   risk:       permuter-class: callee-saved assignment of {i,j,lo,hi,arg0,arg1} to r4-r9 is a coloring choice; if mwcc permutes the pairing the stmdb regset/uses diverge though logic matches.
 *   confidence: med
 */
/* func_ov002_02253928: 2x(lo..hi) nested dispatch. func_0202e234(arg0)
 * picks the inner [lo,hi] range (!=0 -> [0,4], ==0 -> [5,9]); for each
 * (i in 0..1, j in lo..hi): if guard 021baca8(i,j,arg0) then 021d90fc(i,j,arg1). */
extern int  func_0202e234(int x);
extern int  func_ov002_021baca8(int a, int b, int code);
extern void func_ov002_021d90fc(int a, int b, unsigned int c);

void func_ov002_02253928(int arg0, int arg1) {
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
                func_ov002_021d90fc(i, j, arg1);
        }
    }
}
