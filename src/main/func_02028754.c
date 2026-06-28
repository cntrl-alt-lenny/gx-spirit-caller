/* CAMPAIGN-PREP candidate for func_02028754 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard + ordered call sequence; clean leaf
 *   risk:       none material; arg/return signatures inferred from r0 usage only
 *   confidence: high
 */
/* func_02028754 — guard then two paired call-pairs */
extern int  func_020211a4(int x);
extern void func_02005e20(int x);
extern void func_02005ca0(int x);

int func_02028754(void) {
    if (func_020211a4(0)) {
        func_02005e20(1);
        func_02005e20(2);
        func_02005ca0(1);
        func_02005ca0(2);
    }
    return 1;
}
