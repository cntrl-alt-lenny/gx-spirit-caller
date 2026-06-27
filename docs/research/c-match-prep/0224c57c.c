/* CAMPAIGN-PREP candidate for func_0224c57c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     other=1-player (rsb) bound first so it owns r7; (other&1) drives row/guard/limit; 021c33e4(player,other,i); id read inline (no kept temp); kind-0xe
 *   risk:       decl/reg order: orig keeps player in r8 and other(=rsb) in r7 across the loop, and reads id straight into r0 (no saved temp). If mwcc binds id to a callee-saved reg or swaps player/other colouring, regs diverge. permuter-class (caller/callee-saved coin-flip).
 *   confidence: low
 */
/* func_ov002_0224c57c (ov002, class D) — parity-flipped scan.
 * other = 1 - player (rsb r7,r8,#1). Row select, guard cf180, array+0x418, limit
 * row[0x14] ALL use (other&1). Predicate 021c33e4(player, other, i). Sink first
 * arg is `other`, not player. Post kind-0xe.
 */
#include "ov002_core.h"

struct Ov002Card {
    u32 id  : 13;  /* lsl#0x13;lsr#0x13 */
    u32     : 19;
};
extern char data_ov002_022cf180[];
extern int func_0202e234(int id);
extern int func_ov002_021c33e4(int player, int player2, int idx);

void func_ov002_0224c57c(int player) {
    int other = 1 - player;
    struct Ov002Card *slots = (struct Ov002Card *)((char *)data_ov002_022cf16c + (other & 1) * 0x868 + 0x418);
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf180 + (other & 1) * 0x868) == 0)
        return;
    do {
        if (func_0202e234(slots[i].id) != 0 &&
            func_ov002_021c33e4(player, other, i) != 0)
            func_ov002_02253458(other, 0xe, i);
        i++;
    } while (i < *(u32 *)((char *)data_ov002_022cf16c + (other & 1) * 0x868 + 0x14));
}
