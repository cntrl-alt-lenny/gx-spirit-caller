/* CAMPAIGN-PREP candidate for func_02011aec (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     call-sequence wrapper; results in decl-order temps; stacked 5th arg=0
 *   risk:       reshape-able: func_02018f80 called twice (1st discarded, 2nd kept as c) — must stay two sites or CSE collapses them; mov-shuffle order is scheduling-driven (permuter-class if it persists).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02011aec (main, class C) — prep batch p_0004.
 * UNVERIFIED build-free draft. Drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: call-sequence wrapper; hold results in decl-order temps (a,b,c,d) for final stacked-arg call
 */
/* func_02011aec: a = func_02019210(); func_02018f80() (discarded); b = func_02011a94();
 * func_02018f80() (discarded again — two distinct sites, no CSE); c = func_02018f80()?
 * — actually the 2nd/3rd func_02018f80 results: r4 = func_02018f80(); d = func_02018f90().
 * Final: func_020117e4(a, b, c=r4, d, 0) with the 5th arg (0) passed on the stack.
 * Temps declared in register-alloc order r6,r5,r4 = a,b,c. */
extern int func_02019210(void);
extern int func_02018f80(void);
extern int func_02011a94(void);
extern int func_02018f90(void);
extern void func_020117e4(int a, int b, int c, int d, int e);

void func_02011aec(void) {
    int a, b, c, d;
    a = func_02019210();
    func_02018f80();
    b = func_02011a94();
    c = func_02018f80();
    d = func_02018f90();
    func_020117e4(a, b, c, d, 0);
}
