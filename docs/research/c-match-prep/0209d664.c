/* CAMPAIGN-PREP candidate for func_0209d664 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two calls + fn-ptr arg + word store 0
 *   risk:       func_02096228 may really take an arg (would add mov r0); data_021a8d24 size guessed int
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_0209d664 (main, class A) — front-load.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe:     two calls (one no-arg) + function-pointer arg + word store of 0
 *   risk:       func_02096228 declared void(void) to avoid a spurious mov r0; data_021a8d24 is a plain int global
 */
extern void func_02096228(void);
extern void func_0209d5e4(void);
extern void func_02096434(int a, void *cb);
extern int  data_021a8d24;

void func_0209d664(void) {
    func_02096228();
    func_02096434(0xe, func_0209d5e4);
    data_021a8d24 = 0;
}
