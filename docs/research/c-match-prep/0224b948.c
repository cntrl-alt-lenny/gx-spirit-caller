/* CAMPAIGN-PREP candidate for func_0224b948 (ov002, class C) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     id 13-bit bitfield; bind-row + pass-through sink; bottom-test do/while; unsigned-limit
 *   risk:       do/while-vs-for loop rotation and i=0 hoist placement may reorder; cf16c slot offset 0x260 inferred
 *   confidence: med
 */
/* func_ov002_0224b948: scan player's 0x260 slot array; for each slot whose
 * card type (func_0202b878 of the 13-bit id) == 0x16, post a kind-13 entry
 * to the func_ov002_02253458 list sink. Loop bound = row[0x10], re-read each
 * iteration (opaque calls clobber); entry guarded by the cf17c count table. */
#include "ov002_core.h"
extern int func_0202b878(int id);
void func_ov002_0224b948(int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    do {
        if (func_0202b878(((struct Ov002Slot *)(row + 0x260))[i].id) == 0x16)
            func_ov002_02253458(player, 13, i);
        i++;
    } while (i < *(u32 *)(row + 0x10));
}
