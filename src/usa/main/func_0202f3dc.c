/* CAMPAIGN-PREP candidate for func_0202f3dc (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dense switch -> addls pc jump-table; base split sub 0xa70/0x1000
 *   risk:       requires mwcc to choose jump-table (6 dense cases) and split 0x1a70 base as 0xa70+0x1000
 *   confidence: med
 */
/* func_0202f3dc — contiguous-range membership via addls jump-table */
int func_0202f3dc(int x) {
    switch (x) {
    case 0x1a70:
    case 0x1a71:
    case 0x1a72:
    case 0x1a73:
    case 0x1a74:
    case 0x1a75:
        return 1;
    }
    return 0;
}
