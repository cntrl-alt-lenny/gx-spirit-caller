/* CAMPAIGN-PREP candidate for func_02028700 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard + ordered call sequence; clean leaf
 *   risk:       none material; arg/return signatures inferred from r0 usage only
 *   confidence: high
 */
/* func_02028700 — guard then two paired call-pairs */
extern int  func_02021150(int x);
extern void func_02005e04(int x);
extern void func_02005c84(int x);

int func_02028700(void) {
    if (func_02021150(0)) {
        func_02005e04(1);
        func_02005e04(2);
        func_02005c84(1);
        func_02005c84(2);
    }
    return 1;
}
