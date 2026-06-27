/* CAMPAIGN-PREP candidate for func_0224c4e8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla base (player&1)*0x868+cf16c folds to mla; +0x120 add; word=base[idx]; early-return guards; packed (f22<<1)+b13; sink kind-0xb
 *   risk:       base address form: orig is `mla r0,(p&1),0x868,cf16c` (the cf16c literal as the mla addend). If mwcc emits ldr-literal + mul + add instead of fusing into mla, 1-2 instrs diverge. reshape-able / permuter-class (mla-fusion is mwcc-version sensitive).
 *   confidence: med
 */
/* func_ov002_0224c4e8 (ov002, class D) — STRAIGHT-LINE (no loop).
 * slot index is arg2 (r2). base = mla((player&1),0x868,cf16c)+0x120; word=base[idx].
 * Early-outs: e340==0; 021c38c4(player,packed)>4; 021ca440==0. Else post kind-0xb.
 * packed = ((word>>22)&0xff)<<1 | ((word>>13)&1).
 */
#include "ov002_core.h"

struct Ov002Card {
    u32 id  : 13;
    u32 b13 : 1;   /* bit 13 */
    u32     : 8;
    u32 f22 : 8;   /* bits 22-29 */
    u32     : 2;
};
extern int func_0202e340(int id);
extern int func_ov002_021c38c4(int player, int d);
extern int func_ov002_021ca440(int player, int id);

void func_ov002_0224c4e8(int player, int unused, int idx) {
    struct Ov002Card *slots = (struct Ov002Card *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x120);
    int id = slots[idx].id;
    if (func_0202e340(id) == 0)
        return;
    if (func_ov002_021c38c4(player, (slots[idx].f22 << 1) + slots[idx].b13) > 4)
        return;
    if (func_ov002_021ca440(player, id) == 0)
        return;
    func_ov002_02253458(player, 0xb, idx);
}
