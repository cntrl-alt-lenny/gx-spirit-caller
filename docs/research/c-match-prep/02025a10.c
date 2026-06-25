/* CAMPAIGN-PREP candidate for func_02025a10 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: hoist fbyte=self+0x103+0x100 and mvn(-1) const; recompute attr addr inside loop.
 *   risk:       reshape-able: orig pre-computes r6=self+0x103+0x100 and r4=-1 before the loop and recomputes the s16 addr each iter; if mwcc strength-reduces both pointers or sinks the -1, the add/ldrsh sequence diverges.
 *   confidence: med
 */
/* func_02025a10: clear loop over 6 sprite-attr entries at self+0x100 (stride 0x10).
 * For each entry whose s16 >= 0: call func_02022580(), store -1, clear bit0 of
 * the parallel byte at self+0x103+i*0x10. Then clear bit0 of the halfword at
 * self+0x16a, return 1. Clone of 02023e58. */

extern void func_02022580(void);

int func_02025a10(char *self) {
    char *fbyte = self + 0x3 + 0x100;
    int i = 0;
    do {
        short *attr = (short *)(self + (i << 4) + 0x100);
        if (*attr >= 0) {
            func_02022580();
            *(short *)(self + (i << 4) + 0x100) = (short)-1;
            *fbyte = (char)(*fbyte & ~1);
        }
        i++;
        fbyte += 0x10;
    } while (i < 6);
    *(short *)(self + 0x16a) = (short)(*(unsigned short *)(self + 0x16a) & ~1);
    return 1;
}
