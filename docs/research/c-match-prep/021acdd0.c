/* CAMPAIGN-PREP candidate for func_021acdd0 (ov008, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D store-order/bitfield: high-byte insert (lsl#8); scan loop with fixed stride; if-eq early return
 *   risk:       permuter-class: same high-byte extract `(hw<<16)>>24` peephole-splits in mwcc; plus the scan loop's `base+=stride` (stride bound once as r0<<1) vs mwcc recomputing — register rotation in the loop is the dominant near-miss.
 *   confidence: low
 */
/* func_ov008_021acdd0 — scan a scaled table (func_020b3870) for the first
 * cell whose +0x18 exceeds arg, store the found index as the HIGH byte of
 * 021b2dc0.u16@+4, and notify if it changed. */
extern unsigned char data_ov008_021b2c80[];/* u16@+0x5a */
extern unsigned char data_ov008_021b2dc0[];/* u16@+4 */
extern void func_02037208(int, int, int, int);
extern int  func_020b3870(int, int);

void func_ov008_021acdd0(int a0) {
    int n = *(unsigned short *)(data_ov008_021b2c80 + 0x5a);
    int base, stride, i;
    unsigned old, idx;
    if (n > 6) n = 6;
    base = func_020b3870(0xf0, n << 1);
    old = (*(unsigned short *)(data_ov008_021b2dc0 + 4) << 16) >> 24; /* high byte */
    stride = base << 1;
    i = 0;
    while (i < n) {
        if (a0 < base + 0x18) break;
        i++;
        base += stride;
    }
    idx = (i == n) ? (unsigned)(n - 1) : (unsigned)i;
    *(unsigned short *)(data_ov008_021b2dc0 + 4) =
        (*(unsigned short *)(data_ov008_021b2dc0 + 4) & ~0xff00u) | ((idx & 0xff) << 8);
    if (((*(unsigned short *)(data_ov008_021b2dc0 + 4) << 16) >> 24) != old)
        func_02037208(0x38, 0x38 - 0x39, 0, 1);
}
