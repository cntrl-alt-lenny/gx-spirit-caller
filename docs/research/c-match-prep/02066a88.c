/* CAMPAIGN-PREP candidate for func_02066a88 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     keep a,b first so they bind r5/r4 across calls; literal idx 0/1/2; arg-order preserved
 *   risk:       outgoing stack-arg marshalling: orig reuses the single [sp] slot and pairs ldr ip/[sp,#0x14]+ldr r3/[sp,#0x10] in that order; mwcc may schedule the incoming-stack-arg loads differently. permuter-class (arg load scheduling).
 *   confidence: med
 */
/* func_02066a88 - main - class C
 * 3 unrolled call blocks, 5-arg callee, one outgoing stack word
 * a,b held in callee-saved across all 3 calls (r5,r4)
 */
extern void func_02066ae8(int a, int b, int idx, int x, int y);

void func_02066a88(int a, int b, int c, int d, int e, int f, int g, int h)
{
    func_02066ae8(a, b, 0, c, d);
    func_02066ae8(a, b, 1, e, f);
    func_02066ae8(a, b, 2, g, h);
}
