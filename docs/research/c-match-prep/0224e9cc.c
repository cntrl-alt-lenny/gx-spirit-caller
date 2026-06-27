/* CAMPAIGN-PREP candidate for func_0224e9cc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id:13 bitfield; do/while count; row+0x418 array; single pred!=0 sink
 *   risk:       orig holds row base r6 + array ptr r5 across loop; if mwcc reloads base each iter, extra ldr per pass. reshape-able (single char* base local). Otherwise near-identical to matched A-tier sibling 0224e660.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224e9cc (ov002, class D, MED tier) — brief 069.
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 * Drop into src/, run ninja + objdiff, apply the risk note if <100%.
 *   recipe:     id:13 bitfield; cf180 guard; row+0x418 array; pred !=0; do/while unsigned
 *   confidence: med
 */
/* func_ov002_0224e9cc: per-player slot scan (kind 0xe). For each slot whose id
 * (13-bit) passes func_0202e234(!=0), post a kind-0xe entry. Guard cf180; slot
 * array row+0x418; count row+0x14; stride 4. */
#include "ov002_core.h"
extern int func_0202e234(int id);
void func_ov002_0224e9cc(int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    do {
        if (func_0202e234(((struct Ov002Slot *)(row + 0x418))[i].id) != 0)
            func_ov002_02253458(player, 0xe, i);
        i++;
    } while (i < *(u32 *)(row + 0x14));
}
