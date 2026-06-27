/* CAMPAIGN-PREP candidate for func_02204290 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     range (u16)(b6_11-0x12)<=1; bit0>>31 cmp-fold; pass-through arg1 tail-call
 *   risk:       reshape-able(immediate-form): orig codes the range as add#0xee;add#0xff00 (+0xffee). If mwcc emits sub#0x12 instead, write (u16)(b6_11+0xffee) to force the two-add form.
 *   confidence: med
 */
/* func_ov002_02204290: cls D. Require b6_11 in {0x12,0x13} and d016c.fcec==bit0;
 * then if either cd3f4 side (f0/f1c or f4/f20) matches (bit0, b1_5), tail-call
 * 0220803c(self, arg1) passing the incoming arg through; else 0. */
typedef unsigned short u16;

struct Ov002Self { u16 f0; u16 b0 : 1; };

struct S02204290 {
    u16 f0;
    u16 bit0 : 1;
    u16 b1_5 : 5;
    u16 b6_11 : 6;
    u16 b12_15 : 4;
};

struct Cd3f4_290 {
    int f0;
    int f4;
    int pad8[5];      /* +0x08 .. +0x18 */
    int f1c;          /* +0x1c */
    int f20;          /* +0x20 */
};

extern char data_ov002_022d016c[];
extern struct Cd3f4_290 data_ov002_022cd3f4;
extern int func_ov002_0220803c(struct Ov002Self *self, int arg1);

int func_ov002_02204290(struct Ov002Self *self, int arg1) {
    struct S02204290 *s = (struct S02204290 *)self;
    if ((u16)(s->b6_11 - 0x12) > 1) return 0;
    if (*(int *)(data_ov002_022d016c + 0xcec) != s->bit0) return 0;
    if (data_ov002_022cd3f4.f0 == s->bit0 &&
        data_ov002_022cd3f4.f1c == s->b1_5)
        return func_ov002_0220803c(self, arg1);
    if (data_ov002_022cd3f4.f4 != s->bit0) return 0;
    if (data_ov002_022cd3f4.f20 == s->b1_5)
        return func_ov002_0220803c(self, arg1);
    return 0;
}
