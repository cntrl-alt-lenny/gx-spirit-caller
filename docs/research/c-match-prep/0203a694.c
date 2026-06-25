/* CAMPAIGN-PREP candidate for func_0203a694 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain: null checks + deref + tail call (return F(...))
 *   risk:       func_020892c4 return assumed int* (deref'd); tail call should match the final bl;ldmia
 *   confidence: high
 */
/* func_0203a694 - resolve a1, gate on inner, tail-call func_0203a5d4 */

extern int *func_020892c4(int a1);
extern int  func_0203953c(int x, int mode, int a2);
extern int  func_0203a5d4(int a0, int a1, int a2);

int func_0203a694(int a0, int a1, int a2)
{
    int *p = func_020892c4(a1);
    if (p == 0)
        return 0;
    if (func_0203953c(*p, 1, a2) == 0)
        return 0;
    return func_0203a5d4(a0, a1, a2);
}
