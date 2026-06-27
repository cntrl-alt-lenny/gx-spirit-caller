/* CAMPAIGN-PREP candidate for func_0224e840 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id:13 held in r9 across 4 bls; do/while count; signed <=0x7d0 (bgt); &&-chain
 *   risk:       id held in r9 across 4 calls; reload would add ldr;lsl;lsr per call. cmp #0x7d0/bgt is signed so <=0x7d0 with int matches; && order load-bearing. reshape-able (bind id once; keep chain order).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224e840 (ov002, class D, MED tier) — brief 069.
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 * Drop into src/, run ninja + objdiff, apply the risk note if <100%.
 *   recipe:     id:13 bitfield; cf17c guard; row+0x260 array; pred chain (!=0,<=0x7d0,==0x12,!=0); do/while
 *   confidence: med
 */
/* func_ov002_0224e840: per-player slot scan (kind 0xd). For each slot whose id
 * (13-bit) passes func_0202e234(!=0), func_0202b950(id)<=0x7d0,
 * func_0202b878(id)==0x12, func_ov002_021ca440(player,id)(!=0), post a kind-0xd
 * entry. Guard cf17c; slot array row+0x260; count row+0x10; stride 4. id in r9. */
#include "ov002_core.h"
extern int func_0202e234(int id);
extern int func_0202b950(int id);
extern int func_0202b878(int id);
extern int func_ov002_021ca440(int player, int id);
void func_ov002_0224e840(int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = ((struct Ov002Slot *)(row + 0x260))[i].id;
        if (func_0202e234(id) != 0 &&
            func_0202b950(id) <= 0x7d0 &&
            func_0202b878(id) == 0x12 &&
            func_ov002_021ca440(player, id) != 0)
            func_ov002_02253458(player, 0xd, i);
        i++;
    } while (i < *(u32 *)(row + 0x10));
}
