/* CAMPAIGN-PREP candidate for func_02252ca4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     scan loop; bitfield slot.id; type==1 guard; sink
 *   risk:       loop form/count-reload/bcc may flip; cf180 eq-vs-ls guard
 *   confidence: med
 */
/* func_ov002_02252ca4: scan loop — for each row slot whose 13-bit id maps to
 * type 1 (func_0202b878), post a kind-0xe entry to the func_ov002_02253458
 * sink. */
#include "ov002_core.h"
extern int data_ov002_022cf180[];
extern int func_0202b878(int a);

void func_ov002_02252ca4(int player) {
    char *base = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    unsigned int i;
    if (*(int *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    i = 0;
    do {
        int id = ((struct Ov002Slot *)(base + 0x418))[i].id;
        if (func_0202b878(id) == 1)
            func_ov002_02253458(player, 0xe, i);
    } while (++i < *(unsigned int *)(base + 0x14));
}
