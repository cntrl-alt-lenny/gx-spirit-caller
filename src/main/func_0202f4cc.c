/* CAMPAIGN-PREP candidate for func_0202f4cc (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dense switch -> addls pc jump-table; base split sub 0xaa/0x1a00
 *   risk:       requires mwcc to pick jump-table (4 dense cases) and split 0x1aaa base as 0xaa+0x1a00
 *   confidence: med
 */
/* func_0202f4cc — small contiguous-range membership via addls jump-table */
int func_0202f4cc(int x) {
    switch (x) {
    case 0x1aaa:
    case 0x1aab:
    case 0x1aac:
    case 0x1aad:
        return 1;
    }
    return 0;
}
