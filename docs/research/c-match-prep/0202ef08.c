/* CAMPAIGN-PREP candidate for func_0202ef08 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     chained-eq membership (|| of ==), base-CSE
 *   risk:       mwcc may load comparands as separate literals instead of add-from-base; otherwise byte-exact
 *   confidence: high
 */
/* func_0202ef08: 3-way membership test. mwcc factors the common base
 * 0x18C3 into r2 and forms 0x191C (=+0x59) and 0x1A2F (=+0x16C) via
 * `addne r1,r2,#K`, so write the comparands as the bare constants in
 * an || chain and let the strength-reducer share the base.
 *
 *     ldr r2,=0x18C3; cmp r0,r2; addne r1,r2,#0x59; cmpne r0,r1
 *     addne r1,r2,#0x16C; cmpne r0,r1; bne .L; mov r0,#1; bx lr
 */

int func_0202ef08(int x) {
    if (x == 0x18C3 || x == 0x191C || x == 0x1A2F) return 1;
    return 0;
}
