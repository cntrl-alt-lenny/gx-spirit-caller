/* CAMPAIGN-PREP candidate for func_0224c440 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 bitfield id in named local (re-read each pred); && chain (cmp #0x4b0 bgt / cmp #2 bne); do/while unsigned limit row[0x10]
 *   risk:       0x4b0 <= signed-vs-unsigned compare emits bgt in orig (signed) — matches int return; if a widening/sign mismatch flips it to bhi/bcc it diverges. reshape-able (id local is int; keep 0x4b0). Lowest-risk of the batch.
 *   confidence: med
 */
/* func_ov002_0224c440 (ov002, class D) — three scalar predicates, no packed arg.
 * row+0x260, guard cf17c, limit row[0x10]. id passes e234!=0 AND 0202b980<=0x4b0
 * AND 0202b878==2 -> post kind-0xd. Cleanest member of the batch.
 */
#include "ov002_core.h"

struct Ov002Card {
    u32 id  : 13;  /* lsl#0x13;lsr#0x13 */
    u32     : 19;
};
extern int func_0202e234(int id);
extern int func_0202b980(int id);
extern int func_0202b878(int id);

void func_ov002_0224c440(int player) {
    struct Ov002Card *slots = (struct Ov002Card *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x260);
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    do {
        int id = slots[i].id;
        if (func_0202e234(id) != 0 &&
            func_0202b980(id) <= 0x4b0 &&
            func_0202b878(id) == 2)
            func_ov002_02253458(player, 0xd, i);
        i++;
    } while (i < *(u32 *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x10));
}
