/* CAMPAIGN-PREP candidate for func_02022a80 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: mla A[i]*x + B[i]*(y-x); bind d=y-x; store-order out[0..2]; helper r0
 *   risk:       reshape-able: orig binds d=(y-x) in r4 and x in r9 across all 3, reads A[i]/B[i] fresh; mla operand order mul A[i]*x then mla B[i]*d picks dest. First call leaves r1=y implicitly (no mov r1 before bl0) — if mwcc emits an extra mov r1,y the prologue diverges. struct-guessed: B/A are int[3].
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02022a80 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: D: mla matrix*vector 3 components; store-order out[0..2]; func_020b3870(A[i]*x + B[i]*(y-x), y); bind d=y-x once, hold x.
 */
extern int func_020b3870(int num, int den);     /* result r0 used */

int func_02022a80(int x, int y, int *B, int *A, int *out) {
    int d = y - x;                                /* sub r4, r8(y), r9(x) */
    out[0] = func_020b3870(A[0] * x + B[0] * d, y);   /* mul A0*x; mla B0,d */
    out[1] = func_020b3870(A[1] * x + B[1] * d, y);
    out[2] = func_020b3870(A[2] * x + B[2] * d, y);
    return 1;
}
