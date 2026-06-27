/* CAMPAIGN-PREP candidate for func_021b41fc (ov017, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     divmod: t=v/3600, min=t%60, hr=v/216000; clamp; two blit blocks
 *   risk:       permuter-class: mwcc's chosen magic for /216000 (orig uses rounding form 0x36b06e71 sep from t/60) and /3600 likely differ; r6=a1/r5=a2 bind order + sp-arg packing also coin-flip. Lowest-confidence of batch.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov017_021b41fc (ov017, class D) — brief 494.
 * UNVERIFIED build-free draft. recipe: time-format divmod. v=data_02104f4c[0].
 * t=v/3600 (magic 0x91a2b3c5>>11); min=t%60 (via /60 magic 0x88888889>>5);
 * hr=v/216000 (SEPARATE rounding magic 0x36b06e71); clamp hr>9999 -> hr=9999,
 * min=59. Then two OAM-ish blits via func_02005dac/func_020944a4.
 */
extern unsigned int data_02104f4c[];
extern int  func_02005dac(int a, int b, int c);
extern void func_020944a4(void *p, int h, int n);
extern void func_ov017_021b40d8(int a0, int hr, int a2, int a3, int two);

void func_ov017_021b41fc(int a0, int a1, int a2) {
    unsigned int v = data_02104f4c[0];
    int t = v / 3600;
    int min = t % 60;
    int hr  = v / 216000;
    short blit[3];
    int h;

    if (hr > 9999) { hr = 9999; min = 59; }

    func_ov017_021b40d8(a0, hr, a1, a2, 2);

    *(int *)&blit[0] = (a2 & 0xff) | 0x40000000 | (((unsigned)((a1 - 0x18) << 0x17)) >> 7);
    blit[2] = (short)0x1686;
    h = func_02005dac(2, 0, (int)0);
    func_020944a4(&blit[0], h, 6);

    func_ov017_021b40d8(a0, min, a1 - 0x18, a2, 0);

    *(int *)&blit[0] = ((a2 + 1) & 0xff) | 0x40000000 | (((unsigned)((min - 0x10) << 0x17)) >> 7);
    blit[2] = (short)0x6687;
    h = func_02005dac(2, 0, (int)0);
    func_020944a4(&blit[0], h, 6);
}
