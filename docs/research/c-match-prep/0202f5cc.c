/* CAMPAIGN-PREP candidate for func_0202f5cc (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch returning constant (membership compare-tree)
 *   risk:       None observed; verified byte-exact incl. subne/cmpne chain for the 0x1807/0b/0c cluster.
 *   confidence: high
 */
int func_0202f5cc(int x) {
    switch (x) {
    case 0x13e4:
    case 0x1807:
    case 0x180b:
    case 0x180c:
        return 1;
    }
    return 0;
}
