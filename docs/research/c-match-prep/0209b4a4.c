/* CAMPAIGN-PREP candidate for func_0209b4a4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BIND base; while-rotation guard+bottom-test; .legacy.c routing
 *   risk:       loop constant/reg-alloc stable; guard-merge (ldmeqia;bxeq) depends on sp2p3 emitting 2-step return
 *   confidence: high
 */
/* file: src/main/func_0209b4a4.legacy.c  (mwcc 1.2/sp2p3)
 * 2-step `ldmia {r4,lr}; bx lr` epilogue => Style A => .legacy.c.
 * Counted poll loop: hold the global address in a callee-saved reg,
 * reload the value each iteration (the bl calls force the reload),
 * run a side-effecting body while it stays nonzero. -O4 rotates the
 * while into guard+body+bottom-test, matching the leading cmp/bxeq. */

extern int  data_021a83e4;
extern int  func_020937fc(void);
extern void func_02096234(void);

void func_0209b4a4(void) {
    while (data_021a83e4 != 0) {
        if (func_020937fc() == 0x80) {
            func_02096234();
        }
    }
}
