/* CAMPAIGN-PREP candidate for func_021f526c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     a-first + mask=0 seed (mov#0;orr), (u16)>>8 hi-byte, b14 bitfield
 *   risk:       permuter-class reg-mirror: compiled close (seed+structure match) but lo/hi land in r4/r5 swapped vs orig and the `1`/accumulator use ip/lr where orig differs. Brief 358: permuter plateaus on reg-mirror => likely .s.
 *   confidence: low
 */
/* func_ov002_021f526c: read f2(bit0,fld5), call 021b3618, build a 2-set-bit mask
 * (1<<a)|(1<<b) from result lo/hi bytes + field combos, 021deb84(parity,mask),
 * then 021b9ecc(lo,hi)->store f8; return 1. cls D, reg-alloc/var-shift heavy.
 *   r=021b3618(bit0,fld5); a=(bit0<<4)+fld5; lo=r&0xff; hi=((u16)r>>8)&0xff;
 *   mask=0; mask|=1<<a; b=hi+(lo<<4); mask|=1<<b;  (mask=0 seed => orig mov#0;orr)
 *   021deb84(bit0 ^ f2.b14, mask); f8 = 021b9ecc(lo, hi); */
typedef unsigned short u16;

extern int func_ov002_021b3618(int bit0, int fld5);
extern int func_ov002_021deb84(int parity, unsigned int mask);
extern int func_ov002_021b9ecc(int lo, int hi);

struct F021f526c_F2 {
    u16 bit0 : 1;
    u16 fld5 : 5;
    u16 mid8 : 8;
    u16 b14  : 1;
    u16 hi1  : 1;
};
struct F021f526c {
    u16 pad0;
    struct F021f526c_F2 f2;
    u16 pad4;
    u16 pad6;
    u16 f8;
};

int func_ov002_021f526c(struct F021f526c *self) {
    int r = func_ov002_021b3618(self->f2.bit0, self->f2.fld5);
    int a = (self->f2.bit0 << 4) + self->f2.fld5;
    unsigned int mask = 0;
    int lo = r & 0xff;
    int hi = ((u16)r >> 8) & 0xff;
    int b;
    mask |= 1u << a;
    b = hi + (lo << 4);
    mask |= 1u << b;
    func_ov002_021deb84(self->f2.bit0 ^ self->f2.b14, mask);
    self->f8 = func_ov002_021b9ecc(lo, hi);
    return 1;
}
