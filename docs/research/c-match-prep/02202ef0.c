/* CAMPAIGN-PREP candidate for func_02202ef0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     b12 bitfield; unpack packed return via (u16)/&0xff/&1; mla index; ldrh+mask compare
 *   risk:       the packed-return unpack: orig does (v&0xffff)>>8&0xff and a <<16>>16 high-half round-trip; mwcc's exact lsl/lsr/and sequence for these casts is a known finicky shape. permuter-class (cast peephole/scheduling).
 *   confidence: low
 */
/* func_ov002_02202ef0 (cls D): self->b12 (h2 bits12..13)==2, then v=func_021b947c(
 * self->f14 >> 3); require (v>>8)&0xff==0xf; index cf8f4 (u16) by (v&1)*0x868 +
 * ((u16)(v>>16))*2, return (low byte)==0x40. v is a packed int unpacked by casts;
 * the round-trip <<16>>16 on the high half is the (u16) cast. */
typedef unsigned short u16;
struct self_t { u16 f0; u16 :12; u16 b12 : 2; };
extern char data_ov002_022cf8f4[];
extern int func_ov002_021b947c(int x);
int func_ov002_02202ef0(struct self_t *self) {
    int v;
    int hi;
    if (self->b12 != 2)
        return 0;
    v = func_ov002_021b947c(*(int *)((char *)self + 0x14) >> 3);
    if (((v >> 8) & 0xff) != 0xf)
        return 0;
    hi = (u16)(v >> 16);
    return (*(u16 *)(data_ov002_022cf8f4 + (v & 1) * 0x868 + hi * 2) & 0xff) == 0x40;
}
