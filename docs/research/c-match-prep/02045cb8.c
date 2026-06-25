/* CAMPAIGN-PREP candidate for func_02045cb8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     sequential calls + global stores + pooled-immediate arg
 *   risk:       low; preload order of the 0xfffe8515 pool word vs the daf0 store is scheduling-only
 *   confidence: high
 */
/* func_02045cb8: fire func_02062510, store func_02054bfc()'s result to a word
 * global, call func_0204525c(9, 0xfffe8515) (the constant comes from the pool),
 * then zero *data_0219daec (a global pointer). */

extern void func_02062510(void);
extern int  func_02054bfc(void);
extern void func_0204525c(int a, int b);
extern int  data_0219daf0;
extern int *data_0219daec;

void func_02045cb8(void) {
    func_02062510();
    data_0219daf0 = func_02054bfc();
    func_0204525c(9, 0xfffe8515);
    *data_0219daec = 0;
}
