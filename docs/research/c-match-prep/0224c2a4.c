/* CAMPAIGN-PREP candidate for func_0224c2a4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 bitfield id; 0x418 base forces two-add split; guard cf180; 021c33e4(player,player,i); do/while limit row[0x14]
 *   risk:       row base build: orig splits add#0x18 then add#0x400 and keeps id in r9 across the e234 call. If mwcc fuses 0x418 differently or recolours the id temp, a mov/add diverges. reshape-able (keep 0x418 literal; id in named local).
 *   confidence: med
 */
/* func_ov002_0224c2a4 (ov002, class D) — two scalar predicates + 021c33e4.
 * Array at row+0x18+0x400 (=0x418), guard table cf180, limit row[0x14].
 * id-only decode (no packed field). Post kind-0xe.
 */
#include "ov002_core.h"

struct Ov002Card {
    u32 id  : 13;  /* lsl#0x13;lsr#0x13 */
    u32     : 19;
};
extern char data_ov002_022cf180[];
extern int func_0202e234(int id);
extern int func_0202e5ac(int id);
extern int func_ov002_021c33e4(int player, int player2, int idx);

void func_ov002_0224c2a4(int player) {
    struct Ov002Card *slots = (struct Ov002Card *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x418);
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = slots[i].id;
        if (func_0202e234(id) != 0 &&
            func_0202e5ac(id) != 0 &&
            func_ov002_021c33e4(player, player, i) != 0)
            func_ov002_02253458(player, 0xe, i);
        i++;
    } while (i < *(u32 *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x14));
}
