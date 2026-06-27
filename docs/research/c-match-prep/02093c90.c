/* CAMPAIGN-PREP candidate for func_02093c90 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: masked 3-bit DMA-timing field (& 0x38000000) compared to constants; mirror cmp-chain branch order
 *   risk:       reshape-able (branch order): the .L_58 constant test sequence {0x18,0x20,0x28,0x30,0x38,0x08,0x10} then fallthrough must match; if mwcc emits a jump-table or reorders, escape to explicit goto/if-order. struct-guessed DMA stride.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02093c90 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: masked-field (DMACNT & 0x38000000) priority compare chain; emit cmp order verbatim.
 *   risk:   reshape-able branch ordering (constant test sequence + fallthrough).
 *   confidence: med
 */
/* func_02093c90: scan DMA channels 0..2 (DMA cnt regs at 0x040000b8 stride 0xc).
 * For each channel != `self`, if enabled (bit31) and its 3-bit start-timing
 * field differs from `pri` (and isn't a VBL/HBL mutual-exclude pair), and the
 * field is one of the recognised values, kick func_02093bfc(). */

extern void func_02093bfc(void);

void func_02093c90(int self, int pri) {
    volatile unsigned int *p = (volatile unsigned int *)0x040000b8;
    int i;
    for (i = 0; i < 3; i++, p += 3) {
        unsigned int cnt;
        unsigned int t;
        if (i == self) continue;
        cnt = *p;
        if ((cnt & 0x80000000u) == 0) continue;
        t = cnt & 0x38000000u;
        if ((int)t == pri) continue;
        if (t == 0x08000000u && pri == 0x10000000) continue;
        if (t == 0x10000000u && pri == 0x08000000) continue;
        if (t == 0x18000000u || t == 0x20000000u || t == 0x28000000u ||
            t == 0x30000000u || t == 0x38000000u || t == 0x08000000u ||
            t == 0x10000000u)
            func_02093bfc();
    }
}
