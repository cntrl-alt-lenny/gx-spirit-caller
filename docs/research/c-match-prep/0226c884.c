/* CAMPAIGN-PREP candidate for func_0226c884 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D clone of 0226c7cc minus arg1==0xb guard; same recipes
 *   risk:       struct-guessed: identical layout assumptions as 0226c7cc (stride 0x14 / +0x30 load, :13 bitfield, byte-pack order). If 7cc's struct is confirmed, this matches with only the removed arg1==0xb branch.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef signed int s32;

extern u8 data_ov002_022cf16c[];   /* two 0x868-byte halves selected by (arg0&1) */
extern u8 data_ov002_022d016c[];   /* global G: u32 at +0xd94 */
extern u8 data_ov002_022d0e6c[];   /* u16 at +0xa2 */

extern s32 func_ov002_021c1e20(s32 a, s32 b, s32 c);

s32 func_ov002_0226c884(s32 arg0, s32 arg1, s32 arg2) {
    s32 idx;
    u32 w;
    u32 key;
    u16 stored;

    if (arg0 != *(u32 *)(data_ov002_022d016c + 0xd94))
        return 0;

    idx = arg1 + arg2;
    if (idx > 0xa)
        return 0;

    w = ((u32 *)((u8 *)data_ov002_022cf16c + (arg0 & 1) * 0x868 + idx * 0x14))[0xc];
    if (((w << 19) >> 19) == 0)   /* :13 bitfield */
        return 0;

    key = (arg0 & 0xff) | ((idx & 0xff) << 8);
    stored = *(u16 *)(data_ov002_022d0e6c + 0xa2);
    if (stored == (u16)key)
        return 0;

    if (func_ov002_021c1e20(arg0, idx, arg0 != (stored & 0xff) ? 1 : 0) != 0)
        return 0;
    return 0x800;
}
