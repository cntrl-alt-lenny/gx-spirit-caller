/* CAMPAIGN-PREP candidate for func_0228887c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: b6_11 via :6 bitfield (lsl14/lsr26); bit0 :1; 1-bit0 rsb; movs r5 -> if(r5==0); gt-0 bool tail
 *   risk:       orig reuses self->bit0 across two calls (ldrh re-read each, lsl31/lsr31). If mwcc CSEs the bitword into one reg the second extract diverges. reshape-able: re-read self->bit0 inline at each call (don't bind a local).
 *   confidence: med
 */
/* func_ov002_0228887c (ov002, cls D): b6_11 guard + cross-call equality.
 *   if (self->b6_11 != 3) return 0;
 *   r5 = func_021bc16c(self->bit0, 0, 1);
 *   if (r5 == 0) return 0;
 *   if (r5 != func_021bbf50(self->bit0)) return 0;
 *   return func_021bc16c(1 - self->bit0, 1, 0) > 0;
 * (021bc16c(uint,int,int), 021bbf50(uint) from ov002_core.h family.)
 */
typedef unsigned short u16;
struct S0228887c { u16 f0; u16 bit0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4; };
extern int func_ov002_021bc16c(unsigned int a, int b, int c);
extern int func_ov002_021bbf50(unsigned int a);
int func_ov002_0228887c(struct S0228887c *self) {
    int r5;
    if (self->b6_11 != 3) return 0;
    r5 = func_ov002_021bc16c(self->bit0, 0, 1);
    if (r5 == 0) return 0;
    if (r5 != func_ov002_021bbf50(self->bit0)) return 0;
    return func_ov002_021bc16c(1 - self->bit0, 1, 0) > 0;
}
