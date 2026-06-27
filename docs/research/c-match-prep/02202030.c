/* CAMPAIGN-PREP candidate for func_02202030 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0==cec moveq-guard, cf8==3, signed/unsigned cmp guards, mul-table, !=0 tail
 *   risk:       table cmp uses movcc (unsigned <2); the bit0 (movne via cmp r3,ip,lsr#0x1f vs and+mul index) loads twice — orig reloads [r4,#2]. reshape-able (separate reads), residual predicate coin-flip permuter-class
 *   confidence: med
 */
/* func_ov002_02202030 (ov002, class C) — batch p_0081.
 * bit0==global(cec) ->0; global(cf8)==3 else 0; 021ff2b8>=2 else 0; mul-table
 * (cf17c) >=2 else 0; 021ca2b8!=0 else 0; tail 021c9df0(bit0)!=0.
 */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };

extern char data_ov002_022d016c[];
extern char data_ov002_022cf17c[];
extern int func_ov002_021ff2b8(struct Ov002Self *self);
extern int func_ov002_021ca2b8(struct Ov002Self *self);
extern int func_ov002_021c9df0(int bit);

int func_ov002_02202030(struct Ov002Self *self) {
    if (*(int *)(data_ov002_022d016c + 0xcec) == self->b0) return 0;
    if (*(int *)(data_ov002_022d016c + 0xcf8) != 3) return 0;
    if (func_ov002_021ff2b8(self) < 2) return 0;
    if ((unsigned int)*(int *)(data_ov002_022cf17c + (self->b0 & 1) * 0x868) < 2)
        return 0;
    if (func_ov002_021ca2b8(self) == 0) return 0;
    return func_ov002_021c9df0(self->b0) != 0;
}
