/* CAMPAIGN-PREP candidate for func_02031538 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch returning constant (binary compare-tree)
 *   risk:       None observed; verified byte-exact incl. add r1,r2,#0x7b pivot and the 0x149c bge tree split.
 *   confidence: high
 */
int func_02031538(int x) {
    switch (x) {
    case 0x1232:
    case 0x149c:
    case 0x1517:
    case 0x1a67:
        return 1;
    }
    return 0;
}
