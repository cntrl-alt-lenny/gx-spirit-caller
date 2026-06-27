/* CAMPAIGN-PREP candidate for func_020906dc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     inline shift twice (don't bind bit) so idx+8/1 CSE and re-shift after call; ret&bit operand ret-first
 *   risk:       reshape-able (bind-vs-reload): orig recomputes 1<<(idx+8) post-call from r5/r4 rather than preserving the composite. If mwcc keeps the bit in one callee-saved reg it emits and r1,r0,rN instead of r5,lsl r4 -> one-reg diff; inlining the shptr twice is the lever.
 *   confidence: med
 */
/* func_020906dc (main, cls C): sibling of 02090690 but masks the call's
 * return with (1<<(idx+8)) before the third store. The shift amount
 * (idx+8, r4) and the constant 1 (r5) are held callee-saved and the shift
 * is RECOMPUTED after the call (do NOT bind the composite bit to one local).
 * Store order: 6354, 635c, (call), 6358. */
extern int data_021a6354[];
extern int data_021a6358[];
extern int data_021a635c[];
extern unsigned int func_02090624(unsigned int bit);

void func_020906dc(int idx, int a, int b)
{
    *(int *)((char *)data_021a6354 + idx * 12) = a;
    *(int *)((char *)data_021a635c + idx * 12) = b;
    *(int *)((char *)data_021a6358 + idx * 12) =
        func_02090624(1U << (idx + 8)) & (1U << (idx + 8));
}
