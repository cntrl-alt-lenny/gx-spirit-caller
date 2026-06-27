/* CAMPAIGN-PREP candidate for func_0224ea54 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla base+0x120; raw-word shift-decode; signed <7 early-return (bge continue); unused r1 param
 *   risk:       decoded-selector ((word<<2)>>24)<<1 + (word<<18)>>31 must emit exact lsl#2;lsr#24;lsl#18;lsl#1;add lsr#31 — precedence/parenthesization or an extra mov likely diverges; unused middle param b may not reserve r1. permuter-class.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224ea54 (ov002, class D, MED tier) — brief 069.
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 * Drop into src/, run ninja + objdiff, apply the risk note if <100%.
 *   recipe:     mla base+0x120; packed-field shift-decode; single pred >=7
 *   confidence: low
 */
/* func_ov002_0224ea54: single slot[index] (kind 0xb). word at base+0x120 +
 * index*4. Decoded selector = ((word<<2)>>24)<<1 + (word<<18)>>31 =
 * field[29:22]*2 + bit13. If func_ov002_021c38c4(player,sel) >= 7, post kind-0xb.
 * Middle param r1 unused (clobbered by literal load). */
#include "ov002_core.h"
extern int func_ov002_021c38c4(int player, int sel);
void func_ov002_0224ea54(int player, int b, int index) {
    unsigned int word = *(unsigned int *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x120 + index * 4);
    if (func_ov002_021c38c4(player, (int)(((word << 2) >> 24) << 1) + (int)(word << 18) >> 31) < 7)
        return;
    func_ov002_02253458(player, 0xb, index);
}
