/* CAMPAIGN-PREP candidate for func_0228bb58 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: arg1 bitword loaded before self (load-order); bit0 :1 equality; b5_9 via :5 bitfield (lsl26/lsr27); k>4 movhi#0 then andls tail
 *   risk:       orig folds the tail into predication: cmp k,#4; movhi r0,#0; ldrls/ldrls/andls (no branch), and reads arg1->[2] before self->[2]. reshape-able if order holds; near-miss risk is mwcc branching the k>4 case instead of predicating (movhi/ldrls). permuter-class if it branches.
 *   confidence: med
 */
/* func_ov002_0228bb58 (ov002, cls D): leaf predicate. self=r0, arg1=r1.
 *   if (arg1 == 0) return 0;
 *   if (arg1->bit0 == self->bit0) return 0;   (arg1 loaded first, then self)
 *   k = arg1->b5_9;                            lsl26;lsr27 = bits 5..9 (:5)
 *   if (k > 4) return 0;
 *   return *(int*)(d016c + 0xd0) & 1;
 */
typedef unsigned short u16;
struct S0228bb58 { u16 f0; u16 bit0:1; u16 b1_4:4; u16 b5_9:5; u16 rest:6; };
extern char data_ov002_022d016c[];
int func_ov002_0228bb58(struct S0228bb58 *self, struct S0228bb58 *arg1) {
    int k;
    if (arg1 == 0) return 0;
    if (arg1->bit0 == self->bit0) return 0;
    k = arg1->b5_9;
    if (k > 4) return 0;
    return *(int *)(data_ov002_022d016c + 0xd0) & 1;
}
