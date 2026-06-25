/* CAMPAIGN-PREP candidate for func_02089b64 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD + conditional call + tail-call return
 *   risk:       All four args cached to callee-saved; reg-alloc of cached args could differ but order matches asm.
 *   confidence: high
 */
/* func_02089b64: guard then conditional call, then tail-style final call.
 *
 *   r7=p0(r0), r6=p1(r1), r5=p2(r2), r4=p3(r3)
 *   r0 = func_02095de0(p2, p3)
 *   if (p0 == r0) func_02095e28(p2, p3, 0)
 *   return func_02094e0c(p0, p0 + p1)
 */

extern int func_02095de0(int a, int b);
extern void func_02095e28(int a, int b, int c);
extern int func_02094e0c(int a, int b);

int func_02089b64(int p0, int p1, int p2, int p3) {
    if (p0 == func_02095de0(p2, p3)) {
        func_02095e28(p2, p3, 0);
    }
    return func_02094e0c(p0, p0 + p1);
}
