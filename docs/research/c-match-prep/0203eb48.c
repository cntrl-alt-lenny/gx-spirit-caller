/* CAMPAIGN-PREP candidate for func_0203eb48 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: result reused in r4 (st then re-derived); decl-order b,st,x matches r5,r4,r0; chained cmp = if-ladder, no early CSE of x
 *   risk:       asm keeps x in r0 (live across the st==6 arm) and st in r4; mwcc holds func_0207b5f8 result in a callee-saved reg. If it instead reloads or reorders the st==2&&x==3 vs st==6 tests the cmp order flips -- reshape-able via the decl/test order shown; residual reg-pick is permuter-class.
 *   confidence: med
 */
/* func_0203eb48 - main - class C
 * chained cmp dispatch on two state values (st=func_0203c888, x=func_0207b5f8);
 * result reused in r4 across every arm; base(r5)=func_0203c900(0x10).
 */
extern void *func_0203c900(int sel);
extern int   func_0203c888(void);
extern int   func_0207b5f8(void);
extern int   func_0203e95c(void *b);
extern int   func_0203e460(void *b, int st);
extern int   func_0203e8b8(void *b);
extern int   func_0203e730(void *b);
extern int   func_0203e610(void *b);

int func_0203eb48(void)
{
    void *b;
    int st;
    int x;

    b  = func_0203c900(0x10);
    st = func_0203c888();
    x  = func_0207b5f8();

    if (st == 2 && x == 3)
        return func_0203e95c(b);
    if (st == 6)
        return func_0203e460(b, st);
    if (x == 3 || x == 6) {
        st = func_0203e460(b, st);
        if (st == 7)
            return st;
        if (st == 3)
            return func_0203e8b8(b);
        if (st == 4)
            return func_0203e730(b);
        if (st == 5)
            return func_0203e610(b);
    }
    return st;
}
