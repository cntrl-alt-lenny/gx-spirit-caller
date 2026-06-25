/* CAMPAIGN-PREP candidate for func_0220a480 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order strh kept in sequence; bic+orr hi-byte insert; reload p; table gate
 *   risk:       reshape-able: the +0x6 hi-byte save/restore (mov lsl#0x10;lsr#0x18 then lsl#0x18;lsr#0x10) must fold to byte-insert. If mwcc picks a different bic/orr split or reorders the strh relative to the bl, the store-order block diverges; bitfield model of packed6 may be needed.
 *   confidence: low
 */
/* func_ov002_0220a480 (ov002, class C/D, MED) -- batch p_0086.
 * guard 021c23ac(p, k5, k6lo); save old hi byte of +0x6, clear it, store;
 * 3x: clear hi byte of +0x6, set to 0/1/2, store, call 022577dc(self); guard each;
 * restore +0x6 hi byte from saved (k8) byte; 021ca2b8(p) guard;
 * if table-gate cf17c[p]==0 { t=0223f6c4(self); 022536e8(p,f0,t) guard } return 2.
 * STORE-ORDER: the strh to +0x6 between calls must stay in source order.
 */
typedef unsigned short u16;
typedef unsigned char  u8;

struct Self0220a480 {
    u16 f0;                                       /* +0x0 */
    struct { u16 p : 1; u16 b5 : 5; u16 b6 : 6; u16 _t : 4; } f2; /* +0x2 */
    u16 hp;                                        /* +0x4 (unused here) */
    u16 packed6;                                   /* +0x6: lo=arg, hi=saved */
};

extern u8 data_ov002_022cf17c[]; /* alias gate, stride 0x868 */
extern int func_ov002_021c23ac(int p, int b5, int b6);
extern int func_ov002_022577dc(struct Self0220a480 *self);
extern int func_ov002_021ca2b8(int p);
extern int func_ov002_0223f6c4(struct Self0220a480 *self);
extern int func_ov002_022536e8(int p, unsigned int f0, int t);

int func_ov002_0220a480(struct Self0220a480 *self) {
    int saved;
    if (func_ov002_021c23ac(self->f2.p, self->f2.b6, self->f2.b5) == 0) return 0;
    saved = (self->packed6 << 16) >> 24; /* hi byte before clearing */
    self->packed6 = self->packed6 & ~0xff00;
    if (func_ov002_022577dc(self) == 0) return 0;
    self->packed6 = (self->packed6 & ~0xff00) | 0x100;
    if (func_ov002_022577dc(self) == 0) return 0;
    self->packed6 = (self->packed6 & ~0xff00) | 0x200;
    if (func_ov002_022577dc(self) == 0) return 0;
    self->packed6 = (self->packed6 & ~0xff00) | ((unsigned int)(unsigned short)saved << 8);
    if (func_ov002_021ca2b8(self->f2.p) == 0) return 0;
    if (*(int *)(data_ov002_022cf17c + (self->f2.p & 1) * 0x868) == 0) {
        int t = func_ov002_0223f6c4(self);
        if (func_ov002_022536e8(self->f2.p, self->f0, t) == 0) return 0;
    }
    return 2;
}
