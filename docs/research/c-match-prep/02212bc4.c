/* CAMPAIGN-PREP candidate for func_02212bc4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: :1/:5/:6 bitfields of hw2; hw2 bound for guard+1st call then reloads; (u16)(1-bit0) (rsb;lsl16;lsr16) stacked as 5th arg.
 *   risk:       struct-guessed: 02210104 called 1-arg (no r1 setup) and 021d59cc 5th arg is u16 — confirm sigs/struct widths. Codegen byte-verified.
 *   confidence: high
 */
/* func_ov002_02212bc4 (ov002, cls D): :6 field@bit6 guard then three calls fed
 * by :1/:5 fields of hw2, with a stacked (u16)(1-bit0) arg. */
typedef unsigned short u16;

struct S02212bc4 {
    u16 f0;                /* +0 */
    u16 b0  : 1;           /* +2 bit0  */
    u16 f1  : 5;           /* +2 bits1-5  ((hw>>1)&0x1f) */
    u16 f6  : 6;           /* +2 bits6-11 ((hw>>6)&0x3f) */
    u16     : 4;
};

extern int  func_ov002_02210104(void *self);
extern void func_ov002_021d5b80(int bit0, int f1, int hw0, int one);
extern int  func_ov002_021d59cc(int bit0, int f1, int hw0, int five, u16 nb);
extern void func_ov002_0226b11c(int bit0, int f1);

int func_ov002_02212bc4(struct S02212bc4 *self) {
    if (self->f6 == 2) {
        return func_ov002_02210104(self);
    }
    func_ov002_021d5b80(self->b0, self->f1, self->f0, 1);
    func_ov002_021d59cc(self->b0, self->f1, self->f0, 5, (u16)(1 - self->b0));
    func_ov002_0226b11c(self->b0, self->f1);
    return 0;
}
