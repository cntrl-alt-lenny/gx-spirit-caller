/* CAMPAIGN-PREP candidate for func_0208e7ac (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order verbatim incl. extra mid 454=0; e518 before e4ec; volatile pins order
 *   risk:       store-order: the extra 0x4000454=0 (vs e700) is the whole delta; if omitted/merged the store stream diverges. reshape-able (source order). zero-reg sharing (r3) is scheduling, permuter-class residual.
 *   confidence: med
 */
/* func_0208e7ac (main, class C/D) — sibling of e700; ONE EXTRA 0x4000454=0 store.
 * *0x4000600 |= 0x8000; poll func_0208e518(&a) until 0; poll func_0208e4ec(&b) until 0;
 * store sequence (note the extra 454=0 before 440=2):
 *   0x4000440=3; 0x4000454=0; 0x4000440=0; if(b) 0x4000448=b; 0x4000454=0; 0x4000440=2; 0x4000448=a; 0x4000454=0.
 * The doubled adjacent 454=0 lets mwcc CSE the constant 0 (orig keeps it in r3). */
typedef unsigned int u32;

extern int func_0208e518(u32 *out);
extern int func_0208e4ec(u32 *out);

void func_0208e7ac(void)
{
    u32 a;
    u32 b;

    *(volatile u32 *)0x04000600 |= 0x8000;

    while (func_0208e518(&a) != 0)
        ;
    while (func_0208e4ec(&b) != 0)
        ;

    *(volatile u32 *)0x04000440 = 3;
    *(volatile u32 *)0x04000454 = 0;
    *(volatile u32 *)0x04000440 = 0;
    if (b != 0)
        *(volatile u32 *)0x04000448 = b;
    *(volatile u32 *)0x04000454 = 0;
    *(volatile u32 *)0x04000440 = 2;
    *(volatile u32 *)0x04000448 = a;
    *(volatile u32 *)0x04000454 = 0;
}
