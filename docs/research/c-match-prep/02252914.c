/* CAMPAIGN-PREP candidate for func_02252914 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     scan loop; bitfield slot.id; predicate-call guard; sink
 *   risk:       loop form/count-reload/bcc may flip; cf17c eq-vs-ls guard; func_0202f46c return-type reg use
 *   confidence: med
 */
/* func_ov002_02252914: scan loop — for each row slot whose 13-bit id passes
 * func_0202f46c, post a kind-0xd entry to the func_ov002_02253458 sink. */
#include "ov002_core.h"
extern int func_0202f46c(int a);

void func_ov002_02252914(int player) {
    char *base = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    unsigned int i;
    if (*(int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    i = 0;
    do {
        int id = ((struct Ov002Slot *)(base + 0x260))[i].id;
        if (func_0202f46c(id) != 0)
            func_ov002_02253458(player, 0xd, i);
    } while (++i < *(unsigned int *)(base + 0x10));
}
