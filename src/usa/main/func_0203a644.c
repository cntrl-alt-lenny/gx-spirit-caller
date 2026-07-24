/* CAMPAIGN-PREP candidate for func_0203a644 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain: null checks + deref + tail call (return F(...))
 *   risk:       func_020891dc return assumed int* (deref'd); tail call should match the final bl;ldmia
 *   confidence: high
 */
/* func_0203a644 - resolve a1, gate on inner, tail-call func_0203a584 */

extern int *func_020891dc(int a1);
extern int  func_020394ec(int x, int mode, int a2);
extern int  func_0203a584(int a0, int a1, int a2);

int func_0203a644(int a0, int a1, int a2)
{
    int *p = func_020891dc(a1);
    if (p == 0)
        return 0;
    if (func_020394ec(*p, 1, a2) == 0)
        return 0;
    return func_0203a584(a0, a1, a2);
}
