/* CAMPAIGN-PREP candidate for func_0206e3f4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     align-up-to-4 leaf (add #3; bic #3)
 *   risk:       none; canonical mwcc output for (x+3)&~3
 *   confidence: high
 */
/* func_0206e3f4: round up to a multiple of 4.
 *   add r0,r0,#3; bic r0,r0,#3; bx lr
 */

int func_0206e3f4(int x) {
    return (x + 3) & ~3;
}
