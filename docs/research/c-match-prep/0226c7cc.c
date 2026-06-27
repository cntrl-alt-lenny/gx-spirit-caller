/* CAMPAIGN-PREP candidate for func_0226c7cc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D mla index, :13 bitfield(lsl19/lsr19), byte-pack orr arg0-first, store-order returns
 *   risk:       struct-guessed: stride 0x14 yet load at +0x30 means the array base or element layout is inferred (used cast[idx*0x14])[0xc]); the 13-bit test must be a :13 bitfield (mask would emit 'and' not lsl;lsr). Confirm offsets.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef signed int s32;

/* element stride 0x14; word read at +0x30 (idx*0x14 + 0x30); low 13 bits = :13 bitfield */
extern u8 data_ov002_022cf16c[];   /* two 0x868-byte halves selected by (arg0&1) */
extern u8 data_ov002_022d016c[];   /* global G: u32 at +0xd94 */
extern u8 data_ov002_022d0e6c[];   /* u16 at +0xa2 */

extern s32 func_ov002_021c1e20(s32 a, s32 b, s32 c);

s32 func_ov002_0226c7cc(s32 arg0, s32 arg1, s32 arg2) {
    s32 idx;
    u32 w;
    u32 key;
    u16 stored;

    if (arg0 != *(u32 *)(data_ov002_022d016c + 0xd94))
        return 0;

    if (arg1 == 0xb)
        return 0x800;

    idx = arg1 + arg2;
    if (idx > 0xa)
        return 0;

    /* base + (arg0&1)*0x868 ; element idx (stride 0x14) ; word at +0x30 */
    w = ((u32 *)((u8 *)data_ov002_022cf16c + (arg0 & 1) * 0x868 + idx * 0x14))[0xc];
    if (((w << 19) >> 19) == 0)   /* :13 bitfield, low 13 bits */
        return 0;

    /* byte-pack: (arg0&0xff) | ((idx&0xff)<<8)  -- shifted-or operand-first */
    key = (arg0 & 0xff) | ((idx & 0xff) << 8);
    stored = *(u16 *)(data_ov002_022d0e6c + 0xa2);
    if (stored == (u16)key)
        return 0;

    if (func_ov002_021c1e20(arg0, idx, arg0 != (stored & 0xff) ? 1 : 0) != 0)
        return 0;
    return 0x800;
}
