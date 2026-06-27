/* CAMPAIGN-PREP candidate for func_02209c7c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     b6 :6 ==0x12; b2 :2 ([13:12]) ==0 tail; G->f4==p && G->f8==0 short-circuit guard
 *   risk:       permuter-class: at the 021b359c call orig carries G->f4 in r0 (the cmp left it there, ==p on this path) as arg0; mwcc may instead reload p or a fresh reg -> r0 source diverges. b2 final movs/moveq also reshape-sensitive.
 *   confidence: low
 */
/* func_ov002_02209c7c (ov002, class D, MED). 2 args (self, other).
 * if (other && other->f0==self->f0) return 0;
 * if b6==0x12 && G->f4==p && G->f8==0 && 021b359c(p,0x1318)==0 return 2;
 * return ((h2>>12)&3)==0 ? 1 : 0. */
typedef unsigned short u16;
typedef unsigned char  u8;

struct Self02209c7c {
    u16 f0;                                                /* +0x0 */
    struct { u16 p : 1; u16 b5 : 5; u16 b6 : 6; u16 b2 : 2; u16 _t : 2; } f2; /* +0x2 */
};

struct G02209c7c { int f0; int f4; int f8; }; /* +0x0,+0x4,+0x8 */
extern struct G02209c7c data_ov002_022cd3f4;
extern int func_ov002_021b359c(int p, int code);

int func_ov002_02209c7c(struct Self02209c7c *self, struct Self02209c7c *other) {
    if (other != 0) {
        if (other->f0 == self->f0) return 0;
    }
    if (self->f2.b6 == 0x12) {
        if (data_ov002_022cd3f4.f4 == self->f2.p && data_ov002_022cd3f4.f8 == 0) {
            if (func_ov002_021b359c(self->f2.p, 0x1318) == 0) return 2;
        }
    }
    return self->f2.b2 == 0 ? 1 : 0;
}
