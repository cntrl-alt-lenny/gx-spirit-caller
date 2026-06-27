/* CAMPAIGN-PREP candidate for func_0206811c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order kept exact; guard as nested if; arg5/arg6 from [sp+0x10]/[sp+0x14]; result stored after call
 *   risk:       func_02054e8c is declared void but its r0 is stored to [p+0x20]; if mwcc drops the dead-looking result the str vanishes — make return type int (reshape-able).
 *   confidence: med
 */
/* func_0206811c (main, class C) — struct init stores + stacked-arg calls */
extern int  data_0219e3f0;
extern void func_02054e8c(int a, int b);
extern void func_02055320(void);
extern void func_02068368(void *p);

void func_0206811c(int *p, int a5cb, int a4cb, int flag,
                   int arg5, int arg6) {
    if (flag == 0) {
        if (data_0219e3f0 != 1) return;
    }
    func_02055320();
    p[0]        = a4cb;
    p[1]        = a5cb;
    *(int *)((char *)p + 0x40) = 0;
    *(int *)((char *)p + 0x44) = arg5;
    *(int *)((char *)p + 0x48) = arg6;
    *(int *)((char *)p + 0x28) = 0;
    *(int *)((char *)p + 0x20) = func_02054e8c(2, 2);
    func_02068368((char *)p + 0x14);
    func_02068368((char *)p + 0x8);
}
