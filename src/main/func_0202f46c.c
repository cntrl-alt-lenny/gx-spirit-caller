/* CAMPAIGN-PREP candidate for func_0202f46c (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     switch with dense cluster (jump-table) + two singleton cases
 *   risk:       cluster/pivot split (LIT 0x1af1 pivot, 0x1a90 base, LIT 0x1b4b high) must match mwcc's layout
 *   confidence: med
 */
/* func_0202f46c — range jump-table membership + two singleton compares */
int func_0202f46c(int x) {
    switch (x) {
    case 0x1a90:
    case 0x1a91:
    case 0x1a92:
    case 0x1a93:
    case 0x1a94:
    case 0x1a95:
    case 0x1af1:
    case 0x1b4b:
        return 1;
    }
    return 0;
}
