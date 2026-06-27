/* CAMPAIGN-PREP candidate for func_02066d44 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bswap32 4-shift/and/orr idiom; store-then-test (orrs); :u16 low-half; ordered field stores
 *   risk:       orr operand-order: orig does (c|prev),(d|prev) so dest-reg pick may invert vs source left-assoc a|b|c|d; struct offsets +0xA8/+0x104/+0x108/+0x10C guessed — struct-guessed + reshape-able(operand-order).
 *   confidence: med
 */
/* func_02066d44 @ 0x02066d44  (cls D, main) — sscanf-style read of one u32 + one u16,
   big-endian byteswap of the u32, dedup-store into struct, fire callback.
   func_020aac84(str, fmt, &out32, &out16) is the variadic reader; data_02101778 = format literal. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern const char data_02101778[];
extern void func_020aac84(const char *s, const char *fmt, u32 *a, u32 *b);

typedef struct Obj {
    u8  pad0[0xA8];
    void (*cb)(u32 val, u16 hw, void *ctx); /* +0xA8 */
    u8  pad1[0x104 - 0xAC];
    u32 val;                                /* +0x104 */
    u8  pad2[0x108 - 0x108];
    u16 hw;                                 /* +0x108 */
    u8  pad3[0x10C - 0x10A];
    void *ctx;                              /* +0x10C */
} Obj;

int func_02066d44(Obj *o, const char *s)
{
    u32 raw, raw2;
    u32 v;
    u16 h;

    func_020aac84(s, data_02101778, &raw, &raw2);
    v = ((raw >> 24) & 0xFF) | ((raw >> 8) & 0xFF00) | ((raw << 8) & 0xFF0000) | ((raw << 24) & 0xFF000000);
    /* the original re-stores the swapped value to the scratch slot then tests it */
    if (v == 0) return 0;
    h = (u16)raw2;
    if (h == 0) return 0;

    if (o->val == v) {
        if (o->hw == h) return 0;
    }
    o->val = v;
    o->hw  = h;
    o->cb(v, h, o->ctx);
    return 0;
}
