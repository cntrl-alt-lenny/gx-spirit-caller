/* CAMPAIGN-PREP candidate for func_0200abb0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hoist count once into callee-saved; loop-invariant 1 kept in a named var; opaque-call body
 *   risk:       orig holds the constant 1 in callee-saved r4 across the loop (`mov r1,r4`); a bare literal would inline to `mov r1,#1` and drop r4 from the frame. Modelled as `j=1`; mwcc may still constant-fold -> reg/frame diff. reshape-able.
 *   confidence: med
 */
/* func_0200abb0: init via func_0202adf8(&local)/func_0202ae1c(-1), then for i in 1..n-1
   call func_0202b0e0(i); if func_0202e2f8()==0 call func_0202ba94(x,1). Finally func_0202af40(). */
extern void func_0202adf8(void *p);
extern void func_0202ae1c(int x);
extern int  func_0202b0e0(int i);
extern int  func_0202e2f8(void);
extern void func_0202ba94(int x, int k);
extern void func_0202af40(void);
extern int  data_020b4768;            /* first word = count */

int func_0200abb0(void)
{
    char local[0x3c];
    int n, i, j, x;
    func_0202adf8(local);
    func_0202ae1c(-1);
    n = data_020b4768;
    j = 1;
    for (i = 1; i < n; i++) {
        x = func_0202b0e0(i);
        if (func_0202e2f8() == 0)
            func_0202ba94(x, j);
    }
    func_0202af40();
    return 1;
}
