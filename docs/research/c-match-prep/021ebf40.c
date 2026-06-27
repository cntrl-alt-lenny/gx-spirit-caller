/* CAMPAIGN-PREP candidate for func_021ebf40 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     self bit0 guard; half/row bind; :13 slot.id; cf1a4==0->0; tail 1e44==0->1
 *   risk:       Orig holds half in r4 across the cf16c slot read and the cf1a4 read, computes idx*0x14 once in lr; if mwcc duplicates idx*0x14 or reloads cf16c/cf1a4 pool the two ldr addresses diverge. reshape-able (bind half/row).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021ebf40 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft. Currently SHIPS-AS-.s (brief-302 walled). self+2
 * bit0 guard, slot.id, cf1a4 !=0 guard, single 021c1e44 call.
 *   recipe: self bit0 guard; bind half/row; :13 slot.id; cf1a4==0->return0; tail 021c1e44 != -> 1.
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CardEnt30 { u32 _pad[12]; u32 id : 13; };
struct Self { u16 f0; u16 f2; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021c1e44(struct Self *self, int player, int idx);

int func_ov002_021ebf40(struct Self *self, int player, int idx)
{
    int half;
    int row;

    if (idx >= 5)
        return 0;
    if (player == ((u32)((u32)self->f2 << 31) >> 31))
        return 0;

    half = (player & 1) * 0x868;
    row  = idx * 0x14;
    if (((struct CardEnt30 *)(data_ov002_022cf16c + half + row))->id == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + half + row) == 0)
        return 0;

    if (func_ov002_021c1e44(self, player, idx) == 0)
        return 1;
    return 0;
}
