/* CAMPAIGN-PREP candidate for func_02033048 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard/branch-tail; save args to callee-saved; constant returns
 *   risk:       func_020530a0 arg may be unused (r0=entry leftover); otherwise structurally exact
 *   confidence: high
 */
/* func_02033048 — branch dispatch wrapper, returns 0/1 */

extern int  func_020530a0(void *a);
extern void func_02052bc4(void *a);
extern void func_02052f80(void *a);
extern void func_020530e4(void *a, void *b);

int func_02033048(void *a, void *b)
{
    if (func_020530a0(a)) {
        func_02052bc4(a);
        return 0;
    }
    func_020530e4(a, b);
    func_02052f80(a);
    func_02052bc4(a);
    return 1;
}
