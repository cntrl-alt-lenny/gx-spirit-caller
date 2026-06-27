/* CAMPAIGN-PREP candidate for func_02251b14 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 bitfield slot; cf17c==0 precheck; row+0x260 array, +0x10 count; unsigned <= compare; do/while; kind 13 held in r9
 *   risk:       orig holds kind 0xd in callee-saved r9 across loop and forwards it as sink arg1; passing literal 0xd may not mirror that reg reuse. permuter-class (callee-saved const sharing)
 *   confidence: med
 */
/* func_ov002_02251b14 (ov002, class D, MED) — per-player slot scan, kind 13.
 * Guard cf17c count; slot array at row+0x260; count at row+0x10; for each slot
 * whose :13 id passes func_0202ed90(!=0) and func_0202b8a8(id) <= arg2 (unsigned),
 * post a kind-13 entry. */
#include "ov002_core.h"
extern int func_0202ed90(int id);
extern int func_0202b8a8(int id);
void func_ov002_02251b14(int player, int arg1, int arg2) {
    char *row;
    int i;
    if (*(int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    i = 0;
    do {
        int id = ((struct Ov002Slot *)(row + 0x260))[i].id;
        if (func_0202ed90(id) != 0 &&
            func_0202b8a8(id) <= (unsigned int)arg2)
            func_ov002_02253458(player, 0xd, i);
        i++;
    } while (i < *(u32 *)(row + 0x10));
}
