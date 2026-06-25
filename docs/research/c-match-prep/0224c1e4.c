/* CAMPAIGN-PREP candidate for func_0224c1e4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id:13 bitfield; cf184 guard; row+0x3a0 array; 4-deep predicate chain; do/while unsigned reload
 *   risk:       id held in callee-saved reg (sl) across 4 bls; if mwcc reloads slots[i].id per call, 3 ldr+lsl/lsr diverge. permuter-class (reg-alloc)
 *   confidence: med
 */
/* func_ov002_0224c1e4: per-player slot scan (kind 12). For each slot whose id
 * (13-bit) maps via func_0202b8a8 to arg2, AND passes func_02030808,
 * func_02030b84, and func_ov002_021ca3f0(player,id), post a kind-12 entry.
 * Guard table cf184; slot array at row+0x3a0; count at row+0x18; stride 4. */
#include "ov002_core.h"
extern int func_0202b8a8(int id);
extern int func_02030808(int id);
extern int func_02030b84(int id);
extern int func_ov002_021ca3f0(int player, int id);
extern int data_ov002_022cf184[];
void func_ov002_0224c1e4(int player, int arg1, int arg2) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf184 + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = ((struct Ov002Slot *)(row + 0x3a0))[i].id;
        if (func_0202b8a8(id) == arg2 &&
            func_02030808(id) != 0 &&
            func_02030b84(id) != 0 &&
            func_ov002_021ca3f0(player, id) != 0)
            func_ov002_02253458(player, 12, i);
        i++;
    } while (i < *(u32 *)(row + 0x18));
}
