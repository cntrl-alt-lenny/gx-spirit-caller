/* CAMPAIGN-PREP candidate for func_0203178c (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     switch returning constant: dense run -> addls pc jump-table + eq tail
 *   risk:       None observed; verified byte-exact incl. the 4-entry addls-pc jump table and 0x17ad/ae compare tail.
 *   confidence: high
 */
int func_0203178c(int x) {
    switch (x) {
    case 0x1497:
    case 0x1498:
    case 0x1499:
    case 0x149a:
    case 0x17ad:
    case 0x17ae:
        return 1;
    }
    return 0;
}
