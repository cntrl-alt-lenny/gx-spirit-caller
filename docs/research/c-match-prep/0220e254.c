/* CAMPAIGN-PREP candidate for func_0220e254 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D linear guard chain: 1st guard signed `<0` (movlt); 021ca698(b0,b0); parity-select cf17c
 *   risk:       struct-guessed: codegen byte-EXACT (156B). Only inferred is the sig shapes — 021c2e34(b0, *(u16*)self+0) returns SIGNED (<0 guard), 021ca698 takes b0 twice, 021ff3bc(self,arg1). Confirm those callee signatures.
 *   confidence: high
 */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4; };
extern int  data_ov002_022cf17c[];
extern int  func_ov002_021c2e34(int bit0, int h);
extern int  func_ov002_021ca698(int bit0, int bit0b);
extern int  func_ov002_021ff3bc(struct Ov002Self *self, int arg1);
int func_ov002_0220e254(struct Ov002Self *self, int arg1) {
    unsigned int v;
    if (func_ov002_021c2e34(self->b0, *(u16 *)self) < 0) return 0;
    if (func_ov002_021ca698(self->b0, self->b0) == 0) return 0;
    v = *(unsigned int *)((char *)data_ov002_022cf17c + (self->b0 & 1) * 0x868);
    if (v == 0) return 0;
    return func_ov002_021ff3bc(self, arg1) != 0;
}
