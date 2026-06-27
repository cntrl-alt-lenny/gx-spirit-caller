/* CAMPAIGN-PREP candidate for func_0224e0dc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id:13 bitfield; cf17c guard; row+0x260 array; pred chain (!=0,==0,<=3); do/while unsigned
 *   risk:       id held across 3 bls (r9); reload of slots[i].id would add ldr;lsl;lsr per call. permuter-class. cmp #0x3/bgt is signed (matches int), so <=3 ok
 *   confidence: med
 */
/* func_ov002_0224e0dc: per-player slot scan (kind 13). For each slot whose id
 * (13-bit) passes func_0202e234(!=0), fails func_0202de9c(==0), and has
 * func_0202b8a8(id) <= 3, post a kind-13 entry. Guard table cf17c; slot array
 * at row+0x260; count at row+0x10; stride 4. */
#include "ov002_core.h"
extern int func_0202e234(int id);
extern int func_0202de9c(int id);
extern int func_0202b8a8(int id);
void func_ov002_0224e0dc(int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = ((struct Ov002Slot *)(row + 0x260))[i].id;
        if (func_0202e234(id) != 0 &&
            func_0202de9c(id) == 0 &&
            func_0202b8a8(id) <= 3)
            func_ov002_02253458(player, 13, i);
        i++;
    } while (i < *(u32 *)(row + 0x10));
}
