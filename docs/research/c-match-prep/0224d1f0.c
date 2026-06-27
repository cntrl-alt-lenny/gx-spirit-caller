/* CAMPAIGN-PREP candidate for func_0224d1f0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     other=1-player (rsb); two do/while-unsigned scans; id bitfield; first guard falls through
 *   risk:       Orig computes `rsb r8,r4,#1` once and reuses player/other across both loops in callee-saved regs; mwcc may recompute 1-player or reorder the two loops' shared cf16c base — permuter-class.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224d1f0 (ov002, class D, MED tier) — brief p_0066.
 * UNVERIFIED + ITERATION-EXPECTED (currently ships as .s; reg-alloc-walled, brief 302).
 * Runs the SAME single-getter scan twice: first for the OTHER player (1-player,
 * via rsb), then for `player`. Both: cf180 guard, row+0x418, limit row[0x14],
 * getter func_0202e234, kind 14, sink arg0 = that loop's player value.
 *   recipe: other=1-player held; two do/while-unsigned scans; Ov002Slot.id bitfield; u32 guards (1st `bls` falls through to 2nd, 2nd returns)
 */
#include "ov002_core.h"
extern int func_0202e234(int id);
extern int data_ov002_022cf180[];
void func_ov002_0224d1f0(int player) {
    int other = 1 - player;
    char *row;
    int i;
    row = (char *)data_ov002_022cf16c + (other & 1) * 0x868;
    i = 0;
    if (*(u32 *)((char *)data_ov002_022cf180 + (other & 1) * 0x868) != 0) {
        do {
            if (func_0202e234(((struct Ov002Slot *)(row + 0x418))[i].id) != 0)
                func_ov002_02253458(other, 14, i);
            i++;
        } while (i < *(u32 *)(row + 0x14));
    }
    row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    i = 0;
    if (*(u32 *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    do {
        if (func_0202e234(((struct Ov002Slot *)(row + 0x418))[i].id) != 0)
            func_ov002_02253458(player, 14, i);
        i++;
    } while (i < *(u32 *)(row + 0x14));
}
