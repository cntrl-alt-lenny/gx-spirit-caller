/* CAMPAIGN-PREP candidate for func_0224f8ac (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard==0 early-return; plain counted loop; sink tail
 *   risk:       saved-player/tag/base may not land r5/r6/r7 as orig; off-CSE may double the mul
 *   confidence: med
 */
/* func_ov002_0224f8ac: per-player counted loop, no slot read (identical shape
 * to 0224ee48). Guard the cf180 count; call the list sink for every index. */
#include "ov002_core.h"

extern char data_ov002_022cf180[];

void func_ov002_0224f8ac(int player) {
    int i;
    char *base;
    int off = (player & 1) * 0x868;
    if (*(int *)(data_ov002_022cf180 + off) == 0)
        return;
    base = data_ov002_022cf16c + off;
    for (i = 0; i < *(unsigned int *)(base + 0x14); i++)
        func_ov002_02253458(player, 0xe, i);
}
