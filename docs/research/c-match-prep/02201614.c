/* CAMPAIGN-PREP candidate for func_02201614 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0:1 + 0xcec eq-guard, mul-table bit25 tst, !=0 tail
 *   risk:       early-return guards (movne/ldmneia) may predicate inline vs orig branch; reshape-able via guard order, else permuter-class on the predicate/branch coin-flip
 *   confidence: med
 */
/* func_ov002_02201614 (ov002, class C) — batch p_0081.
 * Guard chain: bit0==global(cec), global(d0)&1, query 021ff3bc, table bit25, tail 021b3ecc.
 * Conventions inherited from sibling prep (021ff570/0220599c/021ff738).
 */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };

extern char data_ov002_022d016c[];
extern char data_ov002_022cf288[];
extern int func_ov002_021ff3bc(struct Ov002Self *self);
extern int func_ov002_021b3ecc(int hw, int tag);

int func_ov002_02201614(struct Ov002Self *self, int arg1) {
    if (arg1 != 0) return 0;
    if (*(int *)(data_ov002_022d016c + 0xcec) != self->b0) return 0;
    if (*(int *)(data_ov002_022d016c + 0xd0) & 1) return 0;
    if (func_ov002_021ff3bc(self) == 0) return 0;
    if (((*(int *)(data_ov002_022cf288 + (self->b0 & 1) * 0x868) >> 25) & 1) == 0)
        return 0;
    return func_ov002_021b3ecc(self->f0, 0xb) != 0;
}
