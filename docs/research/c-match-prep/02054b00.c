/* CAMPAIGN-PREP candidate for func_02054b00 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     predicated conditional store (if/else same global, bic mask)
 *   risk:       unused a1 must not perturb regs; & 0x7fffffff must encode as bic not and
 *   confidence: high
 */
/* func_02054b00: conditional store to a global. If a0 != 0 store
 * a0 & 0x7fffffff (bic bit31); else store 1. Single str, predicated
 * bicne/moveq - the if/else writing the same global. a1 unused. */

extern int data_020ffbd4;

void func_02054b00(int a0, int a1) {
    if (a0 != 0)
        data_020ffbd4 = a0 & 0x7fffffff;
    else
        data_020ffbd4 = 1;
}
