/* CAMPAIGN-PREP candidate for func_02203290 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 bitfield arg; asymmetric raw shift for f4 field; 5-arg call (stack); b2 bitfield tail
 *   risk:       stack-arg ordering: orig does sub sp,#4; str#1 BEFORE the call (5th arg=1) and tears it down per-path; if the 5th arg or its frame teardown differ, epilogue diverges. reshape-able (confirm arg5=1 / arg order).
 *   confidence: med
 */
/* func_ov002_02203290 (cls D): call func_021ff14c(self->b0, 1, (self->f4 bits6..14), 0, 1)
 * (5th arg on stack); if nonzero return 2; else return (self->b12 (h2 bits2..3))==0 ? 1 : 0.
 * f4 field is an ASYMMETRIC <<17>>23 extract -> raw shift, not a bitfield. */
typedef unsigned short u16;
struct self_t { u16 f0; u16 b0 : 1; u16 :1; u16 b2 : 2; };
extern int func_ov002_021ff14c(int a, int b, int c, int d, int e);
int func_ov002_02203290(struct self_t *self) {
    int field = (unsigned int)(*(u16 *)((char *)self + 4) << 17) >> 23;
    if (func_ov002_021ff14c(self->b0, 1, field, 0, 1) != 0)
        return 2;
    return self->b2 == 0 ? 1 : 0;
}
