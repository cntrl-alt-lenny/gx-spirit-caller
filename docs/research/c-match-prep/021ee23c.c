/* CAMPAIGN-PREP candidate for func_021ee23c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: f30 :13, b0:1 compare, shared idx*20, self->f0 as 3rd arg, tail v<=3 movle/movgt
 *   risk:       orig does ldrh r2,[r6] (self->f0) JUST before the 021c1a2c call (r2=3rd arg) - if mwcc loads f0 earlier the schedule shifts; plus shared-ioff +0x30 f30 add-order coin-flip. The v<=3 as if-assign (movle/movgt) is stable. permuter-class (already .s-shipped).
 *   confidence: low
 */
/* func_ov002_021ee23c - CLASS D. idx>=5 ->0; f30 slot bitfield; self->b0!=player ->0;
 * cf1a4[0]!=0 guard; reads self->f0 (021c1a2c gets it as 3rd arg);
 * 021c1a2c(player,idx,self->f0)==0 ->0; 021c1e44(self,player,idx)!=0 ->0;
 * v=021c84e0(player,idx); return v<=3. b0 = u16:1 at +2; self->f0 = u16 at +0. */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; u16 _r : 15; };
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c1a2c(int player, int idx, int f0);
extern int func_ov002_021c1e44(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021c84e0(int player, int idx);

int func_ov002_021ee23c(struct Ov002Self *self, int player, int idx) {
    int poff, ioff, v;
    if (idx >= 5)
        return 0;
    poff = (player & 1) * 0x868;
    ioff = idx * 20;
    if (((struct Ov002Slot *)(data_ov002_022cf16c + poff + ioff + 0x30))->id == 0)
        return 0;
    if (self->b0 != player)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + poff + ioff) == 0)
        return 0;
    if (func_ov002_021c1a2c(player, idx, self->f0) == 0)
        return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0)
        return 0;
    v = func_ov002_021c84e0(player, idx);
    if (v <= 3)
        return 1;
    return 0;
}
