/* CAMPAIGN-PREP candidate for func_02203738 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     b6/b0 bitfields; rsb (1-bit0)&1 for mul index; signed > compare (cmp;movgt;movle)
 *   risk:       orig builds the 0xbb8 threshold as 0x868(pooled)+0x350 to reuse the stride literal; mwcc will likely load 0xbb8 directly (one pool word) instead of add r0,#0x350. reshape-able-ish but probably permuter-class (literal-reuse peephole).
 *   confidence: med
 */
/* func_ov002_02203738 (cls D): self->b6 (h2 bits6..11)==0x23 -> return 1; else
 * player=(1 - self->b0)&1, read *(int*)(cf16c + player*0x868) (offset 0), return
 * (x > 0xbb8) ? 1 : 0. rsb=1-bit0; orig builds 0xbb8 by reusing the 0x868 literal. */
typedef unsigned short u16;
struct self_t { u16 f0; u16 b0 : 1; u16 :5; u16 b6 : 6; };
extern char data_ov002_022cf16c[];
int func_ov002_02203738(struct self_t *self) {
    int player;
    if (self->b6 == 0x23)
        return 1;
    player = (1 - self->b0) & 1;
    return *(int *)(data_ov002_022cf16c + player * 0x868) > 0xbb8;
}
