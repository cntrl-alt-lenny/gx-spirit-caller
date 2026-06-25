/* CAMPAIGN-PREP candidate for func_022005ac (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     kind==0x12; f14!=0; cd3f4==bit0 (no rsb); 021bbf50 guard; 021ff2b8(self,bit0) bool
 *   risk:       reshape-able: orig holds the first ldrh raw in r1 and reuses bit0 from it for BOTH the cd3f4 compare and the 021ff2b8 arg, but re-ldrh's before the call — declare locals first-used-first so raw stays in the callee reg; cd3f4 compare is `== bit0` (contrast 02200310's 1-bit0).
 *   confidence: med
 */
/* func_ov002_022005ac (ov002, class C) — bitfield + global compare chain + call.
 * kind(bits6-11)==0x12 else 0; self->f14 !=0 else 0; cd3f4.active == bit0 else 0;
 * 021bbf50() else 0; finally 021ff2b8(self, bit0) bool. */
typedef unsigned short u16;

struct F022005ac_F2 {
    u16 bit0 : 1;
    u16 b1_5 : 5;
    u16 kind : 6;
    u16 rest : 4;
};
struct F022005ac_Self {
    u16 f0;
    struct F022005ac_F2 f2;
    char _p[0x14 - 4];
    int f14;
};

extern int data_ov002_022cd3f4;
extern int func_ov002_021bbf50(void);
extern int func_ov002_021ff2b8(struct F022005ac_Self *self, int bit);

int func_ov002_022005ac(struct F022005ac_Self *self) {
    if (self->f2.kind != 0x12) return 0;
    if (self->f14 == 0) return 0;
    if (data_ov002_022cd3f4 != self->f2.bit0) return 0;
    if (func_ov002_021bbf50() == 0) return 0;
    return func_ov002_021ff2b8(self, self->f2.bit0) != 0;
}
