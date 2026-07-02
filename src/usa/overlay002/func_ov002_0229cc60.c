/* CAMPAIGN-PREP candidate for func_0229cd70 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     arg-swap (r0<->r1) tail-call veneer
 *   risk:       tail-call lowering may emit a frame instead of ldr ip;bx ip; return type guessed int
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229cc60 (ov002, class A).
 *   recipe:  arg-swap TAIL CALL veneer (r0<->r1; r2/r3 pass through)
 *   risk:    return type (void* vs int) and tail-call lowering could add a
 *            frame instead of the ldr ip / bx ip veneer
 *   confidence: high
 */

extern int func_02094688(int a, int b, int c, int d);

int func_ov002_0229cc60(int a, int b, int c)
{
    return func_02094688(b, a, c, a);
}
