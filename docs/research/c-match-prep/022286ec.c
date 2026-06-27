/* CAMPAIGN-PREP candidate for func_022286ec (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     unpack lo/mid/hi in asm order (r1=u16,r3=hi,r2=mid,r4=lo,r5=hi); mla (lo&1)*0x868 base; +0x18+0x400+hi*4
 *   risk:       Three-way unpack order (r3=v>>16, r2=mid, r4=lo, r5=hi via r1 lanes) is fragile; mwcc may reorder the and/lsr lanes → reg numbering diverges. permuter-class.
 *   confidence: low
 */
// func_ov002_022286ec — ov002 EUR, class C
// unpack 021b947c return into r4(lo)/r5(hi byte), gate on ==0xe, mla base + 0x418 + f5*4

typedef struct Obj Obj;
struct Obj {
    unsigned short f0;       // +0x0
    unsigned short b0 : 1;    // +0x2 bit0
    unsigned short pad2 : 15;
    unsigned short f4, f6, f8, fa, fc, fe;
    unsigned short f10, f12;
    int            f14;      // +0x14
};

extern int func_ov002_021ff3bc(Obj *);
extern int func_ov002_021b947c(int);
extern int func_0202e234(int);
extern int func_ov002_021c33e4(Obj *, int, int, int);
extern int func_ov002_0227adb8(int, int, int, int);
extern unsigned short data_ov002_022d0250[];
extern unsigned char data_ov002_022cf16c[];

int func_ov002_022286ec(Obj *self)
{
    int v, lo, mid, hi;

    if (func_ov002_021ff3bc(self) == 0)
        return 0;

    v   = func_ov002_021b947c(self->f14);
    lo  = v & 0xff;
    mid = ((v << 0x10) >> 0x10 >> 8) & 0xff;
    hi  = (unsigned)v >> 0x10;
    if (mid != 0xe)
        return 0;

    {
        int t = data_ov002_022d0250[self->f14 * 2];
        if (func_0202e234((t << 0x13) >> 0x13) == 0)
            return 0;
    }
    if (func_ov002_021c33e4(self, self->b0, lo, hi) == 0)
        return 0;

    {
        unsigned char *base = data_ov002_022cf16c + (lo & 1) * 0x868;
        func_ov002_0227adb8(self->b0,
                            (int)(base + 0x18 + 0x400 + hi * 4),
                            1,
                            (int)(self->f0 << 0x10));
    }
    return 0;
}
