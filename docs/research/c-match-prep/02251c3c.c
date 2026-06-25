/* CAMPAIGN-PREP candidate for func_02251c3c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id:13 bitfield; cf188 guard; row+0x5d0 array; two-getter equality (021c988c kind=15); do/while
 *   risk:       orig computes func_0202b878(id) into r9, then func_0202b878(arg1), then cmp -> order of the two getter calls must be id-first. If mwcc evaluates arg1 side first, the two bls swap. reshape-able: bind id-side to a temp before the arg1 call
 *   confidence: med
 */
/* func_ov002_02251c3c: per-player slot scan (kind 15). For each slot whose id
 * (13-bit) passes func_0202e234(!=0) and whose func_0202b878(id) equals
 * func_0202b878(arg1), then func_ov002_021c988c(player,15,i), post kind-15.
 * Guard cf188; slot array at row+0x5d0; count at row+0x1c; stride 4. */
#include "ov002_core.h"
extern int func_0202e234(int id);
extern int func_0202b878(int id);
extern int func_ov002_021c988c(int player, int kind, int idx);
extern int data_ov002_022cf188[];
void func_ov002_02251c3c(int player, int arg1) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf188 + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = ((struct Ov002Slot *)(row + 0x5d0))[i].id;
        if (func_0202e234(id) != 0 &&
            func_0202b878(id) == func_0202b878(arg1) &&
            func_ov002_021c988c(player, 15, i) != 0)
            func_ov002_02253458(player, 15, i);
        i++;
    } while (i < *(u32 *)(row + 0x1c));
}
