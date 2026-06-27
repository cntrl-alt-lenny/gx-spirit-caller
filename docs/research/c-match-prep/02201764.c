/* CAMPAIGN-PREP candidate for func_02201764 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     share +2 halfword (bind), field6 mask cmp, signed-cmp guards, rsb invert tail
 *   risk:       orig holds [r4,#2] in r2 across b0+field6 extracts; if mwcc reloads the halfword the 2nd ldrh diverges. reshape-able (single struct member access keeps one ldrh)
 *   confidence: med
 */
/* func_ov002_02201764 (ov002, class C) — batch p_0081.
 * global(cf8)==1, bit0==global(cec), field6<=5, then 021b9aa8(field9@+4)<0,
 * then 021bbf50(bit0)>0 ->1 else 021bbf50(1-bit0)>0.
 * field6 and bit0 share the +2 halfword (orig holds r2 across both extracts).
 */
typedef unsigned short u16;
struct Ov002Self {
    u16 f0;
    u16 b0     : 1;
    u16        : 5;
    u16 field6 : 6;
    u16        : 4;
    u16 a4     : 6;   /* +4 halfword: bits 0..5 unused below */
    u16 field9 : 9;   /* +4 bits 6..14 (lsl#0x11;lsr#0x17) */
};

extern char data_ov002_022d016c[];
extern int func_ov002_021b9aa8(int v);
extern int func_ov002_021bbf50(int bit);

int func_ov002_02201764(struct Ov002Self *self) {
    if (*(int *)(data_ov002_022d016c + 0xcf8) != 1) return 0;
    if (*(int *)(data_ov002_022d016c + 0xcec) != self->b0) return 0;
    if (self->field6 > 5) return 0;
    if (func_ov002_021b9aa8(self->field9) >= 0) return 0;
    if (func_ov002_021bbf50(self->b0) > 0) return 1;
    return func_ov002_021bbf50(1 - self->b0) > 0;
}
