/* CAMPAIGN-PREP candidate for func_0220a184 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :1 bitfield (lsl31;lsr31), strided global *0x868 mul-index, unsigned cmp
 *   risk:       table stride 0x868 and struct offsets struct-guessed; if real stride differs the mul const diverges (struct-guessed). cmp dir already matches movcs/movcc.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;

struct Obj_0220a184 {
    u16 h0;        /* +0 */
    u16 f0 : 1;    /* +2 bit0 */
    u16 pad2 : 15;
};

extern u8 data_ov002_022cf17c[];
extern u32 func_ov002_021c2f24(u32 a, u32 b);

s32 func_ov002_0220a184(struct Obj_0220a184 *p) {
    u32 r;
    s32 t;
    r = func_ov002_021c2f24(p->f0, p->h0);
    t = *(s32 *)(data_ov002_022cf17c + p->f0 * 0x868);
    return (u32)t >= r + 1;
}
