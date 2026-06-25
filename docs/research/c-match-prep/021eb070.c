/* CAMPAIGN-PREP candidate for func_021eb070 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C+D: twin of 021eab5c minus the cf1a2 table; obj=r0; half/row bound; :13 bitfield; f6 byte path
 *   risk:       same f6 quirk as 021eab5c: ldrh<<0x10;lsrs#0x18 = (obj->f6>>8)&0xff, not (u8)f6. If kept as (u8) the shift constants diverge (lsr#0x10 vs lsr#0x18). reshape-able: use (obj->f6 >> 8).
 *   confidence: low
 */
typedef unsigned short u16;
typedef unsigned int u32;

struct CardEnt30 { u32 _pad[12]; u32 flags : 13; };

struct Obj02 { u16 f0; u16 f2; u16 f4; u16 f6; u16 f8; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c8470(int slot, int index);

int func_ov002_021eb070(struct Obj02 *obj, int slot, int index)
{
    int half;
    int row;
    struct CardEnt30 *e;
    int v;

    if (index >= 5)
        return 0;
    if (slot == (obj->f2 & 1))
        return 0;

    half = (slot & 1) * 0x868;
    row = index * 0x14;
    e = (struct CardEnt30 *)(data_ov002_022cf16c + half + row);
    if (e->flags == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + half + row) == 0)
        return 0;

    if ((unsigned char)obj->f6 == 0)
        return 1;

    v = func_ov002_021c8470(slot, index);
    if (obj->f8 == v)
        return 1;
    return 0;
}
