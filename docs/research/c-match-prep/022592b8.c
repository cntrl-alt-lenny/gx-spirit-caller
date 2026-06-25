/* CAMPAIGN-PREP candidate for func_022592b8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store-block initializer (store-order recipe)
 *   risk:       struct-via-cast offsets confirmed against sibling 022592ec.c; only risk is store scheduling, which the sibling proves matches
 *   confidence: high
 */
/* func_ov002_022592b8: arm a request in the shared duel-command block.
 * Mirrors the proven sibling func_ov002_022592ec store schedule: cmd-id slot
 * <- arg0, copy current selection (022cd73c.f4) into +0xD6C, zero the rest. */

extern char data_ov002_022d016c[];
extern char data_ov002_022cd73c[];

void func_ov002_022592b8(int arg0) {
    *(int *)(data_ov002_022d016c + 0xD48) = arg0;
    *(int *)(data_ov002_022d016c + 0xD84) = 0;
    *(int *)(data_ov002_022d016c + 0xD54) = 0;
    *(int *)(data_ov002_022d016c + 0xD50) = 0;
    *(int *)(data_ov002_022d016c + 0xD6C) = *(int *)(data_ov002_022cd73c + 0x4);
    *(int *)(data_ov002_022d016c + 0xD58) = 0;
}
