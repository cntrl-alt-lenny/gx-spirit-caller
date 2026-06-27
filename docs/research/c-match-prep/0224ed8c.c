/* CAMPAIGN-PREP candidate for func_0224ed8c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id:13 bitfield; cf17c guard; row+0x260 array; 4-deep pred chain; do/while unsigned
 *   risk:       id in r9 across 4 bls; orig reloads id once at top (lsl#0x13;lsr#0x13). If mwcc spills/reloads or reorders the && short-circuit, body diverges. permuter-class
 *   confidence: med
 */
/* func_ov002_0224ed8c: per-player slot scan (kind 13). For each slot whose id
 * (13-bit) passes func_0202e234(!=0), has func_0202b878(id)==0xb, has
 * func_0202b8a8(id)<=3, and passes func_ov002_021ca440(player,id), post a
 * kind-13 entry. Guard cf17c; slot array row+0x260; count row+0x10; stride 4. */
#include "ov002_core.h"
extern int func_0202e234(int id);
extern int func_0202b878(int id);
extern int func_0202b8a8(int id);
extern int func_ov002_021ca440(int player, int id);
void func_ov002_0224ed8c(int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = ((struct Ov002Slot *)(row + 0x260))[i].id;
        if (func_0202e234(id) != 0 &&
            func_0202b878(id) == 0xb &&
            func_0202b8a8(id) <= 3 &&
            func_ov002_021ca440(player, id) != 0)
            func_ov002_02253458(player, 13, i);
        i++;
    } while (i < *(u32 *)(row + 0x10));
}
