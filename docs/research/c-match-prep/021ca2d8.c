/* CAMPAIGN-PREP candidate for func_021ca2d8 (ov001, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Sequential calls then return constant (Style B)
 *   risk:       Low; only risk is whether func_02006918 actually takes args (none passed here) — harmless if it ignores them.
 *   confidence: high
 */
/* func_ov001_021ca2d8: call f(1), f(2), g(), return 1. Style B (stmdb {r3,lr}).
 *
 *     stmdb sp!, {r3, lr}
 *     mov r0, #1 ; bl func_02005c60
 *     mov r0, #2 ; bl func_02005c60
 *     bl func_02006918
 *     mov r0, #1
 *     ldmia sp!, {r3, pc}
 */

extern void func_02005c60(int);
extern void func_02006918(void);

int func_ov001_021ca2d8(void) {
    func_02005c60(1);
    func_02005c60(2);
    func_02006918();
    return 1;
}
