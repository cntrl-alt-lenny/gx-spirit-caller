/* CAMPAIGN-PREP candidate for func_021c9af0 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     SETTER bit set/clear; commutative orr accumulator-first; mvn-mask clear
 *   risk:       low — established d016c+208 idiom; only risk is mov r2,#1 hoist vs per-branch, but shared shift base forces it
 *   confidence: high
 */
/* func_ov002_021c9af0: set/clear bit arg0 of the flag word at d016c+0xd0
 * (arg1 != 0 = set). SET: word | (1<<bit) (accumulator-first orr).
 * CLEAR: word & ~(1<<bit) (mvn mask first). */
extern char data_ov002_022d016c[];

void func_ov002_021c9af0(int arg0, int arg1) {
    if (arg1 != 0)
        *(int *)(data_ov002_022d016c + 0xd0) |= 1 << arg0;
    else
        *(int *)(data_ov002_022d016c + 0xd0) &= ~(1 << arg0);
}
