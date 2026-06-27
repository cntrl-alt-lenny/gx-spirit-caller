/* CAMPAIGN-PREP candidate for func_0224c0b8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Bitfield pack (f22<<1)+b13 via single [r8] word read; do/while unsigned-limit; 0xb/0x12a1/0xd consts in callee-saved regs
 *   risk:       packed-arg codegen: orig does mov<<2;lsr;lsl#1 + add(lsr#0x1f) from one ldr — if mwcc reloads word per-field or reorders the <<1/add fusion, the 3-4 decode ops diverge. permuter-class (scheduling of the fused shift-add).
 *   confidence: med
 */
/* func_ov002_0224c0b8 (ov002, class D) — predicate-free scan.
 * No id-predicate: each slot in row+0x260 is fed straight to
 * func_021b3fd8(player,0xb,0x12a1,packed); on ==0 post kind-0xd.
 * packed = ((word>>22)&0xff)<<1 | ((word>>13)&1).
 */
#include "ov002_core.h"

struct Ov002Card {
    u32 id  : 13;
    u32 b13 : 1;   /* bit 13   (lsl#0x12;lsr#0x1f) */
    u32     : 8;
    u32 f22 : 8;   /* bits 22-29 (lsl#0x2;lsr#0x18) */
    u32     : 2;
};
extern int func_ov002_021b3fd8(int player, int kind, int code, int d);

void func_ov002_0224c0b8(int player) {
    struct Ov002Card *slots = (struct Ov002Card *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x260);
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    do {
        if (func_ov002_021b3fd8(player, 0xb, 0x12a1, (slots[i].f22 << 1) + slots[i].b13) == 0)
            func_ov002_02253458(player, 0xd, i);
        i++;
    } while (i < *(u32 *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x10));
}
