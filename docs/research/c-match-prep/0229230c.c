/* CAMPAIGN-PREP candidate for func_0229230c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: fld2 :2 at bit12 (movs flags); fld5b :5 at bit5; mul (1-bit0),0x868; r4*0x3e8 plain mul; pad0 at +0
 *   risk:       struct-guessed: the f2 bitfield map (bit0:1, fld5b:5 at bit5, fld2:2 at bit12) is inferred from three different lsl/lsr widths on the same halfword; confirm offsets. Also func_021bae7c's 2nd arg is self->pad0 (ldrh [r5] offset 0) — verify. permuter-class: t2!=0 first-return is predicated (moveq;ldmeqia).
 *   confidence: low
 */
/* func_ov002_0229230c (ov002, class D, MED). bitfield extract + mul compare, branch tail.
 * t2 = self->f2.fld2 (:2 at bit12, lsl#0x12;lsr#0x1e, movs);  if t2 == 0 return 1;
 * r4 = func_021b9bd4(self->f2.bit0, self->f2.fld5b);   (bit0 :1, fld5b :5 at bit5)
 * w = *(int*)(cf16c + (1 - self->f2.bit0 & 1)*0x868);   (mul (1-bit0),0x868)
 * if (w <= r4 * 0x3e8) return 1;
 * if func_021bae7c(self->f2.bit0, self->pad0, -1) > 1) { if (r4 >= 2) return 1; }
 * return 0.
 * NOTE: r4*1000 via mul r4,#0x3e8 (no smull, plain *). pad0 is the ldrh at offset 0. */
typedef unsigned short u16;
struct F2 { u16 bit0 : 1; u16 a4 : 4; u16 fld5b : 5; u16 a2 : 2; u16 fld2 : 2; u16 rest : 2; };
struct Self { u16 pad0; struct F2 f2; };
extern char data_ov002_022cf16c[];
extern int  func_ov002_021b9bd4(unsigned int bit, unsigned int fld);
extern int  func_ov002_021bae7c(int player, int code, int arg);

int func_ov002_0229230c(struct Self *self) {
    int r4;
    if (self->f2.fld2 == 0)
        return 1;
    r4 = func_ov002_021b9bd4(self->f2.bit0, self->f2.fld5b);
    if (*(int *)(data_ov002_022cf16c + ((1 - self->f2.bit0) & 1) * 0x868) <= r4 * 0x3e8)
        return 1;
    if (func_ov002_021bae7c(self->f2.bit0, self->pad0, -1) > 1) {
        if (r4 >= 2)
            return 1;
    }
    return 0;
}
