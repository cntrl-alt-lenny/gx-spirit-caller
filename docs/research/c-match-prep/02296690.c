/* CAMPAIGN-PREP candidate for func_02296690 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dual-bitfield b0:1/idx5:5, &1 on index, mla base + idx*0x14 ldrh
 *   risk:       reshape-able: index mla forms `base + b0*0x868 + idx5*0x14` as one ptr expr (don't bind base); if mwcc reorders the two mul/mla addends, swap idx5*0x14 vs (b0&1)*0x868 source order
 *   confidence: med
 */
typedef unsigned short u16;

struct S02296690 {
    u16 f0;
    u16 b0 : 1;
    u16 idx5 : 5;
    u16 rest : 10;
};

extern char data_ov002_022cf1a2[];
extern int func_ov002_02259f74(unsigned int bit);
extern int func_ov002_022576d8(struct S02296690 *self);
extern int func_ov002_0228d0ac(unsigned int bit, int n, int flag);

int func_ov002_02296690(struct S02296690 *self) {
    int n;
    if (func_ov002_02259f74(self->b0) == 0) return 0;
    if (*(u16 *)(data_ov002_022cf1a2 + (self->b0 & 1) * 0x868 + self->idx5 * 0x14) != 0) return 0;
    n = func_ov002_022576d8(self);
    return func_ov002_0228d0ac(self->b0, n, 1) >= 0;
}
