/* CAMPAIGN-PREP candidate for func_0207f4f8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     TAIL-CALL thunk: add constant to r1 (b first), bx callee
 *   risk:       low; mirrors matched func_0207f4e8.c exactly aside from the constant
 *   confidence: high
 */
/* func_0207f4f8: thunk -- pass (a, b + 0x7000400) to func_020944a4.
 * Direct sibling of func_0207f4e8 (which adds 0x7000000); here the
 * constant is 0x7000400, loaded from the pool.
 *
 *   ldr r3, =0x7000400
 *   ldr ip, =func_020944a4
 *   add r1, r1, r3      ; b + 0x7000400  (b first)
 *   bx  ip
 */

extern int func_020944a4(int a, int b);

int func_0207f4f8(int a, int b) {
    return func_020944a4(a, b + 0x7000400);
}
