/* CAMPAIGN-PREP candidate for func_0200c284 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     comparator clone; idx*0xc -> mla index, field +8; fixed-order flag stores in tail
 *   risk:       orig uses a {r3,lr} stack frame with ldm{eq,hi}ia conditional returns (unlike c078's bx lr); whether mwcc picks frame-return vs bx-lr is a routing/leaf coin-flip. base +0x1c / stride 0xc struct-guessed. permuter-class/struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0200c284 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe:     same comparator as c078 but stride 0xc (mla) field +8; offsets 0x264/0x268, bit 0x8000000
 *   risk:       see risk note
 */
/* func_0200c284: compare element field against val by mode; on no-match-condition
   record val/idx, set a status bit, raise a global flag; return 1. */

extern unsigned char data_021040ac[];

int func_0200c284(void *a, int idx, unsigned int val, int mode)
{
    unsigned int v = *(unsigned int *)(*(char **)((char *)a + 0x1c) + idx * 0xc + 0x8);
    if (v == val) return 1;
    if (mode == 1) {
        if (v < val) return 1;
    } else if (mode == 2) {
        if (v > val) return 1;
    }
    *(unsigned int *)((char *)a + 0x264) = val;
    *(int *)((char *)a + 0x268) = idx;
    *(unsigned int *)((char *)a + 0x7c) |= 0x8000000;
    *(int *)(data_021040ac + 0x20) = 1;
    return 1;
}
