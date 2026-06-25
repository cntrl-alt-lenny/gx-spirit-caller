/* CAMPAIGN-PREP candidate for func_022515b0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     scan loop; bitfield slot.id; ==||== double-compare; sink
 *   risk:       loop form/count-reload/bcc may flip; the cmp;cmpne or-chain order; cf17c eq-vs-ls guard
 *   confidence: med
 */
/* func_ov002_022515b0: scan loop — for each row slot whose 13-bit id is
 * 0xfe0 or 0x18aa, post a kind-0xd entry to the func_ov002_02253458 sink. */
#include "ov002_core.h"

void func_ov002_022515b0(int player) {
    char *base = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    unsigned int i;
    if (*(int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    i = 0;
    do {
        int id = ((struct Ov002Slot *)(base + 0x260))[i].id;
        if (id == 0xfe0 || id == 0x18aa)
            func_ov002_02253458(player, 0xd, i);
    } while (++i < *(unsigned int *)(base + 0x10));
}
