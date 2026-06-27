/* CAMPAIGN-PREP candidate for func_021ea044 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C+D: half=(slot&1)*0x868 & row=index*0x14 bound once (reused across both tables); :13 bitfield
 *   risk:       orig keeps half in r3, row in r2 across both array uses and does ldrh [r2,r0] (row as base). If mwcc reloads or recomputes index*0x14, the second table address diverges. reshape-able (bind half/row to locals as written).
 *   confidence: med
 */
typedef unsigned short u16;
typedef unsigned int u32;

struct CardEnt30 { u32 _pad[12]; u32 flags : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021b8fcc(int slot, int index);
extern int func_ov002_021c1ef0(int a, int slot, int index);
extern int func_ov002_021c2084(int a, int slot, int index, int mode);

int func_ov002_021ea044(int a, int slot, int index)
{
    int half;
    int row;
    struct CardEnt30 *e;

    if (index < 5) {
        if (func_ov002_021b8fcc(slot, index) == 0)
            return 0;
    }

    half = (slot & 1) * 0x868;
    row = index * 0x14;
    e = (struct CardEnt30 *)(data_ov002_022cf16c + half + row);
    if (e->flags == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + half + row) != 0)
        return 0;

    if (func_ov002_021c1ef0(a, slot, index) == 0)
        return 0;
    if (func_ov002_021c2084(a, slot, index, 0) != 0)
        return 1;
    return 0;
}
