/* CAMPAIGN-PREP candidate for func_0220d43c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfields a/b and +0x4 mid9; index<<2 halfword load then signed :13 narrow; 021c1ad0 result held in r4
 *   risk:       the d0250 element is loaded ldrh then sign-narrowed (lsl#0x13;lsr#0x13 => signed 13b); modeled as ushort load + (t<<19)>>19. If the real table is a typed signed-short[] the cast/stride matches, but element width is struct-guessed (stride 2 vs 4). struct-guessed.
 *   confidence: low
 */
/* func_ov002_0220d43c (ov002, class D, MED) -- batch p_0030.
 * r4 = 021c1ad0(f2.a, f2.b);
 * t = d0250[ (f4.mid6 << 2) ] as halfword, sign? -> (h<<19)>>19 signed 13-bit;
 * if 0202ed04(t)==0 goto L84; if 021bb264(f2.a, r4)==0 goto L84;
 * w14 = self->f14; if w14==0 return 1 else 0;
 * L84: return self->f14.
 *   f2.a   = bit0           : (x<<31)>>31
 *   f2.b   = bits1..5       : (x<<26)>>27
 *   f4.mid = bits6..14 of +0x4 halfword : (x<<17)>>23  (width9, lo6)
 * decl-order: self r5, r4 holds 021c1ad0 result across the d0250 unpack + 021bb264.
 */
typedef unsigned short u16;

typedef struct Entity {
    u16 field0;        /* +0x0 */
    u16 a : 1;         /* bit 0 */
    u16 b : 5;         /* bits 1..5 */
    u16 c : 6;         /* bits 6..11 */
    u16   : 4;
    u16 f4;            /* +0x4 */
    u16 _pad6[7];      /* +0x6 .. +0x12 */
    int f14;           /* +0x14 */
} Entity;

extern unsigned short data_ov002_022d0250[];
extern int func_0202ed04(int t);
extern int func_ov002_021bb264(int a, int r);
extern int func_ov002_021c1ad0(int a, int b);

int func_ov002_0220d43c(Entity *self)
{
    int r;
    int idx;
    int t;
    r = func_ov002_021c1ad0(self->a, self->b);
    idx = ((self->f4 << 17) >> 23) << 2;
    t = *(unsigned short *)((char *)data_ov002_022d0250 + idx);
    t = (t << 19) >> 19;
    if (func_0202ed04(t) == 0) return self->f14;
    if (func_ov002_021bb264(self->a, r) == 0) return self->f14;
    return self->f14 == 0 ? 1 : 0;
}
