/* CAMPAIGN-PREP candidate for func_02214738 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     per-player 0x868 base + idx5*20 slot; asymmetric-shift composite; byte-pack (u8)lo|(hi<<8)
 *   risk:       permuter-class: composite ((d<<2>>24)<<1)|((d<<18)>>31) relies on mwcc fusing <<1 with add r1,lsr#31; reg-alloc of mla base+5-field is allocation-order sensitive. struct-guessed: fc/f4 offsets.
 *   confidence: low
 */
/* func_ov002_02214738: switch on self->fc (u16 +0xc). ==1 -> tail func_0220e74c().
 * ==2 -> resolve per-player slot row (base cf16c + bit0*0x868, sub-row idx5*20 at
 * +0x30), reconstruct a composite ((dword<<2>>24)<<1)|bit13 and compare to
 * self->f4 field (bits14:8); if !=, return 0. Else func_0223df38(self,0,0) guard,
 * func_0223de94(self,0) pair-unpack -> (lo,hi) byte split, func_0225764c guard,
 * then re-pack self->f2 (bit0 + bits5:1) and func_021d5f2c(self, packed16).
 * Returns 0. */

typedef unsigned short u16;
typedef unsigned char  u8;

struct Slot02214738 { u16 f0; u16 bit0 : 1; u16 idx5 : 5; };
struct Self02214738 {
    u16 f0;
    struct Slot02214738 f2;   /* +2 */
    u16 f4;                   /* +4 */
    u16 _p;
    u16 fc;                   /* +0xc */
};

extern char data_ov002_022cf16c[];
extern int  func_ov002_0220e74c(void);
extern int  func_ov002_0223df38(struct Self02214738 *self, int b, int c);
extern int  func_ov002_0223de94(struct Self02214738 *self, int idx);
extern int  func_ov002_0225764c(struct Self02214738 *self, int lo, int hi);
extern int  func_ov002_021d5f2c(struct Self02214738 *self, int packed);

int func_ov002_02214738(struct Self02214738 *self) {
    u16 sel = self->fc;
    if (sel == 1) return func_ov002_0220e74c();
    if (sel == 2) {
        unsigned int d;
        int comp, fld, ret, lo, hi, packed;
        char *base = data_ov002_022cf16c + (self->f2.bit0 & 1) * 0x868;
        d = *(unsigned int *)(base + 0x30 + self->f2.idx5 * 20);
        comp = (int)(((d << 2) >> 24) << 1) + (int)(d >> 31 << 0);
        comp = (int)((((d << 2) >> 24) << 1)) + (int)((d << 18) >> 31);
        fld = ((unsigned int)(self->f4 << 17)) >> 23;
        if (fld != comp) return 0;
        if (func_ov002_0223df38(self, 0, 0) == 0) return 0;
        ret = func_ov002_0223de94(self, 0);
        lo = ret & 0xff;
        hi = ((unsigned int)(ret << 16) >> 16) >> 8 & 0xff;
        if (func_ov002_0225764c(self, lo, hi) == 0) return 0;
        packed = ((self->f2.bit0 & 0xff) | (((self->f2.idx5) & 0xff) << 8));
        func_ov002_021d5f2c(self, (u16)packed);
    }
    return 0;
}
