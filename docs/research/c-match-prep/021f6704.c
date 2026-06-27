/* CAMPAIGN-PREP candidate for func_021f6704 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dispatch-order inversion (deb28 fallthrough), f12 :2 + bit0/fld5 bitfields
 *   risk:       struct-guessed: verified BYTE-EXACT at ov002 cflags (inverted if puts deb28 inline / d5b80 beq out-of-line exactly as orig). Only f12 (:2 @ bit12) layout to confirm vs real struct.
 *   confidence: high
 */
/* func_ov002_021f6704: f2.f12 selects one of two helper calls; return 1. cls D.
 * Orig branches the (f12==2) arm OUT of line and falls through the !=2 arm =>
 * write the condition INVERTED so 021deb28 is the fallthrough (dispatch-order
 * inversion, brief 356):
 *   if (f2.f12 != 2)  021deb28(f2.bit0, f2.fld5);
 *   else              021d5b80(f2.bit0, 0xb, f0, 0);
 *   return 1; */
typedef unsigned short u16;

extern int func_ov002_021deb28(int bit0, int fld5);
extern int func_ov002_021d5b80(int bit0, int a, int f0, int c);

struct F021f6704_F2 {
    u16 bit0 : 1;
    u16 fld5 : 5;
    u16 mid6 : 6;
    u16 f12  : 2;
    u16 hi2  : 2;
};
struct F021f6704 {
    u16 f0;
    struct F021f6704_F2 f2;
};

int func_ov002_021f6704(struct F021f6704 *self) {
    if (self->f2.f12 != 2)
        func_ov002_021deb28(self->f2.bit0, self->f2.fld5);
    else
        func_ov002_021d5b80(self->f2.bit0, 0xb, self->f0, 0);
    return 1;
}
