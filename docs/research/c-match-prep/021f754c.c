/* CAMPAIGN-PREP candidate for func_021f754c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :6 bitfield guard (==0x23); bind call result to r; signed r>0; pass r through as arg1
 *   risk:       r (021f40f4 result) must stay in r1 across cmp;ble to become 0226aea8 arg1 (orig mov r1,r0 then reuses). reshape-able and already done via local r-bind.
 *   confidence: med
 */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

struct Self {
    u16 f0;
    u16 b0 : 1;
    u16 b1 : 5;
    u16 b6 : 6;
};

extern int  func_ov002_021f40f4(struct Self *self);
extern void func_ov002_0226aea8(int a, int b, int c, int d);

int func_ov002_021f754c(struct Self *self) {
    int r;
    if (self->b6 != 0x23) {
        r = func_ov002_021f40f4(self);
        if (r > 0)
            func_ov002_0226aea8(self->b0, r, 0, 1);
    }
    return 1;
}
