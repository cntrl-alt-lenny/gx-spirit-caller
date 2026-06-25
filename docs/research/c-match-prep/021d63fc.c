/* CAMPAIGN-PREP candidate for func_021d63fc (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-tail forward; Ov002Self bit0 bitfield-compare as stacked arg
 *   risk:       5th stacked-arg slot or the !=  movne/moveq ordering may differ; f0 ldrh vs the compare eval order
 *   confidence: med
 */
/* func_ov002_021d63fc: forward (arg1,arg2,arg3, self->f0, arg1!=self->b0) to
 * func_021d6434; the 5th (stacked) arg is the bit0-compare computed first.
 * self->b0 = bit0 of the u16 at +2 (lsl#31;lsr#31 -> bitfield, folded into cmp). */

struct Ov002Self { unsigned short f0; unsigned short b0 : 1; };

extern int func_ov002_021d6434(int a, int b, int c, int d, int e);

int func_ov002_021d63fc(struct Ov002Self *self, int arg1, int arg2, int arg3) {
    return func_ov002_021d6434(arg1, arg2, arg3, self->f0, arg1 != self->b0);
}
