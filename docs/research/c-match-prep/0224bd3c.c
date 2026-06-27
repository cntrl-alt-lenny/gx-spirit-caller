/* CAMPAIGN-PREP candidate for func_0224bd3c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Ov002Slot :13 id; reload word; raw asymmetric shifts *2+topbit; cmp>4 (ldmgt)
 *   risk:       021c38c4 arg word: orig RELOADS [r7,r5,lsl#2] (separate from the id ldr); mwcc may CSE base+idx and reuse the first word -> 1 ldr off. reshape-able (force reload via *(u32*)(base+idx*4+288)); arg is signed-cmp >4 so keep int.
 *   confidence: med
 */
/* func_ov002_0224bd3c: idx slot in player's cf16c block; guard id via
 * func_ov002_021b9128, then require func_ov002_021c38c4(player, 2*B+topbit) <= 4
 * and 021ca440(player,id), then post kind 11 via 02253458. cls D: :13 id
 * bitfield, B/C asymmetric extract from a RELOADED packed word (orig re-loads at
 * [r7,r5,lsl#2] for the 021c38c4 arg). */
#include "ov002_core.h"
extern int func_ov002_021b9128(int a);
extern int func_ov002_021c38c4(int player, int arg1);
extern int func_ov002_021ca440(int player, int id);
void func_ov002_0224bd3c(int player, int arg1, int idx) {
    char *base = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    int id = ((struct Ov002Slot *)(base + idx * 4 + 288))->id;
    unsigned int word;
    if (func_ov002_021b9128(id) == 0)
        return;
    word = *(unsigned int *)(base + idx * 4 + 288);
    if (func_ov002_021c38c4(player, (int)(((unsigned)(word << 2) >> 24) * 2 + ((unsigned)(word << 18) >> 31))) > 4)
        return;
    if (func_ov002_021ca440(player, id) == 0)
        return;
    func_ov002_02253458(player, 11, idx);
}
