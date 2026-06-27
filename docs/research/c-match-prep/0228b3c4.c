/* CAMPAIGN-PREP candidate for func_0228b3c4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bit0 :1 + 1-bit0 rsb; (u8)f6 = lsl24/lsr24 low byte; 0223de94 hi byte (>>8)&0xff > 0xa; equality cmp of two bit0 fields
 *   risk:       the final return: orig does lsl16;lsr16 (u16-mask) then asr8 then &0xff on 0223de94's u16 return; my (ret>>8)&0xff on a u16-typed value emits lsr8 -> 1-insn asr/lsr diff. reshape-able: assign to signed int first then >>8 for asr.
 *   confidence: med
 */
/* func_ov002_0228b3c4 (ov002, cls D): guard chain over self(r5) + other(r4/arg1).
 *   if (func_021ff2b8(self, 1 - self->bit0) != 3) return 0;
 *   if (func_021bbf50(1 - self->bit0) == 0) return 1;
 *   if (arg1 == 0) return 0;
 *   if (arg1->bit0 == self->bit0) return 0;
 *   if ((u8)arg1->f6 == 0) return 0;          lsl24;lsr24 = low byte of field6
 *   return (((func_0223de94(arg1, 0) >> 8) & 0xff) > 0xa);  hi byte (b1_4)
 */
typedef unsigned short u16;
struct S0228b3c4 { u16 f0; u16 bit0:1; u16 rest:15; u16 _pad4; u16 f6; };
extern int func_ov002_021ff2b8(struct S0228b3c4 *self, unsigned int notbit);
extern int func_ov002_021bbf50(unsigned int notbit);
extern u16 func_ov002_0223de94(struct S0228b3c4 *node, int idx);
int func_ov002_0228b3c4(struct S0228b3c4 *self, struct S0228b3c4 *arg1) {
    if (func_ov002_021ff2b8(self, 1 - self->bit0) != 3) return 0;
    if (func_ov002_021bbf50(1 - self->bit0) == 0) return 1;
    if (arg1 == 0) return 0;
    if (arg1->bit0 == self->bit0) return 0;
    if ((unsigned char)arg1->f6 == 0) return 0;
    return ((func_ov002_0223de94(arg1, 0) >> 8) & 0xff) > 0xa;
}
