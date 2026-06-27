/* CAMPAIGN-PREP candidate for func_02200310 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     kind==0x12; f14!=0; cd3f4.active==(1-bit0) via rsb; bind cd3f4.f1c arg
 *   risk:       struct-guessed: cd3f4 +0 (active) / +0x1c (f1c) offsets inferred. Otherwise reshape-able: `rsb r3,bit0,#1` => `1 - self->f2.bit0` on the compare RHS — keep bit0 as the rsb operand (not the global) so the cmp picks the same reg order.
 *   confidence: med
 */
/* func_ov002_02200310 (ov002, class C) — bitfield + global compare + rsb.
 * kind(bits6-11)==0x12 else 0; self->f14 !=0 else 0;
 * cd3f4.active == (1 - bit0) else 0; then 021c1ef0(cd3f4.f1c) bool. */
typedef unsigned short u16;

struct F02200310_F2 {
    u16 bit0 : 1;
    u16 b1_5 : 5;
    u16 kind : 6;
    u16 rest : 4;
};
struct F02200310_Self {
    u16 f0;
    struct F02200310_F2 f2;
    char _p[0x14 - 4];
    int f14;
};

struct G02200310 { int active; char _p[0x1c - 4]; int f1c; };
extern struct G02200310 data_ov002_022cd3f4;
extern int func_ov002_021c1ef0(int arg);

int func_ov002_02200310(struct F02200310_Self *self) {
    if (self->f2.kind != 0x12) return 0;
    if (self->f14 == 0) return 0;
    if (data_ov002_022cd3f4.active != 1 - self->f2.bit0) return 0;
    return func_ov002_021c1ef0(data_ov002_022cd3f4.f1c) != 0;
}
