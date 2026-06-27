/* CAMPAIGN-PREP candidate for func_0220b8e8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: w2 :N bitfields; w explicit (w<<a)>>b shifts; LUT byte-offset; reload w for b17
 *   risk:       reshape-able/struct-guessed: orig binds w in r3 for LUT+b9 then RELOADS at +0x14 for b17; if mwcc keeps the local in-reg the final ldr diverges -- forced via self->w. Also k computed pre-guard (scheduling).
 *   confidence: low
 */
/* func_ov002_0220b8e8 (ov002, class D, MED) — batch p_0027.
 * Sibling of func_0220b31c: same data_022d0250 u16 LUT, same packed +0x14 word.
 * guard 021bcd80(w2.b0,-1); kind==8; LUT13 -> id; w.b9 == 1-w2.b0; 0202e2c8/02030b84; ret w.b17!=0. */
typedef unsigned short u16;
typedef unsigned int u32;

struct Self0220b8e8 {
    u16 f0;
    struct { u16 b0:1; u16 f1:5; u16 kind:6; u16 f12:2; u16 _t:2; } w2; /* +0x2 */
    unsigned char _pad4[0x10];
    u32 w;                                                            /* +0x14 packed */
};

extern unsigned char data_ov002_022d0250[];      /* u16 LUT, byte-offset addressed */
extern int func_ov002_021bcd80(int b0, int key);
extern int func_0202e2c8(int id);
extern int func_02030b84(int id);

int func_ov002_0220b8e8(struct Self0220b8e8 *self) {
    u32 w;
    int k;
    if (func_ov002_021bcd80(self->w2.b0, -1) == 0) return 0;
    if (self->w2.kind != 8) return 0;
    w = self->w;
    k = *(u16 *)(data_ov002_022d0250 + ((w << 23) >> 21));
    k = (k << 19) >> 19;
    if (((w << 22) >> 31) != (u32)(1 - self->w2.b0)) return 0;
    if (func_0202e2c8(k) == 0) return 0;
    if (func_02030b84(k) == 0) return 0;
    return ((self->w << 14) >> 31) != 0 ? 1 : 0;
}
