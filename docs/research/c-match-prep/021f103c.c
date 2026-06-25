/* CAMPAIGN-PREP candidate for func_021f103c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla parity*0x868 base + mul row index; :1 bitfield via lsl#31;lsr#31; eq-chain tail
 *   risk:       tail 'cmp r1,r5 / cmpeq r0,r4 / moveq0 / movne1' is a && returning inverted bool; mwcc may emit the compare order or eq/ne polarity differently. reshape-able (flip &&/return-order).
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

struct S103c { u32 _0; u16 _4; };
struct T103c { int _0; int _4; int _8; int _c; int _10; int _14; int _18; int _1c; int _20; };

extern u8 data_ov002_022cf1a4[];
extern struct T103c data_ov002_022cd3f4;
extern int func_ov002_021c1ef0(void);

int func_ov002_021f103c(struct S103c *a0, int a1, int a2)
{
    int row;

    if (a2 >= 5)
        return 0;
    if ((int)((a0->_4 << 0x1f) >> 0x1f) != a1)
        return 0;
    row = a2 * 0x14;
    if (*(u16 *)((char *)(unsigned)row + (int)(data_ov002_022cf1a4 + (a1 & 1) * 0x868)) == 0)
        return 0;
    if (func_ov002_021c1ef0() == 0)
        return 0;
    if (data_ov002_022cd3f4._4 == a1 && data_ov002_022cd3f4._20 == a2)
        return 0;
    return 1;
}
