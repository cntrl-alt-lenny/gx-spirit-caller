/* CAMPAIGN-PREP candidate for func_02004fe8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind a,b,c,d to callee-saved across calls; e+1/d+1 first call only, reload plain second
 *   risk:       orig holds a/b/c/d in r7/r6/r5/r4 across both ef4 calls and RELOADS e,f from caller stack for the 2nd call; if mwcc respills differently the ldr [sp,#..] reloads move — likely permuter-class (caller-saved vs callee-saved coin-flip across 4 calls).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02004fe8 (main, class C) — front-load.
 *   recipe: keep a,b,c,d in callee-saved across 4 calls; +1 on d,e only for 1st emit
 * func_02001ef4(a,0,0); ef4(a,b,c,d+1,e+1,f,func_02003b18);
 * func_02001ef4(a,1,1); ef4(a,b,c,d,e,f,func_02003ac0)  [e,f RELOADED, no +1].
 */
extern void func_02001ef4(void *p, int x, int y);
extern int func_02003b18(void);
extern int func_02003ac0(void);
extern int func_02004ef4(int a, int b, int c, int d, int e, int f, void *fn);

void func_02004fe8(void *a, int b, int c, int d, int e, int f) {
    func_02001ef4(a, 0, 0);
    func_02004ef4((int)a, b, c, d + 1, e + 1, f, func_02003b18);
    func_02001ef4(a, 1, 1);
    func_02004ef4((int)a, b, c, d, e, f, func_02003ac0);
}
