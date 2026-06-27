/* CAMPAIGN-PREP candidate for func_0220bafc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: w2 :N bitfields; (word>>17)&1 explicit; &1 disc *0x868; goto for branch split
 *   risk:       permuter-class: note flags 'scheduling risk' -- the two disc*0x868 muls + (word>>17)&1 tst and the f12!=0 branch split are reg/schedule-sensitive; tail 021ff3bc and the two 021b3ecc arg sets may rotate regs.
 *   confidence: low
 */
/* func_ov002_0220bafc (ov002, class D, MED) — batch p_0027.
 * branch split on w2 bits12-13: if 0 -> table021bba(b0) bit17 test + 021b3ecc(b0,0xb,0x12f3) inverted;
 * else -> 021b3ecc(b0,w2.f1,f0) guard, table021bbc(b0) guard, tail 021ff3bc(self,arg1). */
typedef unsigned short u16;
typedef unsigned int u32;

struct Self0220bafc {
    u16 f0;
    struct { u16 b0:1; u16 f1:5; u16 kind:6; u16 f12:2; u16 _t:2; } w2; /* +0x2 */
    unsigned char _pad4[0x10];
    u32 w;                                                            /* +0x14 */
};

extern unsigned char data_ov002_022cf288[];   /* per-disc 0x868-stride word table */
extern unsigned char data_ov002_022cf17c[];   /* per-disc 0x868-stride word table */
extern int func_ov002_021b3ecc(int a, int b, int c);
extern int func_ov002_021ff3bc(struct Self0220bafc *self, int arg1);

int func_ov002_0220bafc(struct Self0220bafc *self, int arg1) {
    u32 word;
    if (((self->w2.f12) ) != 0) goto split;
    word = *(u32 *)(data_ov002_022cf288 + (self->w2.b0 & 1) * 0x868);
    if (((word >> 17) & 1) != 0) return 0;
    return func_ov002_021b3ecc(self->w2.b0, 0xb, 0x12f3) == 0 ? 1 : 0;
split:
    if (func_ov002_021b3ecc(self->w2.b0, self->w2.f1, self->f0) == 0) return 0;
    if (*(u32 *)(data_ov002_022cf17c + (self->w2.b0 & 1) * 0x868) == 0) return 0;
    return func_ov002_021ff3bc(self, arg1);
}
