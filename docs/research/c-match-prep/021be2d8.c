/* CAMPAIGN-PREP candidate for func_021be2d8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-return cascade; 5-arg call with stacked 5th (str r4,[sp]); rsb for 1-arg0
 *   risk:       5th arg passed on stack (str r4,[sp]=const 1) with r4=1,r6=1-arg0 held in callee-saved across the j-loop; mwcc may keep the const-1 in a reg vs re-str. reshape-able if needed (literal 1 already used). med-confidence stack-arg.
 *   confidence: med
 */
/* func_ov002_021be2d8: short-circuit cascade — fail if pre-check 021be384
 * fails; succeed if 021c031c or 021c034c(.,.,1) holds; else loop j=0..4
 * calling 021bf294(arg0,arg1,1-arg0,j,1) returning 1 on first hit, else 0. */

extern int func_ov002_021be384(int a, int b);
extern int func_ov002_021bf294(int a, int b, int c, int d, int e);
extern int func_ov002_021c031c(int a, int b);
extern int func_ov002_021c034c(int a, int b, int c);

int func_ov002_021be2d8(int arg0, int arg1) {
    int j;
    if (func_ov002_021be384(arg0, arg1) == 0)
        return 0;
    if (func_ov002_021c031c(arg0, arg1) != 0)
        return 1;
    if (func_ov002_021c034c(arg0, arg1, 1) != 0)
        return 1;
    for (j = 0; j <= 4; j++) {
        if (func_ov002_021bf294(arg0, arg1, 1 - arg0, j, 1) != 0)
            return 1;
    }
    return 0;
}
