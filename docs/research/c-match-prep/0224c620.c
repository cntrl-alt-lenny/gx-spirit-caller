/* CAMPAIGN-PREP candidate for func_0224c620 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla base+0x120; one word read; packed (f22<<1)+b13 computed, id kept in r6 across the 021c38c4 call for the 2nd predicate; ==7 then sink
 *   risk:       dual-field liveness: orig extracts id into r6 BEFORE the call and holds it across (no reload), packed into r1. If mwcc reloads the word for .id after the call instead of preserving r6, an extra ldr+shift diverges. reshape-able (bind id to a local before the first call).
 *   confidence: med
 */
/* func_ov002_0224c620 (ov002, class D) — STRAIGHT-LINE, dual-field decode.
 * slot index = arg2 (r2). base = mla((player&1),0x868,cf16c)+0x120 (#288); word=base[idx].
 * packed (=arg1 to 021c38c4) and id (=arg to 021ca440) decoded from the SAME word:
 *   packed = ((word>>22)&0xff)<<1 | ((word>>13)&1)  (computed first)
 *   id     = word & 0x1fff                          (computed after, into r6)
 * 021c38c4==7 required (bne early-ret), then 021ca440!=0, then post kind-0xb.
 */
#include "ov002_core.h"

struct Ov002Card {
    u32 id  : 13;  /* lsl#0x13;lsr#0x13, kept for the 2nd call */
    u32 b13 : 1;   /* bit 13 */
    u32     : 8;
    u32 f22 : 8;   /* bits 22-29 */
    u32     : 2;
};
extern int func_ov002_021c38c4(int player, int d);
extern int func_ov002_021ca440(int player, int id);

void func_ov002_0224c620(int player, int unused, int idx) {
    struct Ov002Card *slots = (struct Ov002Card *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x120);
    if (func_ov002_021c38c4(player, (slots[idx].f22 << 1) + slots[idx].b13) != 7)
        return;
    if (func_ov002_021ca440(player, slots[idx].id) == 0)
        return;
    func_ov002_02253458(player, 0xb, idx);
}
