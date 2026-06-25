/* CAMPAIGN-PREP candidate for func_0224cbfc (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     mla-base row; reload-limit each iter; while(unsigned limit && i<3); pass-through
 *   risk:       top-test while-vs-do ordering of the two conditions (limit unsigned then i<3 signed) may flip vs orig branch layout
 *   confidence: med
 */
/* func_ov002_0224cbfc: post kind-13 for indices 0..min(row[0x10],3)-1. The
 * row-limit (mla base cf16c) is reloaded and tested unsigned at the bottom,
 * then a signed i<3 cap; no per-slot getter. */
#include "ov002_core.h"
void func_ov002_0224cbfc(int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    while (i < *(u32 *)(row + 0x10) && i < 3) {
        func_ov002_02253458(player, 13, i);
        i++;
    }
}
