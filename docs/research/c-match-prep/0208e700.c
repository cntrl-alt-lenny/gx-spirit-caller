/* CAMPAIGN-PREP candidate for func_0208e700 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order verbatim; e518 local before e4ec local; volatile prevents store coalesce/reorder
 *   risk:       store-order: must keep the 0x4000454=0 ONLY at tail (sibling e7ac adds a mid one). reshape-able via volatile+exact source order; residual reg pick for the two zero-stores is scheduling.
 *   confidence: med
 */
/* func_0208e700 (main, class C/D) — two poll loops fill two locals, then ordered MMIO stores.
 * *0x4000600 |= 0x8000; poll func_0208e518(&a) until 0; poll func_0208e4ec(&b) until 0;
 * store sequence (ORDER IS LOAD-BEARING):
 *   0x4000440=3; 0x4000454=0; 0x4000440=0; if(b) 0x4000448=b; 0x4000440=2; 0x4000448=a; 0x4000454=0.
 * a = local from e518 (sp+0), b = local from e4ec (sp+4); e518 polled before e4ec. */
typedef unsigned int u32;

extern int func_0208e518(u32 *out);
extern int func_0208e4ec(u32 *out);

void func_0208e700(void)
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
    *(volatile u32 *)0x04000440 = 2;
    *(volatile u32 *)0x04000448 = a;
    *(volatile u32 *)0x04000454 = 0;
}
