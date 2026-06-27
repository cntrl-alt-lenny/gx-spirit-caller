/* CAMPAIGN-PREP candidate for func_02093d44 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: mul-index address (arg*6,*12), MMIO bic store-order, two trailing volatile dummy reads
 *   risk:       reshape-able/permuter: `cmp r4,#0` is hoisted above the two bic stores (flags held across volatile RMW); also the two discarded `ldrh` reads need volatile. If the cmp/store schedule differs, reshape by moving the `if(arg==0)` test earlier.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02093d44 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: mul-index MMIO address; bic (&= ~mask) store-order; volatile dummy reads; cmp hoist.
 *   risk:   reshape-able/permuter scheduling of `cmp arg,#0` vs the two bic stores.
 *   confidence: med
 */
/* func_02093d44: program a DMA-ish channel selected by `ch`. reg =
 * 0x040000b0 + ((ch*6+5)<<1); clear bits 0x3a00 then 0x8000 (two RMW), two
 * dummy reads; if ch==0, zero the source/ctrl words and arm 0x81400001. */

extern void OS_DisableIrq(void);
extern void OS_RestoreIrq(void);

void func_02093d44(int ch) {
    volatile unsigned short *reg;
    OS_DisableIrq();
    reg = (volatile unsigned short *)(0x040000b0 + ((ch * 6 + 5) << 1));
    *reg &= ~0x3a00;
    *reg &= ~0x8000;
    (void)*reg;
    (void)*reg;
    if (ch == 0) {
        *(volatile unsigned int *)(0x04000000 + ch * 0xc + 0xb0) = 0;
        *(volatile unsigned int *)(0x040000b0 + ch * 0xc + 0x4) = 0;
        *(volatile unsigned int *)(0x040000b0 + ch * 0xc + 0x8) = 0x81400001;
    }
    OS_RestoreIrq();
}
