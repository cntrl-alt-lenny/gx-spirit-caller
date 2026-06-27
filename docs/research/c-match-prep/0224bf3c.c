/* CAMPAIGN-PREP candidate for func_0224bf3c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Slot :13/:1/:8 bitfield reproduces lsl;lsr; packed=(f22<<1)+b13; do/while unsigned-limit; held base, reloaded limit
 *   risk:       0x5dc compare: orig materializes it as sub from the 0x868 literal (sub #0x28c); mwcc may load 0x5dc from pool instead -> 1-instr diverge. reshape-able (write 0x868-0x28c).
 *   confidence: med
 */
/* func_ov002_0224bf3c (ov002, class D) — entity-iteration scan.
 * Scans player's 4-byte-stride card array at row+0x260; for each slot id that
 * passes four predicates AND func_021b3fd8(...,packed)==0, post a kind-0xd entry.
 * packed = ((word>>22)&0xff)<<1 | ((word>>13)&1)  [f22:8 @22 + b13:1 @13].
 */
#include "ov002_core.h"

struct Ov002Card {
    u32 id  : 13;  /* bits 0-12  (lsl#0x13;lsr#0x13)       */
    u32 b13 : 1;   /* bit  13    (lsl#0x12;lsr#0x1f)       */
    u32     : 8;   /* bits 14-21                          */
    u32 f22 : 8;   /* bits 22-29 (lsl#0x2;lsr#0x18)       */
    u32     : 2;   /* bits 30-31                          */
};
extern int func_0202e234(int id);
extern int func_0202b950(int id);
extern int func_0202e5ac(int id);
extern int func_ov002_021ca440(int player, int id);
extern int func_ov002_021b3fd8(int player, int kind, int code, int d);

void func_ov002_0224bf3c(int player) {
    struct Ov002Card *slots = (struct Ov002Card *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x260);
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = slots[i].id;
        if (func_0202e234(id) != 0 &&
            func_0202b950(id) <= 0x5dc &&
            func_0202e5ac(id) != 0 &&
            func_ov002_021ca440(player, id) != 0 &&
            func_ov002_021b3fd8(player, 0xb, 0x12a1, (slots[i].f22 << 1) + slots[i].b13) == 0)
            func_ov002_02253458(player, 0xd, i);
        i++;
    } while (i < *(u32 *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x10));
}
