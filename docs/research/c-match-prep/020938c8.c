/* CAMPAIGN-PREP candidate for func_020938c8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     retry-until-zero loop, loop-invariant args hoisted to saved regs
 *   risk:       mwcc may emit mov r2,#0 inside the loop instead of hoisting 0 to r4 — would change pushed-reg set by one.
 *   confidence: med
 */
/* func_020938c8: counted retry loop — spins calling func_02096358(0xc, x<<8, 0)
 * until it returns 0. The three call args are loop-invariant (kept in r4/r5/r6). */
extern int func_02096358(int a, int b, int c);

void func_020938c8(int x) {
    while (func_02096358(0xc, x << 8, 0) != 0)
        ;
}
