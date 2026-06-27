/* CAMPAIGN-PREP candidate for func_022520f0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id:13 bitfield; cf180 guard; row+0x418 array; fused cmp;cmpne (ed90!=0 && id!=arg1); do/while
 *   risk:       orig fuses the guard as cmp r0,#0; cmpne sl,r7; beq (one branch). Writing `a!=0 && id!=arg1` should emit cmp;cmpne, but mwcc may split into two branches. reshape-able: keep both as the single && so the cmpne predication fires
 *   confidence: med
 */
/* func_ov002_022520f0: per-player slot scan (kind 14). For each slot whose id
 * (13-bit) passes func_0202e234(!=0), then (func_0202ed90(id)!=0 && id!=arg1),
 * then func_ov002_021c33e4(player,player,i), post a kind-14 entry. Guard cf180;
 * slot array at row+0x418 (0x18+0x400); count row+0x14; stride 4. */
#include "ov002_core.h"
extern int func_0202e234(int id);
extern int func_0202ed90(int id);
extern int func_ov002_021c33e4(int player, int player2, int idx);
extern int data_ov002_022cf180[];
void func_ov002_022520f0(int player, int arg1) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = ((struct Ov002Slot *)(row + 0x418))[i].id;
        if (func_0202e234(id) != 0 &&
            (func_0202ed90(id) != 0 && id != arg1) &&
            func_ov002_021c33e4(player, player, i) != 0)
            func_ov002_02253458(player, 14, i);
        i++;
    } while (i < *(u32 *)(row + 0x14));
}
