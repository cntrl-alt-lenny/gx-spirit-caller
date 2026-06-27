/* CAMPAIGN-PREP candidate for func_02251f70 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 bitfield id; RELOAD slot word post-guards; addr-unpack as 2nd arg; signed `> 4` (cmp #4;ldmgt); sink kind 11
 *   risk:       orig RE-LOADS the slot word for the unpack (`ldr r2,[r7,r5,lsl#2]` twice); mwcc -O4 may CSE id-read and unpack into one load across the bl guards. reshape-able (bind/reload flip: two separate derefs as written)
 *   confidence: med
 */
/* func_ov002_02251f70 (ov002, class D, MED) — guard-chain + addr-unpack.
 * id (:13) at row+0x120+arg2*4; gates func_0202f2e4(!=0), func_0202b878(id)==7,
 * func_ov002_021c38c4(player, unpack) <= 4; then func_ov002_021ca440(player,id);
 * post kind 11. unpack reloaded from the slot word after the guards. */
#include "ov002_core.h"
extern int func_0202b878(int id);
extern int func_0202f2e4(int id);
extern int func_ov002_021c38c4(int player, int code);
extern int func_ov002_021ca440(int player, int id);
void func_ov002_02251f70(int player, int arg1, int arg2) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x120;
    unsigned int v;
    int id = ((struct Ov002Slot *)(row + arg2 * 4))->id;
    if (func_0202f2e4(id) == 0)
        return;
    if (func_0202b878(id) != 7)
        return;
    v = *(unsigned int *)(row + arg2 * 4);
    if (func_ov002_021c38c4(player, (int)(((v >> 22) & 0xff) << 1) + (int)((v >> 13) & 1)) > 4)
        return;
    if (func_ov002_021ca440(player, id) == 0)
        return;
    func_ov002_02253458(player, 0xb, arg2);
}
