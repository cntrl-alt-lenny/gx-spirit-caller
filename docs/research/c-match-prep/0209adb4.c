/* CAMPAIGN-PREP candidate for func_0209adb4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     retry loop; loop-invariant constants hoisted to callee-saved regs
 *   risk:       mwcc must keep 8/0/cmd in r5/r4/r6 across the call; no final mov r0 so void return is correct.
 *   confidence: high
 */
/* func_0209adb4: retry-until-success command send. Spins func_02096358(8,
 * cmd, 0) until it returns 0. The constants 8 and 0 are loop-invariant and
 * get parked in callee-saved regs (r5/r4) across iterations; cmd stays in r6.
 */

extern int func_02096358(int chan, int cmd, int flags);

void func_0209adb4(int cmd) {
    while (func_02096358(8, cmd, 0) != 0)
        ;
}
