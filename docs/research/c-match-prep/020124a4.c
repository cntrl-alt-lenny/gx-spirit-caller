/* CAMPAIGN-PREP candidate for func_020124a4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ldrsb => signed char read; mla-base per-global; store dst[0] then preserve call/arg order
 *   risk:       decl/eval-order: orig computes the 0x1a mla and ldrsb interleaved before strb (regs r1/r2/r3 preloaded). mwcc may hoist the load differently. reshape-able (reorder local reads); ldrsb needs signed char.
 *   confidence: med
 */
/* func_020124a4(idx, dst): mirror of 02012454 but the byte flows the other
 * way: signed data_02104cae[idx] (ldrsb) -> dst[0]; helper arg order for
 * func_02094688 is (dst+0x1c, &data_cf8[...]) swapped vs 02012454. */
extern signed char data_02104cae[];
extern unsigned char data_02104cb0[];
extern unsigned char data_02104cf8[];
extern void func_020aadf8(void *a, void *b);
extern void func_02094688(void *a, void *b);

void func_020124a4(int idx, signed char *dst)
{
    dst[0] = data_02104cae[idx];
    func_020aadf8(&data_02104cb0[idx * 0x1a], dst + 1);
    func_02094688(dst + 0x1c, &data_02104cf8[idx * 0x108]);
}
