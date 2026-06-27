/* CAMPAIGN-PREP candidate for func_021ebacc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     leaf; bind half=(player&1)*0x868 & row=idx*0x14 once; :13 slot.id; cf1a4==0->1
 *   risk:       Orig holds half(r3) & ip(idx*0x14) across cf16c[+0x30] and cf1a4 uses, does ldrh [ip,r0]; if mwcc recomputes idx*0x14 for the 2nd table the address math diverges. reshape-able (bind as written).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021ebacc (ov002, class D, MED tier).
 * UNVERIFIED build-free draft. Currently SHIPS-AS-.s (brief-302 walled). Leaf,
 * bx lr (no frame), no 021b8fcc guard.
 *   recipe: leaf; bind half=(arg1&1)*0x868 & idx*0x14; :13 slot.id; cf1a4 u16 ==0 -> return 1.
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CardEnt30 { u32 _pad[12]; u32 id : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];

int func_ov002_021ebacc(int a, int player, int idx)
{
    int half;
    int row;

    if (idx >= 5)
        return 0;

    half = (player & 1) * 0x868;
    row  = idx * 0x14;
    if (((struct CardEnt30 *)(data_ov002_022cf16c + half + row))->id == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + half + row) == 0)
        return 1;
    return 0;
}
