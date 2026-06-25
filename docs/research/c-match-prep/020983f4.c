/* CAMPAIGN-PREP candidate for func_020983f4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     tail-call thunk prepending a global pointer (A)
 *   risk:       reg-alloc-walled (currently ships as .s): the r0->r3->r1 shuffle and tail `bx ip` via pool rarely reproduce
 *   confidence: low
 */
/* func_020983f4: 2-arg -> 3-arg tail thunk that prepends &data_021a8334 as the
 * first argument: return func_020973fc(&data_021a8334, a, b). The original
 * loads the callee into ip and tail-branches (bx ip), shuffling r0->r3->r1.
 * (This function currently ships as hand .s -- reg-alloc-walled; C is a punt.) */

extern int  data_021a8334[];
extern int  func_020973fc(void *ctx, int a, int b);

int func_020983f4(int a, int b) {
    return func_020973fc(data_021a8334, a, b);
}
