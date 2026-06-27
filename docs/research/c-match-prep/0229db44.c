/* CAMPAIGN-PREP candidate for func_0229db44 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: mask=(1<<(idx&31))-1; signed /32 word; merge (v&mask)|(~mask&(v>>1)) operand-order; >>1 above
 *   risk:       orig hoists the /32 bias-add before the loop but recomputes asr#5 each iter in cmp r4,r1,asr#5; mwcc loop reg-alloc may hoist whole word or spill ip(~mask) differently. permuter-class
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229db44 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. recipe: bitmap "remove bit idx" over 4
 * words at +0xbc; mask=(1<<(idx&31))-1; at word idx/32 merge low|(rest>>1),
 * above word >>=1; dec +0xa4; tail call. signed /32 idiom. */
extern void func_ov002_0229d890(char *self, int a);

void func_ov002_0229db44(char *self, int idx) {
    unsigned int mask = (1u << (idx & 0x1f)) - 1;
    int word = idx / 32;
    int i;
    for (i = 0; i < 4; i++) {
        unsigned int *p = (unsigned int *)(self + i * 4 + 0xbc);
        if (i == word) {
            unsigned int v = *p;
            *p = (v & mask) | (~mask & (v >> 1));
        } else if (i > word) {
            *p = *p >> 1;
        }
    }
    *(int *)(self + 0xa4) = *(int *)(self + 0xa4) - 1;
    func_ov002_0229d890(self, *(int *)(self + 0xa8));
}
