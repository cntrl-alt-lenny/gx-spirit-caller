/* CAMPAIGN-PREP candidate for func_02296814 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dual-bitfield index; reuse b0(r0)+idx5(r1) live into func_021be4a0 call
 *   risk:       permuter-class: orig keeps b0 in r0 and idx5 in r1 LIVE across the ldrh/cmp into the func_021be4a0(b0,idx5,1) call; mwcc may reload, shifting 2-3 regs
 *   confidence: med
 */
typedef unsigned short u16;

struct S02296814 {
    u16 f0;
    u16 b0 : 1;
    u16 idx5 : 5;
    u16 rest : 10;
};

extern char data_ov002_022cf1a2[];
extern int func_ov002_02259f74(unsigned int bit);
extern int func_ov002_021be4a0(unsigned int bit, unsigned int idx, unsigned int k);
extern int func_ov002_021bbd14(unsigned int bit, int k);

int func_ov002_02296814(struct S02296814 *self) {
    if (func_ov002_02259f74(self->b0) == 0) return 0;
    if (*(u16 *)(data_ov002_022cf1a2 + (self->b0 & 1) * 0x868 + self->idx5 * 0x14) != 0) return 0;
    if (func_ov002_021be4a0(self->b0, self->idx5, 1) == 0) return 0;
    return func_ov002_021bbd14(self->b0, 0x195a) > 0;
}
