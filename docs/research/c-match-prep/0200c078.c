/* CAMPAIGN-PREP candidate for func_0200c078 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     equality-first early-return; unsigned < / > by mode; fixed-order flag stores in tail
 *   risk:       conditional-return idiom (moveq;bxeq / movhi;bxhi, no stack frame) is mwcc's choice; it may instead branch or emit a {r3,lr} frame. The +0x18 element-ptr / stride 0x20 are struct-guessed. permuter-class/struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0200c078 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe:     equality-first early return; unsigned mode 1=less/2=greater; fixed-order flag-store tail
 *   risk:       see risk note
 */
/* func_0200c078: compare element field against val by mode; on no-match-condition
   record val/idx, set a status bit, raise a global flag; return 1. */

extern unsigned char data_021040ac[];

int func_0200c078(void *a, int idx, unsigned int val, int mode)
{
    unsigned int v = *(unsigned int *)(*(char **)((char *)a + 0x18) + idx * 0x20 + 0x18);
    if (v == val) return 1;
    if (mode == 1) {
        if (v < val) return 1;
    } else if (mode == 2) {
        if (v > val) return 1;
    }
    *(unsigned int *)((char *)a + 0x25c) = val;
    *(int *)((char *)a + 0x260) = idx;
    *(unsigned int *)((char *)a + 0x7c) |= 0x4000000;
    *(int *)(data_021040ac + 0x20) = 1;
    return 1;
}
