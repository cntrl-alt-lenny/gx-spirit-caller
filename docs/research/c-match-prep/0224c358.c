/* CAMPAIGN-PREP candidate for func_0224c358 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Same family as 0224bf3c minus 0202b950; ==4 equality predicate; packed (f22<<1)+b13; held base + reloaded limit
 *   risk:       packed-arg decode fusion (mov<<2;lsr;lsl#1 + add lsr#0x1f from one ldr): if mwcc reloads the word or reorders the const-reg loads (0xb,0x12a1) relative to the shift chain, schedule diverges. permuter-class.
 *   confidence: med
 */
/* func_ov002_0224c358 (ov002, class D) — predicate chain + packed arg.
 * row+0x260, guard cf17c, limit row[0x10]. Mid-predicate func_0202b8a8(id)==4
 * (orig cmp #4; bne skip), then 021ca440, then 021b3fd8(...,packed)==0 -> kind-0xd.
 */
#include "ov002_core.h"

struct Ov002Card {
    u32 id  : 13;
    u32 b13 : 1;   /* bit 13 */
    u32     : 8;
    u32 f22 : 8;   /* bits 22-29 */
    u32     : 2;
};
extern int func_0202e234(int id);
extern int func_0202b8a8(int id);
extern int func_ov002_021ca440(int player, int id);
extern int func_ov002_021b3fd8(int player, int kind, int code, int d);

void func_ov002_0224c358(int player) {
    struct Ov002Card *slots = (struct Ov002Card *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x260);
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = slots[i].id;
        if (func_0202e234(id) != 0 &&
            func_0202b8a8(id) == 4 &&
            func_ov002_021ca440(player, id) != 0 &&
            func_ov002_021b3fd8(player, 0xb, 0x12a1, (slots[i].f22 << 1) + slots[i].b13) == 0)
            func_ov002_02253458(player, 0xd, i);
        i++;
    } while (i < *(u32 *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x10));
}
