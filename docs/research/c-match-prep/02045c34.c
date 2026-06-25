/* CAMPAIGN-PREP candidate for func_02045c34 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     arg-caching across calls + sequential call/shuffle
 *   risk:       exact callee-saved register numbers (r4..r7) assigned to a0..a3 may permute vs the asm
 *   confidence: high
 */
/* func_02045c34: cache all four args (callee-saved across 3 calls), compute
 * x = func_020ab088(a2,0), then func_02045c7c(a0,a1,x,a3), then
 * func_020aaddc(a2). a2 reused (1st+3rd call) -> held in one callee-saved reg. */

extern int  func_020ab088(int a, int b);
extern void func_02045c7c(int a0, int a1, int x, int a3);
extern void func_020aaddc(int a);

void func_02045c34(int a0, int a1, int a2, int a3) {
    int x = func_020ab088(a2, 0);
    func_02045c7c(a0, a1, x, a3);
    func_020aaddc(a2);
}
