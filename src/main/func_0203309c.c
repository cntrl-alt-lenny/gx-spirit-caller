/* CAMPAIGN-PREP candidate for func_0203309c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard/branch-tail; save args to callee-saved; constant returns
 *   risk:       func_02053114 arg may be unused (r0=entry leftover); otherwise structurally exact
 *   confidence: high
 */
/* func_0203309c — branch dispatch wrapper, returns 0/1 */

extern int  func_02053114(void *a);
extern void func_02052c38(void *a);
extern void func_02052ff4(void *a);
extern void func_02053158(void *a, void *b);

int func_0203309c(void *a, void *b)
{
    if (func_02053114(a)) {
        func_02052c38(a);
        return 0;
    }
    func_02053158(a, b);
    func_02052ff4(a);
    func_02052c38(a);
    return 1;
}
