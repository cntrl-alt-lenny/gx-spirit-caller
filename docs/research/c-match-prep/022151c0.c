/* CAMPAIGN-PREP candidate for func_022151c0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit2 gate; rsb (1-bit0) player; state dispatch; eq-compare; composite + (tag<<4)|1 packs
 *   risk:       permuter-class: dense pack juggling -- orig threads r4(=021c93f0 result), (1-bit0), tag, and the dword composite through r0-r3 with strict ordering; composite needs add-with-lsr#31 fusion. struct-guessed: d016c[0xcec]/cf178 stride/d0e6c[0xb0] offsets.
 *   confidence: low
 */
/* func_ov002_022151c0: gate self->f4 bit2 -> 0. Read data_022ce288[0x5a8] (int).
 * ==0x80: idx=(1-bit0)&1; if data_022d016c[idx*data_022cf178]==0 return 0; else
 * func_0226af78((1-bit0),0); return 0x7f. ==0x7f: r4=func_021c93f0((1-bit0),0xb,
 * data_022d0e6c[0xb0]); eq=(data_022d016c[0xcec]==bit0); tag=((eq+6)&0xff); load
 * r4-dword, build composite ((d<<2>>24)<<1)|bit13 and ((tag<<4)|1), call
 * func_021e276c((1-bit0), self->f0, (tag<<4)|1, composite); then
 * func_021d7b44((1-bit0), r4, 0x81). Returns 0. */

typedef unsigned short u16;

struct Self022151c0 {
    u16 f0;
    u16 bit0 : 1;     /* +2 */
    u16 _f4lo : 2;    /* +4 bits0-1 */
    u16 b2 : 1;       /* +4 bit2 */
};

extern int  data_ov002_022ce288[];
extern int  data_ov002_022cf178[];
extern int  data_ov002_022d016c[];
extern int  data_ov002_022d0e6c[];
extern int  func_ov002_021c93f0(int player, int k, int v);
extern void func_ov002_0226af78(int player, int z);
extern void func_ov002_021e276c(int player, int f0, int packA, int packB);
extern void func_ov002_021d7b44(int player, int r, int code);

int func_ov002_022151c0(struct Self022151c0 *self) {
    int state;
    if (self->b2) return 0;
    state = data_ov002_022ce288[0x5a8 / 4];
    if (state == 0x80) {
        int idx = (1 - self->bit0) & 1;
        if (data_ov002_022d016c[idx * data_ov002_022cf178[0] / 4] == 0) return 0;
        func_ov002_0226af78(1 - self->bit0, 0);
        return 0x7f;
    }
    if (state == 0x7f) {
        int r, eq, tag, packA, packB;
        unsigned int d;
        r = func_ov002_021c93f0(1 - self->bit0, 0xb, *(u16 *)((char *)data_ov002_022d0e6c + 0xb0));
        eq = (data_ov002_022d016c[0xcec / 4] == self->bit0) ? 1 : 0;
        tag = (eq + 6) & 0xff;
        d = *(unsigned int *)r;
        packA = ((tag << 4) | 1);
        packB = (int)(((d << 2) >> 24) << 1) + (int)((d << 18) >> 31);
        func_ov002_021e276c(1 - self->bit0, self->f0, (u16)packA, (u16)packB);
        func_ov002_021d7b44(1 - self->bit0, r, 0x81);
        return 0;
    }
    return 0;
}
