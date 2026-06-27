/* CAMPAIGN-PREP candidate for func_0220d7c0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     c :6 ==8 guard; +0x14 word bit9 :1 bitfield vs f2.a :1; tail call
 *   risk:       the +0x14 access is whole-word ldr then lsl#0x16;lsr#0x1f (bit9) -- modeled as a u32 :1 bitfield. mwcc may emit the bitfield as ldr;lsl;lsr (matching) but the f2.a load order vs the f14 load order can swap. reshape-able (cmp operand order: cmp r3,r2). struct bit-position struct-guessed.
 *   confidence: med
 */
/* func_ov002_0220d7c0 (ov002, class D, MED) -- batch p_0030.
 * c = f2.c (bits6..11); if c != 8 return 0;
 * b9 = bit9 of self->f14 (word); a = f2.a (bit0);
 * if b9 == a return 0; else tail 021ff46c(self).
 *   f2.c : (x<<20)>>26 (width6 lo6)
 *   f14.b9 : (w<<22)>>31  -> :1 bitfield at bit 9 of the +0x14 word
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
    u32 w14_lo : 9;    /* bits 0..8 of +0x14 */
    u32 w14_b9 : 1;    /* bit 9 */
    u32 w14_hi : 22;
} Entity;

extern int func_ov002_021ff46c(Entity *self);

int func_ov002_0220d7c0(Entity *self)
{
    if (self->c != 8) return 0;
    if (self->w14_b9 == self->a) return 0;
    return func_ov002_021ff46c(self);
}
