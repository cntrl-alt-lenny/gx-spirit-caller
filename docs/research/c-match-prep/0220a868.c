/* CAMPAIGN-PREP candidate for func_0220a868 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :1/:6 bitfields, strided table guard, u32 bit-extracts as branch chain
 *   risk:       the w bit-extracts use shift+and; orig does lsl;lsr (would need :N bitfields on the u32 at +0x14) — likely diverges to and-mask vs lsl;lsr (reshape-able: model w as bitfields).
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;

struct Obj_0220a868 {
    u16 h0;          /* +0 */
    u16 f0 : 1;      /* +2 bit0 */
    u16 p2a : 5;
    u16 f6 : 6;      /* +2 bits6..11 */
    u16 p2b : 4;
    u8  pad4[0x10];  /* +4 .. +0x13 */
    u32 w;           /* +0x14 */
};

extern u8 data_ov002_022cf17c[];
extern s32 func_ov002_021ca2b8(u32 a);
extern s32 func_ov002_0223f6c4(struct Obj_0220a868 *p);
extern s32 func_ov002_022536e8(u32 a, u16 b, s32 c);

s32 func_ov002_0220a868(struct Obj_0220a868 *p) {
    s32 r;
    s32 v;
    u32 w;
    r = func_ov002_021ca2b8(p->f0);
    if (r == 0) return 0;
    v = *(s32 *)(data_ov002_022cf17c + p->f0 * 0x868);
    if (v == 0) {
        s32 c = func_ov002_0223f6c4(p);
        r = func_ov002_022536e8(p->f0, p->h0, c);
        if (r == 0) return 0;
    }
    if (p->f6 != 0x16) return 0;
    w = p->w;
    if (((w >> 9) & 1) != (u32)p->f0) return 0;
    if (((w >> 10) & 0xf) > 4) return 0;
    if (((w >> 16) & 1) == 0) return 0;
    return ((w >> 19) & 0xf) == 0xe;
}
