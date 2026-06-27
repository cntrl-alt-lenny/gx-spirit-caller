/* CAMPAIGN-PREP candidate for func_0220c04c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: kind :6 bitfield; w explicit (w<<a)>>b shifts; ordered guard chain; tail-call self in r0
 *   risk:       reshape-able: r0(self) preserved across (only r2/r3/ip used) for the tail bl 022020e0 -- self must reach the call unmodified; the movs-flag b15 test vs explicit cmp on bits10-13/19-22 may re-order. w bound once in r3.
 *   confidence: med
 */
/* func_ov002_0220c04c (ov002, class D, MED) — batch p_0027.
 * kind==0x16; w.b9==w2.b0; bits10-13<=4; w.b15 set; bits19-22==0xe;
 * then tail-call 022020e0(self). else 0. Sibling of 0220b9ac (subset of tests). */
typedef unsigned short u16;
typedef unsigned int u32;

struct Self0220c04c {
    u16 f0;
    struct { u16 b0:1; u16 f1:5; u16 kind:6; u16 f12:2; u16 _t:2; } w2; /* +0x2 */
    unsigned char _pad4[0x10];
    u32 w;                                                            /* +0x14 */
};

extern int func_ov002_022020e0(struct Self0220c04c *self);

int func_ov002_0220c04c(struct Self0220c04c *self) {
    u32 w;
    if (self->w2.kind != 0x16) return 0;
    w = self->w;
    if (((w << 22) >> 31) != (u32)self->w2.b0) return 0;   /* w.b9 vs w2.b0 */
    if (((w << 18) >> 28) > 4) return 0;                   /* bits10-13 */
    if (((w << 16) >> 31) == 0) return 0;                  /* w.b15 set */
    if (((w << 9) >> 28) != 0xe) return 0;                 /* bits19-22 == 14 */
    return func_ov002_022020e0(self);
}
