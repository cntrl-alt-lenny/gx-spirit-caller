/* CAMPAIGN-PREP candidate for func_02205548 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfields :9/:2/bit0; arg1-first compare operand-order; final (&1)>0 not !=0 (movgt/movle)
 *   risk:       struct-guessed: f4 :9 (bits6-14) and f2 :2 (bits12-13) offsets inferred. Reshape-able fallback if compare order flips (arg1.bit0 first) or final '>0' regresses to movne.
 *   confidence: med
 */
/* func_ov002_02205548: cls D — bitfield compares + guard calls; clean predicate.
 * [self,#4] :9 field (bits6-14) -> 021ca5bc; arg1 null; arg1.bit0 vs self.bit0;
 * 0202e234(arg1->f0): if 0 require arg1.f2 bits12-13 ==0; then (021b6418(arg1)&1)>0.
 * arg1->bit0 loaded first -> arg1.bit0 == self.bit0 (operand order). */
typedef unsigned short u16;
struct F2_05548 { u16 bit0:1; u16 pad:11; u16 b12_13:2; u16 top:2; };
struct F4_05548 { u16 pad6:6; u16 b6_14:9; u16 top:1; };
struct S05548 { u16 f0; struct F2_05548 f2; struct F4_05548 f4; };
extern int func_0202e234(int id);
extern int func_ov002_021ca5bc(int v);
extern int func_ov002_021b6418(struct S05548 *arg1);
int func_ov002_02205548(struct S05548 *self, struct S05548 *arg1) {
    if (func_ov002_021ca5bc(self->f4.b6_14) == 0) return 0;
    if (arg1 == 0) return 0;
    if (arg1->f2.bit0 == self->f2.bit0) return 0;
    if (func_0202e234(arg1->f0) == 0) {
        if (arg1->f2.b12_13 != 0) return 0;
    }
    return (func_ov002_021b6418(arg1) & 1) > 0;
}
