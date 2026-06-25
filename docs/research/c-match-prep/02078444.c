/* CAMPAIGN-PREP candidate for func_02078444 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     arg-swap TAIL CALL veneer
 *   risk:       return type (void* vs void) and tail-call lowering may add a frame instead of bx ip
 *   confidence: high
 */
/* func_02078444: arg-swap tail-call veneer to func_02094688 (memcpy).
 * Identical to func_0207842c; swaps r0<->r1 and tail-calls.
 */

extern void *func_02094688(void *dst, const void *src, int n);

void *func_02078444(const void *src, void *dst, int n) {
    return func_02094688(dst, src, n);
}
