/* CAMPAIGN-PREP candidate for func_0206b3d8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     leaf scan loop; conditional early-return (bxeq); -1 sentinel
 *   risk:       None observed: byte-exact. signed char from ldrsb; return index+1 is load-bearing (addeq r0,r3,#1).
 *   confidence: high
 */
/* func_0206b3d8 (default mwcc 2.0/sp1p5, leaf).
 * Scan up to n signed bytes for a NUL; return index+1 of the first NUL,
 * else -1. VERIFIED byte-exact vs target (no frame; addeq r0,r3,#1; bxeq lr;
 * mvn r0,#0). */
int func_0206b3d8(signed char *s, int n) {
    int i;
    for (i = 0; i < n; i++) {
        if (s[i] == 0) return i + 1;
    }
    return -1;
}
