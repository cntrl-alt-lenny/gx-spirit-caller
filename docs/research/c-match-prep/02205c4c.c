/* CAMPAIGN-PREP candidate for func_02205c4c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :6 bitfield range-check + W14 :1 bit-compare + tail-call
 *   risk:       reshape-able: orig (f6-6) as add#0xfa+add#0xff00; mwcc likely emits sub#6 then differs on the u16 truncate. The eq-vs-tailcall compare order may also predicate. permuter-class if so.
 *   confidence: low
 */
/* func_ov002_02205c4c (ov002, D) — bitfield range check (f2.f6 in {6,7}) on
 * the :6 field at bits[11:6], then compare word+0x14 bit9 == f2.b0; if equal
 * return 0, else tail-call 021ff3bc(self).
 *   f6   = [r0,#2] lsl#0x14;lsr#0x1a  -> :6 field after b0:1 + :5
 *   (f6+0xfffa) i.e. (f6-6) as u16, cmp #1 bhi -> (f6-6)<=1  == f6==6||f6==7
 *   w14b9 = [r0,#0x14] lsl#0x16;lsr#0x1f -> bit 9 of the word at +0x14
 *   eq path: f2.b0 == w14b9 -> return 0 ; else 021ff3bc(self). */
typedef unsigned short u16;
struct S02205c4c {
    u16 f0;                                     /* +0 */
    struct { u16 b0 : 1; u16 f1 : 5; u16 f6 : 6; u16 rest : 4; } f2;  /* +2 */
};
/* word at +0x14: bit 9 read as :1 via a 32-bit holder */
struct W14 { unsigned int : 9; unsigned int b9 : 1; unsigned int : 22; };

extern int func_ov002_021ff3bc(struct S02205c4c *self);

int func_ov002_02205c4c(struct S02205c4c *self) {
    if ((u16)(self->f2.f6 - 6) > 1)
        return 0;
    if (((struct W14 *)((char *)self + 0x14))->b9 == self->f2.b0)
        return 0;
    return func_ov002_021ff3bc(self);
}
