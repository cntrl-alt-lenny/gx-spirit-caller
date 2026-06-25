/* CAMPAIGN-PREP candidate for func_022274d8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 as :1 bitfield (lsl;lsr); separate ldrh reads; if-chain switch; rsb=1-b
 *   risk:       The .L_a0 byte-split of data_022d0e6c@0xb0 (ldrh then asr#8/&0xff) may differ if mwcc picks different load widths; reshape-able via explicit short-load temps.
 *   confidence: med
 */
// func_ov002_022274d8 — ov002 EUR, class C
// two-call compare on bit0 of field@2, then state switch on global[0x5a8]

typedef struct Obj Obj;
struct Obj {
    unsigned short f0;        // +0x0
    unsigned short b0 : 1;     // +0x2 bit0
    unsigned short pad2 : 15;
};

extern int  func_ov002_021bbf50(int);
extern int  func_ov002_021de4b0(Obj *, int, int);
extern int  func_ov002_02257878(Obj *, void *);
extern int  func_ov002_0226b034(int, unsigned short, int);

extern int  func_ov002_021e96a0(void);
extern int  data_ov002_022ce288[];
extern unsigned char data_ov002_022d0e6c[];

int func_ov002_022274d8(Obj *self)
{
    int a, b, st;

    a = func_ov002_021bbf50(1 - self->b0);
    b = func_ov002_021bbf50(self->b0);
    if (a <= b)
        return 0;

    st = data_ov002_022ce288[0x5a8 / 4];
    if (st == 0x7e) {
        int lo = data_ov002_022d0e6c[0xb0];
        int hi = (int)((unsigned short *)data_ov002_022d0e6c)[0xb0 / 2] >> 8;
        func_ov002_021de4b0(self, lo & 0xff, hi & 0xff);
        return 0x7f;
    }
    if (st == 0x7f) {
        if (func_ov002_02257878(self, func_ov002_021e96a0) == 0)
            return 0;
        func_ov002_0226b034(1 - self->b0, self->f0, 0);
        return 0x7e;
    }
    if (st == 0x80)
        return 0x7f;
    return 0;
}
