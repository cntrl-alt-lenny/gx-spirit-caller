/* CAMPAIGN-PREP candidate for func_02209340 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla base+p*0x868, separate mul b5*0x14; explicit (e>>k)&1 tests in source order 16/18/17/19
 *   risk:       reshape-able: the non-monotonic bit-test order (16,18,17,19) needs explicit shifts not a bitfield; if mwcc reorders the tst chain or fuses the two index muls into one mla differently the index/test block diverges.
 *   confidence: med
 */
/* func_ov002_02209340 (ov002, class D, MED). Packed halfword at +0x2.
 * e = *(int*)(cf1ac + p*0x868 + b5*0x14); four bit tests in order 16,18,17,19,
 * each set -> return 0; else tail-call 02208bfc(self). r0 holds self throughout. */
typedef unsigned short u16;
typedef unsigned char  u8;

struct Self02209340 {
    u16 f0;                                                /* +0x0 */
    struct { u16 p : 1; u16 b5 : 5; u16 b6 : 6; u16 _t : 4; } f2; /* +0x2 */
};

extern u8 data_ov002_022cf1ac[]; /* p-stride 0x868, b5-stride 0x14 */
extern int func_ov002_02208bfc(struct Self02209340 *self);

int func_ov002_02209340(struct Self02209340 *self) {
    int e = *(int *)(data_ov002_022cf1ac + (self->f2.p & 1) * 0x868 + self->f2.b5 * 0x14);
    if ((e >> 16) & 1) return 0;
    if ((e >> 18) & 1) return 0;
    if ((e >> 17) & 1) return 0;
    if ((e >> 19) & 1) return 0;
    return func_ov002_02208bfc(self);
}
