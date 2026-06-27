/* CAMPAIGN-PREP candidate for func_022094f0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     b6 :6 bitfield ==0x12; bind p (lsl#1f;lsr#1f) reused for (p&1)*0x868 and 1-p; final !=0
 *   risk:       struct-guessed/reshape-able: G(cd3f4) fields +0,+0x1c and self->f14 offsets inferred; orig keeps p in r3 across (p&1) table-stride and rsb 1-p, so p must bind to one reg, not reload twice.
 *   confidence: med
 */
/* func_ov002_022094f0 (ov002, class D, MED). 2 args (self, arg1).
 * b6==0x12 guard; self->f14!=0 guard; 021c8940(G->f0,G->f1c)==0x12 guard;
 * 021ff3bc(self,arg1) guard; table cf17c[(p&1)*0x868]!=0 guard;
 * return 021ff2b8(self, 1-p) != 0. p reused for (p&1) and (1-p). */
typedef unsigned short u16;
typedef unsigned char  u8;

struct Self022094f0 {
    u16 f0;                                                /* +0x0 */
    struct { u16 p : 1; u16 b5 : 5; u16 b6 : 6; u16 _t : 4; } f2; /* +0x2 */
    u8  _pad10[0x14 - 0x4];
    int f14;                                               /* +0x14 */
};

struct G022094f0 { int f0; u8 _c[0x18]; int f1c; }; /* +0x0, +0x1c */
extern struct G022094f0 data_ov002_022cd3f4;
extern u8 data_ov002_022cf17c[]; /* table, byte-stride 0x868 */
extern int func_ov002_021c8940(int a, int b);
extern int func_ov002_021ff3bc(struct Self022094f0 *self, int arg1);
extern int func_ov002_021ff2b8(struct Self022094f0 *self, int q);

int func_ov002_022094f0(struct Self022094f0 *self, int arg1) {
    int p;
    if (self->f2.b6 != 0x12) return 0;
    if (self->f14 == 0) return 0;
    if (func_ov002_021c8940(data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f1c) != 0x12) return 0;
    if (func_ov002_021ff3bc(self, arg1) == 0) return 0;
    p = self->f2.p;
    if (*(int *)(data_ov002_022cf17c + (p & 1) * 0x868) == 0) return 0;
    return func_ov002_021ff2b8(self, 1 - p) != 0;
}
