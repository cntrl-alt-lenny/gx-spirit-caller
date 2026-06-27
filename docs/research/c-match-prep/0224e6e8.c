/* CAMPAIGN-PREP candidate for func_0224e6e8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla base+0x120; reload raw word for shift-decode; sequential early-return guards; unused r1 param
 *   risk:       decoded-selector shift expr (((word<<2)>>24)<<1)+((word<<18)>>31) must emit exact lsl#2;lsr#24;lsl#18;lsl#1;add lsr#31 — operator precedence/extra mov likely diverges; also unused middle param b may not reserve r1. permuter-class.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224e6e8 (ov002, class D, MED tier) — brief 069.
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 * Drop into src/, run ninja + objdiff, apply the risk note if <100%.
 *   recipe:     mla base+0x120; packed-field decode via shifts; 4-deep pred chain
 *   confidence: low
 */
/* func_ov002_0224e6e8: single slot[index] (kind 0xb). word at base+0x120 + index*4.
 * id = word&0x1fff (13-bit). Decoded selector = ((word<<2)>>24)<<1 + (word<<18)>>31
 * = field[29:22]*2 + bit13. Continue only when func_0202e234(id)!=0,
 * func_0202de9c(id)==0, func_ov002_021c38c4(player,sel)==4,
 * func_ov002_021ca440(player,id)!=0; then post kind-0xb. Middle param r1 unused. */
#include "ov002_core.h"
extern int func_0202e234(int id);
extern int func_0202de9c(int id);
extern int func_ov002_021c38c4(int player, int sel);
extern int func_ov002_021ca440(int player, int id);
void func_ov002_0224e6e8(int player, int b, int index) {
    struct Ov002Slot *slot = (struct Ov002Slot *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x120);
    unsigned int word;
    int id = slot[index].id;
    if (func_0202e234(id) == 0)
        return;
    if (func_0202de9c(id) != 0)
        return;
    word = ((unsigned int *)slot)[index];
    if (func_ov002_021c38c4(player, (int)(((word << 2) >> 24) << 1) + (int)(word << 18) >> 31) != 4)
        return;
    if (func_ov002_021ca440(player, id) == 0)
        return;
    func_ov002_02253458(player, 0xb, index);
}
