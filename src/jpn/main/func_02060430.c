/* CAMPAIGN-PREP candidate for func_02060430 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     empty variadic register-home stub
 *   risk:       mwcc may emit bare bx lr instead of homing {r0-r3}; this 3-insn varargs prologue is hard to force from C
 *   confidence: low
 */
/* func_02060430: 3-instruction stub that homes the four argument registers
 * to the stack and returns. This is mwcc's prologue/epilogue for an empty
 * variadic function (the {r0-r3} save is the va register-spill area).
 *
 *   stmdb sp!, {r0, r1, r2, r3}
 *   add   sp, sp, #0x10
 *   bx    lr
 */
void func_02060430(int a, ...) {
    (void)a;
}
