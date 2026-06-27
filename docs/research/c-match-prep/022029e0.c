/* CAMPAIGN-PREP candidate for func_022029e0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield kind; bind player/idx live across call; let two index products CSE
 *   risk:       orig hoists the cd3f4 player/idx loads INTO the kind cmp-chain (scheduled before the bne gate); mwcc may emit them after the early-return. permuter-class (scheduling).
 *   confidence: med
 */
/* func_ov002_022029e0 (cls D): self->b6 (h2 bits6..11) in {0x12,0x13,0x14};
 * then read player/idx from data_022cd3f4 (.f0/.f1c, kept LIVE to the call),
 * require subrow.f30 (:13) set and cf1a4[player][idx] (u16) set, then forward
 * (self,player,idx) to func_021c1ef0. cf16c/cf1a4 indexes share (player&1)*0x868
 * and idx*20 products (orig CSEs r4/lr across both tables). */
typedef unsigned short u16;
struct self_t { u16 f0; u16 :6; u16 b6 : 6; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int :19; };
struct cd3f4_t { int f0; char _p[0x18]; int f1c; };
extern char data_ov002_022cd3f4[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c1ef0(struct self_t *self, int player, int idx);
int func_ov002_022029e0(struct self_t *self) {
    int kind = self->b6;
    int player;
    int idx;
    if (kind != 0x12 && kind != 0x13 && kind != 0x14)
        return 0;
    player = ((struct cd3f4_t *)data_ov002_022cd3f4)->f0;
    idx = ((struct cd3f4_t *)data_ov002_022cd3f4)->f1c;
    if (((struct subrow *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 0x14))->f30 == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 0x14) == 0)
        return 0;
    return func_ov002_021c1ef0(self, player, idx) != 0;
}
