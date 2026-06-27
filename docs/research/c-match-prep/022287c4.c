/* CAMPAIGN-PREP candidate for func_022287c4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0@2 reloaded each guard (separate ldrh); f4 field (lsl#11;lsr#17)=bits[8:1]; movs r4;bmi=signed<0; mla (b0&1)*0x868
 *   risk:       field@2 bit0 is re-ldrh'd before every call (4x) not bound; if mwcc CSEs it into one reg, 4 ldrh collapse to 1. Reshape-able: leave self->b0 inline (already) — but mwcc may still hoist.
 *   confidence: med
 */
// func_ov002_022287c4 — ov002 EUR, class C
// two guards on bit0@2, 021b99b4 returns r4(signed, bmi), mla base + 0x418 + r4*4

typedef struct Obj Obj;
struct Obj {
    unsigned short f0;        // +0x0
    unsigned short b0 : 1;     // +0x2 bit0
    unsigned short pad2 : 15;
    unsigned short f4;        // +0x4 bits[8:1] used
};

extern int func_ov002_021bc618(int);
extern int func_ov002_021ca2b8(int);
extern int func_ov002_021b99b4(int, int);
extern int func_ov002_021c33e4(Obj *, int, int);
extern int func_ov002_0227adb8(int, int, int, int);
extern unsigned char data_ov002_022cf16c[];

int func_ov002_022287c4(Obj *self)
{
    int r4;

    if (func_ov002_021bc618(self->b0) == 0)
        return 0;
    if (func_ov002_021ca2b8(self->b0) == 0)
        return 0;

    r4 = func_ov002_021b99b4(self->b0, (self->f4 << 0x11) >> 0x17);
    if (r4 < 0)
        return 0;

    if (func_ov002_021c33e4(self, self->b0, r4) == 0)
        return 0;

    {
        unsigned char *base = data_ov002_022cf16c + (self->b0 & 1) * 0x868;
        func_ov002_0227adb8(self->b0,
                            (int)(base + 0x18 + 0x400 + r4 * 4),
                            1,
                            (int)(self->f0 << 0x10));
    }
    return 0;
}
