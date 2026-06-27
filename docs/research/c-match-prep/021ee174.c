/* CAMPAIGN-PREP candidate for func_021ee174 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: f30 :13, shared idx*20, forward 3 args twice, b0:1 compare, two-call tail
 *   risk:       shared ioff -> mul-once + the +0x30 f30 add (add lr,lr,ip) gotcha-19 operand-order coin-flip; also two pass-through calls keep self/player/idx live in r6/r5/r4 - allocation order across both calls is reg-alloc fragile. permuter-class (already .s-shipped).
 *   confidence: low
 */
/* func_ov002_021ee174 - CLASS D. idx>=5 ->0; f30 slot bitfield; cf1a4[0]!=0 guard;
 * 021c1ef0(self,player,idx)==0 ->0; 021c1e44(self,player,idx)!=0 ->0; self->b0!=player
 * -> 1; else 021b9ecc(player) then 021c1e44... no: tail 021b9ecc(player,idx) then
 * 0202e79c() (both void-ish), fall through to default epilogue (r0 = whatever).
 * b0 = u16:1 at +2. Two-call tail. */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; u16 _r : 15; };
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c1ef0(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021c1e44(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021b9ecc(int player, int idx);
extern int func_0202e79c(void);

int func_ov002_021ee174(struct Ov002Self *self, int player, int idx) {
    int poff, ioff;
    if (idx >= 5)
        return 0;
    poff = (player & 1) * 0x868;
    ioff = idx * 20;
    if (((struct Ov002Slot *)(data_ov002_022cf16c + poff + ioff + 0x30))->id == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + poff + ioff) == 0)
        return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0)
        return 0;
    if (self->b0 != player)
        return 1;
    func_ov002_021b9ecc(player, idx);
    return func_0202e79c();
}
