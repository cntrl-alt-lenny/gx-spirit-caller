/* CAMPAIGN-PREP candidate for func_022517c0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id:13 bitfield; cf17c guard; row+0x260 array; single predicate; do/while unsigned reload
 *   risk:       lightest body, closest to verified 0224cf14/cd18 template. Main risk: off-CSE emits two muls for (player&1)*0x868 (guard + row). reshape-able: bind off to a local if it doubles
 *   confidence: high
 */
/* func_ov002_022517c0: per-player slot scan (kind 13), light body. For each
 * slot whose id (13-bit) passes func_0202eac8(!=0), post a kind-13 entry.
 * Guard table cf17c; slot array at row+0x260; count at row+0x10; stride 4. */
#include "ov002_core.h"
extern int func_0202eac8(int id);
void func_ov002_022517c0(int player) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    do {
        if (func_0202eac8(((struct Ov002Slot *)(row + 0x260))[i].id) != 0)
            func_ov002_02253458(player, 13, i);
        i++;
    } while (i < *(u32 *)(row + 0x10));
}
