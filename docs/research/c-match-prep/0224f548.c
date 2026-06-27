/* CAMPAIGN-PREP candidate for func_0224f548 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id:13 bitfield; cf180 guard; row+0x418 array; pred chain (021c33e4 takes player,player,i); do/while
 *   risk:       orig builds row+0x418 as two adds (+0x18 then +0x400); mwcc may fold to one add#0x418 -> 1-insn diverge. reshape-able only via the verified two-add prep form; else permuter-class
 *   confidence: med
 */
/* func_ov002_0224f548: per-player slot scan (kind 14). For each slot whose id
 * (13-bit) passes func_0202e234(!=0), func_0202ef08(!=0), and
 * func_ov002_021c33e4(player,player,i), post a kind-14 entry. Guard cf180;
 * slot array at row+0x418 (0x18+0x400); count row+0x14; stride 4. */
#include "ov002_core.h"
extern int func_0202e234(int id);
extern int func_0202ef08(int id);
extern int func_ov002_021c33e4(int player, int player2, int idx);
extern int data_ov002_022cf180[];
void func_ov002_0224f548(int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = ((struct Ov002Slot *)(row + 0x418))[i].id;
        if (func_0202e234(id) != 0 &&
            func_0202ef08(id) != 0 &&
            func_ov002_021c33e4(player, player, i) != 0)
            func_ov002_02253458(player, 14, i);
        i++;
    } while (i < *(u32 *)(row + 0x14));
}
