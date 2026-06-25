/* CAMPAIGN-PREP candidate for func_0222800c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     field@2 split into :1 + :5 bitfields (lsl#1a;lsr#1b); lo&0xff before hi; mvn=-1
 *   risk:       field@2 second extract is lsl#0x1a;lsr#0x1b = bits[5:1] width 5 → guessed :5 bitfield offset; if real layout differs the masks change. struct-guessed.
 *   confidence: med
 */
// func_ov002_0222800c — ov002 EUR, class C
// guard on field@0xc, byte-split r4/r5, two bitfields of field@2, two 021d91e0 calls

typedef struct Obj Obj;
struct Obj {
    unsigned short f0;          // +0x0
    unsigned short b0 : 1;       // +0x2 bit0
    unsigned short f1 : 5;       // +0x2 bits[5:1]
    unsigned short pad2 : 10;
    unsigned short f4;          // +0x4
    unsigned short f6, f8, fa;
    unsigned short fc;          // +0xc
};

extern int func_ov002_0223df38(Obj *, int, int);
extern int func_ov002_0223de94(Obj *, int);
extern int func_ov002_0225764c(Obj *, int, int);
extern int func_ov002_021b9e00(int, int);
extern int func_ov002_021d91e0(int, int, int);

int func_ov002_0222800c(Obj *self)
{
    int v, lo, hi;

    if (self->fc == 0)
        return 0;
    if (func_ov002_0223df38(self, 0, 0) == 0)
        return 0;

    v = func_ov002_0223de94(self, 0);
    lo = v & 0xff;
    hi = ((v << 0x10) >> 0x10 >> 8) & 0xff;
    if (func_ov002_0225764c(self, lo, hi) == 0)
        return 0;

    if (func_ov002_021b9e00(self->b0, self->f1) == 0)
        return 0;

    func_ov002_021d91e0(self->b0, self->f1, -1);
    func_ov002_021d91e0(lo, hi, 1);
    return 0;
}
