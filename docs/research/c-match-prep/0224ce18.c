/* CAMPAIGN-PREP candidate for func_0224ce18 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if(arg2==1) loopA else loopB; shared parity row; do/while unsigned; id bitfield
 *   risk:       Orig computes parity (and r2,r7,#1) BEFORE the arg2 branch; if mwcc sinks (player&1) into each arm, the shared `and`+pool layout diverges. reshape-able (hoist `int off` decl above the if).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224ce18 (ov002, class D, MED tier) — brief p_0066.
 * UNVERIFIED + ITERATION-EXPECTED (currently ships as .s; reg-alloc-walled, brief 302).
 * arg2 selects one of two single-predicate scans (same getter func_0202e6f4).
 *   recipe: if(arg2==1) cf17c/row+0x260/limit row[0x10]/kind13 else cf180/row+0x418/limit row[0x14]/kind14; u32 guard==0; do/while unsigned; Ov002Slot.id bitfield
 */
#include "ov002_core.h"
extern int func_0202e6f4(int id);
extern int data_ov002_022cf180[];
void func_ov002_0224ce18(int player, int arg1, int arg2) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int i = 0;
    if (arg2 == 1) {
        if (*(u32 *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
            return;
        do {
            if (func_0202e6f4(((struct Ov002Slot *)(row + 0x260))[i].id) != 0)
                func_ov002_02253458(player, 13, i);
            i++;
        } while (i < *(u32 *)(row + 0x10));
    } else {
        if (*(u32 *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) == 0)
            return;
        do {
            if (func_0202e6f4(((struct Ov002Slot *)(row + 0x418))[i].id) != 0)
                func_ov002_02253458(player, 14, i);
            i++;
        } while (i < *(u32 *)(row + 0x14));
    }
}
