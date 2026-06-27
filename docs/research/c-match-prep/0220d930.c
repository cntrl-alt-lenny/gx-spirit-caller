/* CAMPAIGN-PREP candidate for func_0220d930 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     c :6 dispatch (==0x16 / ==6); +0x14 bit9 :1 vs f2.a; movcc 0/2 return pair
 *   risk:       the ==0x16 arm returns (b9==a)?0:2 via moveq#0/movne#2 -- if mwcc emits a branch instead of the cond-mov pair, codegen diverges. reshape-able (keep as if/return so the eq/ne fuse). The else-chain shares r1 holding c (one ldrh, two cmp). struct-guessed bit9.
 *   confidence: med
 */
/* func_ov002_0220d930 (ov002, class D, MED) -- batch p_0030, leaf branch-tails.
 * c = f2.c (bits6..11).
 * if c == 0x16: b9 = bit9 of self->f14; a = f2.a; return (b9 == a) ? 0 : 2;
 * else if c == 6: return 1; else return 0.
 */
typedef unsigned short u16;
typedef unsigned int   u32;

typedef struct Entity {
    u16 field0;
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16   : 4;
    u16 _pad6[7];      /* +0x6 .. +0x12 */
    u32 w14_lo : 9;
    u32 w14_b9 : 1;    /* bit 9 of +0x14 */
    u32 w14_hi : 22;
} Entity;

int func_ov002_0220d930(Entity *self)
{
    int c = self->c;
    if (c == 0x16) {
        if (self->w14_b9 == self->a) return 0;
        return 2;
    }
    if (c == 6) return 1;
    return 0;
}
