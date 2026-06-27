/* CAMPAIGN-PREP candidate for func_021eab5c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C+D: obj=r0; f2&1 compare; half/row bound; two halfword tables (cf1a4 nonzero, cf1a2 zero); :13 bitfield; f6 byte-cast
 *   risk:       obj->f6 path: orig does ldrh<<0x10 then lsrs#0x18 = (u8)(f6>>0). (u16<<16>>24) extracts byte1 of f6, i.e. (f6>>8)&0xff NOT (u8)f6. Likely (obj->f6 >> 8). struct-guessed/reshape-able: fix to >>8 byte field.
 *   confidence: low
 */
typedef unsigned short u16;
typedef unsigned int u32;

struct CardEnt30 { u32 _pad[12]; u32 flags : 13; };

struct Obj02 { u16 f0; u16 f2; u16 f4; u16 f6; u16 f8; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c8470(int slot, int index);

int func_ov002_021eab5c(struct Obj02 *obj, int slot, int index)
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
    if (*(u16 *)(data_ov002_022cf1a2 + half + row) != 0)
        return 0;

    if ((unsigned char)obj->f6 == 0)
        return 1;

    v = func_ov002_021c8470(slot, index);
    if (obj->f8 == v)
        return 1;
    return 0;
}
