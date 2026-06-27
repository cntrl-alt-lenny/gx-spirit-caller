/* CAMPAIGN-PREP candidate for func_02209f48 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     add c+d (r5 first); signed <2 movlt; unsigned >=2 final via (unsigned) cast => movcs/movcc
 *   risk:       reshape-able: final compare is unsigned (movcs/movcc) so the table read must be cast to unsigned; c held in callee r5 across 021bc288 -> if mwcc reorders c/d eval or drops the cast the >=2 branch diverges.
 *   confidence: med
 */
/* func_ov002_02209f48 (ov002, class D, MED). Packed halfword at +0x2.
 * guards 021c23ac(p,b5),021ca2b8(p); c=021ff2b8(self,p); d=021bc288(p,b5);
 * if c+d < 2 return 0; return (unsigned)cf17c[(p&1)*0x868] >= 2. */
typedef unsigned short u16;
typedef unsigned char  u8;

struct Self02209f48 {
    u16 f0;                                                /* +0x0 */
    struct { u16 p : 1; u16 b5 : 5; u16 b6 : 6; u16 _t : 4; } f2; /* +0x2 */
};

extern u8 data_ov002_022cf17c[]; /* table, byte-stride 0x868 */
extern int func_ov002_021c23ac(int p, int b5);
extern int func_ov002_021ca2b8(int p);
extern int func_ov002_021ff2b8(struct Self02209f48 *self, int p);
extern int func_ov002_021bc288(int p, int b5);

int func_ov002_02209f48(struct Self02209f48 *self) {
    int c, d;
    if (func_ov002_021c23ac(self->f2.p, self->f2.b5) == 0) return 0;
    if (func_ov002_021ca2b8(self->f2.p) == 0) return 0;
    c = func_ov002_021ff2b8(self, self->f2.p);
    d = func_ov002_021bc288(self->f2.p, self->f2.b5);
    if (c + d < 2) return 0;
    return (unsigned int)*(int *)(data_ov002_022cf17c + (self->f2.p & 1) * 0x868) >= 2;
}
