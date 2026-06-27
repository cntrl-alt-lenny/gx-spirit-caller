/* CAMPAIGN-PREP candidate for func_02228a9c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     first arg=bit0@2 (lsl#1f;lsr#1f); f4 field bits[8:1]; movs ip;bmi=signed<0; mla (b0&1)*0x868+0x418+idx*4
 *   risk:       Return parked in ip (r12) via movs then re-derived bit0@2 reloaded for both mla mask and call arg; if mwcc binds bit0 to one reg the second ldrh@2 disappears. Reshape-able (inline field re-read).
 *   confidence: med
 */
// func_ov002_02228a9c — ov002 EUR, class C
// 021b99b4 -> ip (signed, bmi), mla (bit0&1)*0x868 base + 0x418 + ip*4, single call

typedef struct Obj Obj;
struct Obj {
    unsigned short f0;        // +0x0
    unsigned short b0 : 1;     // +0x2 bit0
    unsigned short pad2 : 15;
    unsigned short f4;        // +0x4 bits[8:1]
};

extern int func_ov002_021b99b4(int, int);
extern int func_ov002_021d7d0c(Obj *, int, int);
extern unsigned char data_ov002_022cf16c[];

int func_ov002_02228a9c(Obj *self)
{
    int idx;

    idx = func_ov002_021b99b4(self->b0, (self->f4 << 0x11) >> 0x17);
    if (idx < 0)
        return 0;

    {
        unsigned char *base = data_ov002_022cf16c + (self->b0 & 1) * 0x868;
        func_ov002_021d7d0c(self,
                            self->b0,
                            (int)(base + 0x18 + 0x400 + idx * 4));
    }
    return 0;
}
