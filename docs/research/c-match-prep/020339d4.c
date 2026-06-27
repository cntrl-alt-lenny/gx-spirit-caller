/* CAMPAIGN-PREP candidate for func_020339d4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: reload count in cond; mvneq;andeq bit-clear (no early ret)
 *   risk:       Orig clears bit via predicated mvneq/andeq (no branch); an `if{mask&=~..}` may emit a branch instead of conditional. Reshape-able by keeping clear branchless-friendly, else permuter-class. count offset struct-guessed.
 *   confidence: med
 */
/* func_020339d4: simpler sibling of func_02033944 — no func_02052bc4 gate and
 * no early `return 0`. For each set bit i in [0,count) with i!=func_02046ac4():
 * if func_020469d0(i)==0 clear bit i. After loop return func_02052870(mask,b,c).
 * count (0xea0) reloaded each iteration.
 */
extern int func_020469d0(int i);
extern int func_02046ac4(void);
extern int func_02052870(unsigned int mask, int b, int c);

struct Obj_20339d4 {
    char pad[0xea0];
    unsigned int count;
};

int func_020339d4(struct Obj_20339d4 *self, unsigned int mask, int b, int c) {
    unsigned int i;
    if (self->count != 0) {
        for (i = 0; i < self->count; i++) {
            if (i == (unsigned int)func_02046ac4()) continue;
            if (!(mask & (1u << i))) continue;
            if (func_020469d0(i & 0xff) == 0) {
                mask &= ~(1u << i);
            }
        }
    }
    return func_02052870(mask, b, c);
}
