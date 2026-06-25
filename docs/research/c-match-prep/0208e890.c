/* CAMPAIGN-PREP candidate for func_0208e890 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     volatile spin-wait (32b) then 16b RMW pair; store-order verbatim; 0x1f0080 from literal
 *   risk:       store-order/scheduling: the three tail stores must stay in a4,a8,ac order (mwcc shares r2=0 for a8/ac). reshape-able via source order; the sub-sp,#4 frame around the call is mwcc default.
 *   confidence: med
 */
/* func_0208e890 (main, class C) — VBLANK-ish spin-wait + MMIO writes + call + ordered stores.
 * while (*0x4000600 & 0x8000000) ;   (32-bit read)
 * *0x4000600 |= 0x8000;
 * *(u16*)0x4000060 |= 0x2000;  *(u16*)0x4000060 |= 0x1000;   (two 16-bit RMW)
 * func_0208e700();
 * 0x40004a4 = 0x001f0080; 0x40004a8 = 0; 0x40004ac = 0;   (ORDER load-bearing). */
typedef unsigned short u16;
typedef unsigned int   u32;

extern void func_0208e700(void);

void func_0208e890(void)
{
    while (*(volatile u32 *)0x04000600 & 0x08000000)
        ;

    *(volatile u32 *)0x04000600 |= 0x8000;
    *(volatile u16 *)0x04000060 |= 0x2000;
    *(volatile u16 *)0x04000060 |= 0x1000;

    func_0208e700();

    *(volatile u32 *)0x040004a4 = 0x001f0080;
    *(volatile u32 *)0x040004a8 = 0;
    *(volatile u32 *)0x040004ac = 0;
}
