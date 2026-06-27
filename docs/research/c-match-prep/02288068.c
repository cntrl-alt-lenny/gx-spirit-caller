/* CAMPAIGN-PREP candidate for func_02288068 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :8 bitfield hi-byte store (bic/orr) kept before call; byte-split via (u16)>>8; bit0 :1 field; 1-bit0 rsb
 *   risk:       asm does (u16)y then asr#8 (mov lsl16/lsr16 then asr8); my (u16)y>>8 emits lsr8 not asr8 -> 1-insn diff. reshape-able: drop the (u16), use signed int y>>8 to force asr.
 *   confidence: low
 */
/* func_ov002_02288068 (ov002, cls D): store-order RMW of field6 high byte +
 * byte-split of a packed return. self at r0/r4.
 *   x = func_022576d8(self); y = func_0227d684(self->b.bit0, 0, x);
 *   if (y < 0) return 0;
 *   field6.hi8 = 1;  (bic #0xff00; orr #0x100 -> :8 bitfield store BEFORE c8470)
 *   field8 = func_021c8470(y & 0xff, (hi byte of y));
 *   return func_02257ab8(self, 1 - self->b.bit0) > 0;
 */
typedef unsigned short u16;
typedef unsigned char  u8;
struct S02288068 {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
    u16 lo8  : 8;   /* offset 4 padding word .. */
    u16 _pad4 : 8;
    u16 f6lo : 8;   /* offset 6 low byte  */
    u16 f6hi : 8;   /* offset 6 high byte */
    u16 f8;         /* offset 8 */
};
extern int  func_ov002_022576d8(struct S02288068 *self);
extern int  func_ov002_0227d684(int a, int b, int c);
extern int  func_ov002_021c8470(int a, int b);
extern int  func_ov002_02257ab8(struct S02288068 *self, unsigned int bit);
int func_ov002_02288068(struct S02288068 *self) {
    int x = func_ov002_022576d8(self);
    int y = func_ov002_0227d684(self->bit0, 0, x);
    if (y < 0) return 0;
    self->f6hi = 1;
    self->f8 = (u16)func_ov002_021c8470(y & 0xff, ((u16)y >> 8) & 0xff);
    return func_ov002_02257ab8(self, 1 - self->bit0) > 0;
}
