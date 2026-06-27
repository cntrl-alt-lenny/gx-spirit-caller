/* CAMPAIGN-PREP candidate for func_021edd4c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: f30 :13 bitfield, idx*20 shared, separate cf16c/cf1a4 symbols, decl poff before ioff
 *   risk:       shared ioff feeds f30(+0x30) read AND cf1a4 read, so mwcc muls once then 2 adds; the +0x30 add operand order (add r0,r0,ip) is gotcha-19 commutative coin-flip. permuter-class (already .s-shipped).
 *   confidence: low
 */
/* func_ov002_021edd4c - CLASS D. idx range, f30 slot-id bitfield guard, cf1a4[0]!=0
 * guard, self->fa!=0 guard, then 021c84e0(player,idx)==self->fa -> 1 else 0.
 * Per-player 0x868 stride; idx*20 (0x14) sub-row; cf16c/cf1a4 parallel tables.
 * f30 is a 13-bit bitfield (lsl#19;lsr#19) - NEVER (v<<19)>>19 (folds to mask). */
typedef unsigned short u16;
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c84e0(int player, int idx);

int func_ov002_021edd4c(void *self, int player, int idx) {
    int poff, ioff;
    if (idx >= 5)
        return 0;
    poff = (player & 1) * 0x868;
    ioff = idx * 20;
    if (((struct Ov002Slot *)(data_ov002_022cf16c + poff + ioff + 0x30))->id == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + poff + ioff) == 0)
        return 0;
    if (*(u16 *)((char *)self + 0xa) == 0)
        return 0;
    if (func_ov002_021c84e0(player, idx) == *(u16 *)((char *)self + 0xa))
        return 1;
    return 0;
}
