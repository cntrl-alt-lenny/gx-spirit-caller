/* CAMPAIGN-PREP candidate for func_02054c78 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     drop dead leading args + helper call + tail call constants
 *   risk:       func_02054ea8 return assumed int; *a4 deref is word; dead args must emit no code
 *   confidence: high
 */
/* func_02054c78: leading args a0..a2 are dead (positional only). Use a3
 * and the 5th (stack) arg a4: call func_020945f4(a3, 0, *a4), then tail
 * func_02054ea8(0, -1). */

extern void func_020945f4(int a0, int a1, int a2);
extern int  func_02054ea8(int a0, int a1);

int func_02054c78(int a0, int a1, int a2, int a3, int *a4) {
    func_020945f4(a3, 0, *a4);
    return func_02054ea8(0, -1);
}
