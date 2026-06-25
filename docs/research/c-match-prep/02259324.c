/* CAMPAIGN-PREP candidate for func_02259324 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store-block initializer (store-order recipe)
 *   risk:       same family as 022592ec/022592b8; store schedule proven, no residual risk beyond const-9 placement
 *   confidence: high
 */
/* func_ov002_02259324: like func_ov002_022592b8 but cmd-id is the constant 9
 * and arg0 lands in the +0xD84 param slot. Same store schedule otherwise. */

extern char data_ov002_022d016c[];
extern char data_ov002_022cd73c[];

void func_ov002_02259324(int arg0) {
    *(int *)(data_ov002_022d016c + 0xD48) = 9;
    *(int *)(data_ov002_022d016c + 0xD84) = arg0;
    *(int *)(data_ov002_022d016c + 0xD54) = 0;
    *(int *)(data_ov002_022d016c + 0xD50) = 0;
    *(int *)(data_ov002_022d016c + 0xD6C) = *(int *)(data_ov002_022cd73c + 0x4);
    *(int *)(data_ov002_022d016c + 0xD58) = 0;
}
