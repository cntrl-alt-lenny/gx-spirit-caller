/* CAMPAIGN-PREP candidate for func_022920dc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: 4 held call results c..f in r5/r4/r7/(tmp); fld5 :5 at bit5; accumulate inner-first (e+f) then -flag
 *   risk:       reshape-able: accumulation/operand order is the lever — asm does (e+f),(d+..),(c+..) with c (=r5, first call) the OUTER accumulator added LAST, and the (fld5<=0xa) bool computed between. If mwcc picks a different add tree or hoists the bool, swap the parenthesization / move the bool to match.
 *   confidence: med
 */
/* func_ov002_022920dc (ov002, class D, MED). repeated bitfield-arg calls, sum-of-flags accumulate.
 * c = func_021bbd14(self->f2.bit0, 0x187c);
 * d = func_021bbd14(self->f2.bit0, 0x1400);
 * e = func_021bbd14(self->f2.bit0, 0x1102);
 * f = func_021bbd14(self->f2.bit0, 0x134a);
 * flag = (self->f2.fld5 (:5 at bit5, lsl#1a;lsr#1b) <= 0xa) ? 1 : 0;
 * n = c + (d + (e + f)) - flag;   (asm: e+f, d+that, then c+that, then sub flag)
 * if (n > 0) return 0;
 * if func_02280980(self->f2.bit0) < 0 return 1; else 0. */
typedef unsigned short u16;
struct F2 { u16 bit0 : 1; u16 a4 : 4; u16 fld5 : 5; u16 rest : 6; };
struct Self { u16 pad0; struct F2 f2; };
extern int func_ov002_021bbd14(unsigned int bit, unsigned int code);
extern int func_ov002_02280980(unsigned int bit);

int func_ov002_022920dc(struct Self *self) {
    int c, d, e, f;
    int n;
    c = func_ov002_021bbd14(self->f2.bit0, 0x187c);
    d = func_ov002_021bbd14(self->f2.bit0, 0x1400);
    e = func_ov002_021bbd14(self->f2.bit0, 0x1102);
    f = func_ov002_021bbd14(self->f2.bit0, 0x134a);
    n = c + (d + (e + f)) - (self->f2.fld5 <= 0xa ? 1 : 0);
    if (n > 0)
        return 0;
    if (func_ov002_02280980(self->f2.bit0) < 0)
        return 1;
    return 0;
}
