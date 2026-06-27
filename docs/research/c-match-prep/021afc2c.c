/* CAMPAIGN-PREP candidate for func_021afc2c (ov008, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     v unsigned -> movhi clamp; func_020b3870(0x8a,v<<1); mla a0,(r<<1),0x15; two-arm dispatch
 *   risk:       ov008_core explicitly flags this a 30v30 SCHEDULING sibling of matched 021ac590 (same shape, ordering of mla/sub vs the bl-arg setup differs); a C reshape did not close it. permuter-class
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov008_021afc2c (ov008, class C, MED) — built-free.
 * UNVERIFIED + ITERATION-EXPECTED. mla index, clamp, two-arm call dispatch.
 * Explicit scheduling sibling of the matched 021ac590 (CLAMP+SCALE+MLA recipe).
 *
 * v = u16 @ data_021b2de4+0xa8, clamped to 3 (UNSIGNED -> movhi). r = lookup
 * func_020b3870(0x8a, v<<1); base = mla(a0, (r<<1), 0x15). Mode @+4: 0 -> one
 * arm (021abb08 with base+r-0x16), else -> the other (021abba0 with (mode-1)*0x1a+0x47).
 */
extern int  func_020b3870(int a, int b);
extern void func_ov008_021abb08(int a0, int a1);
extern void func_ov008_021abba0(int a0, int a1);

extern char data_ov008_021b2de4[];

void func_ov008_021afc2c(int a0) {
    unsigned v = *(unsigned short *)(data_ov008_021b2de4 + 0xa8);
    int r;
    int base;
    int mode;

    if (v > 3) v = 3;
    r = func_020b3870(0x8a, v << 1);
    base = a0 * (r << 1) + 0x15;
    mode = *(unsigned short *)(data_ov008_021b2de4 + 0x4);

    if (mode == 0) {
        func_ov008_021abb08(0x24, base + r - 0x16);
    } else {
        func_ov008_021abba0((mode - 1) * 0x1a + 0x47, base + r - 0xe);
    }
}
