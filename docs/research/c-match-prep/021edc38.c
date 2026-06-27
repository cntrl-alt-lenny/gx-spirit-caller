/* CAMPAIGN-PREP candidate for func_021edc38 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: if(idx<5) 021b8fcc gate; mla addr +0x30 split; :13 flags via <<19>>19; packed reconstruct eq->0
 *   risk:       reconstruct ((raw>>22&0xff)<<1)+(raw>>31) == (u4>>6)&0x1ff; the +>>31 carry-in plus the 'add base,#0x30' then ldr[+row] split is the divergence — permuter-class on shift schedule. struct-guessed bits + u4 offset.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_021edc38 (ov002, class D, MED tier) — brief 498.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: if(index<5) func_021b8fcc(p,idx)==0->0 else fallthrough; MLA-ish index then add #0x30; e->flags :13; packed-field reconstruct cmp (raw bits == self->u4 bits ->0); then func_021c1ef0 ->1
 *   risk:       same non-contiguous reconstruct as 021ecd6c: lhs=((raw>>22&0xFF)<<1)+(raw>>31) compared to (self->u4>>6)&0x1ff, equality returns 0. The +>>31 carry-in and the add #0x30 base split (add r0,r1,#0x30; ldr [r0,row]) are the divergence points — permuter-class on the shift schedule. struct-guessed raw bit layout + u4 offset.
 *   confidence: low
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CardEnt30 { u32 _pad[12]; u32 flags : 13; };
struct Obj02 { u16 f0; u16 f2; u16 f4; };

extern char data_ov002_022cf16c[];
extern int  func_ov002_021b8fcc(int player, int index);
extern int  func_ov002_021c1ef0(void *self, int player, int index);

int func_ov002_021edc38(struct Obj02 *self, int player, int index)
{
    int base;
    u32 raw;
    u32 lhs;
    u32 rhs;

    if (index < 5) {
        if (func_ov002_021b8fcc(player, index) == 0)
            return 0;
    }

    base = (player & 1) * 0x868 + (int)data_ov002_022cf16c;
    raw  = *(u32 *)(base + 0x30 + index * 0x14);
    if ((raw << 19 >> 19) == 0)
        return 0;

    lhs = (((raw >> 22) & 0xFF) << 1) + (raw >> 31);
    rhs = ((u32)self->f4 >> 6) & 0x1FF;
    if (lhs == rhs)
        return 0;

    if (func_ov002_021c1ef0(self, player, index) == 0)
        return 0;
    return 1;
}
