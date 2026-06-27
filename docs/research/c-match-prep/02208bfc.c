/* CAMPAIGN-PREP candidate for func_02208bfc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield :1/:5/:6 halfword; (p&1)*0x868 table-stride; reload p per call
 *   risk:       reshape-able/struct-guessed: orig reloads [self+2] before each call and re-extracts p via lsl#1f;lsr#1f; if mwcc CSEs the halfword load into one reg the per-call ldrh sequence diverges.
 *   confidence: med
 */
/* func_ov002_02208bfc (ov002, class D, MED). Reads packed halfword at +0x2.
 * 021c23ac(p,b5) guard; 021ca2b8(p) guard; table cf17c[(p&1)*0x868] -> if set return 1;
 * else t=0223f6c4(self); if 022536e8(p,f0,t)==0 return 0; return 1. */
typedef unsigned short u16;
typedef unsigned char  u8;

struct Self02208bfc {
    u16 f0;                                                /* +0x0 */
    struct { u16 p : 1; u16 b5 : 5; u16 b6 : 6; u16 _t : 4; } f2; /* +0x2 */
};

extern u8 data_ov002_022cf17c[]; /* table, byte-stride 0x868 */
extern int func_ov002_021c23ac(int p, int b5);
extern int func_ov002_021ca2b8(int p);
extern int func_ov002_0223f6c4(struct Self02208bfc *self);
extern int func_ov002_022536e8(int p, unsigned int f0, int t);

int func_ov002_02208bfc(struct Self02208bfc *self) {
    int t;
    if (func_ov002_021c23ac(self->f2.p, self->f2.b5) == 0) return 0;
    if (func_ov002_021ca2b8(self->f2.p) == 0) return 0;
    if (*(int *)(data_ov002_022cf17c + (self->f2.p & 1) * 0x868) != 0) return 1;
    t = func_ov002_0223f6c4(self);
    if (func_ov002_022536e8(self->f2.p, self->f0, t) == 0) return 0;
    return 1;
}
