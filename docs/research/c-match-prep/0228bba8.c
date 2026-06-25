/* CAMPAIGN-PREP candidate for func_0228bba8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: 8-byte stack temp via out-param call; tmp[self->b0]; <0 if-assign
 *   risk:       tmp must stay at sp+0 (orig recomputes add r0,sp,#0 post-call); index by self->b0 :1. reshape-able: if int[2] mis-sized, switch sizing. struct-guessed: out-buffer is int[2].
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0228bba8 (ov002, class C, MED tier) — brief 0113.
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe:     Class C: 8-byte stack temp filled by out-param call; index tmp[self->b0]; <0 as if-assign (movlt/movge)
 *   risk:       0220eb00 out-param writes int[2] on stack; mwcc must keep the temp at sp+0 (it reloads add r0,sp,#0 after the call). reshape-able if a struct slot mis-sizes; struct-guessed: tmp is int[2], self->b0 is the :1 at +0x2.
 *   confidence: med
 */
typedef unsigned short u16;
struct Card { u16 f0; u16 b0 : 1; u16 : 15; };

extern void func_ov002_0220eb00(void *arg, int *out);

int func_ov002_0228bba8(struct Card *self, void *arg) {
    int tmp[2];
    if (arg == 0) return 0;
    func_ov002_0220eb00(arg, tmp);
    return tmp[self->b0] < 0;
}
