/* CAMPAIGN-PREP candidate for func_0207f774 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT/fill loop; -1 via int literal (mvn)
 *   risk:       mwcc could unroll the 3-iter loop into three str; target is rolled.
 *   confidence: med
 */
/* func_0207f774: 3-element fill of -1 starting at +0x8 (p[2..4]).
 * Rolled loop, leaf. */

void func_0207f774(int *p) {
    int i;
    for (i = 0; i < 3; i++)
        p[i + 2] = -1;
}
