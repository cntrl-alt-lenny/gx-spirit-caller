/* CAMPAIGN-PREP candidate for func_02012454 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla-base index per-global (inline idx*stride); strb before first call; preserve call/arg order
 *   risk:       store-order: orig strb's data_cae[idx] AFTER forming the 0x1a base (r5 reused). If mwcc emits strb first then mla, the ldr/mla scheduling diverges. reshape-able (move strb after first base expr).
 *   confidence: med
 */
/* func_02012454(idx, src): byte src[0] -> data_02104cae[idx]; then two
 * mla-based struct slots are passed to helpers.
 *   data_02104cb0 stride 0x1a, data_02104cf8 stride 0x108.
 * Confirmed call site: func_0201261c does `mov r0,r9; ldr r1,data_02105a4c;
 * bl func_02012454` (idx is a 0/1 loop counter, src a record pointer). */
extern unsigned char data_02104cae[];
extern unsigned char data_02104cb0[];
extern unsigned char data_02104cf8[];
extern void func_020aadf8(void *dst, void *src);
extern void func_02094688(void *a, void *b);

void func_02012454(int idx, unsigned char *src)
{
    data_02104cae[idx] = src[0];
    func_020aadf8(&data_02104cb0[idx * 0x1a], src + 1);
    func_02094688(src + 0x1c, &data_02104cf8[idx * 0x108]);
}
