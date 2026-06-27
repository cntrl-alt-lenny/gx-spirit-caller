/* CAMPAIGN-PREP candidate for func_0221eda8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     per-player 0x868 mla slot; 32-bit slot word + asymmetric-shift field compare; bit0 reused as index
 *   risk:       Slot WORD read + asymmetric shift extraction (lsl#2;lsr#24 etc) and the cf1a4[flag*0x868+flag] reuse of the bit0 reg are struct-guessed; field offsets/sizes must be confirmed against the real slot struct. struct-guessed.
 *   confidence: low
 */
/* func_ov002_0221eda8: per-player (0x868 stride) slot lookup + packed-bitfield
 * equality guard, then a cf1a4 table gate and 02257b48 gate before forwarding
 * (self, arg1) to 02210104 (cls D). The slot WORD is read 32-bit and compared
 * field-vs-field; shifts are asymmetric so written as raw shift exprs. r3 (the
 * alignment-pushed reg) doubles as the flag and the cf1a4 byte index. */
typedef unsigned int   u32;
typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; u16 f1 : 5; u16 : 0; u16 f4; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_02210104(struct Self *self, int arg1);
extern int  func_ov002_02257b48(void);
int func_ov002_0221eda8(struct Self *self, int arg1) {
    int flag = self->b0 & 1;
    int v = *(int *)(data_ov002_022cf16c + flag * 0x868 + self->f1 * 0x14 + 0x30);
    int lhs = (u32)(self->f4 << 17) >> 23;
    int rhs = (((u32)(v << 2) >> 24) << 1) + ((u32)(v << 18) >> 31);
    if (lhs != rhs)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + flag * 0x868 + flag) == 0)
        return 0;
    if (func_ov002_02257b48() == 0)
        return 0;
    return func_ov002_02210104(self, arg1);
}
