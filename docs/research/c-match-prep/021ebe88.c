/* CAMPAIGN-PREP candidate for func_021ebe88 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     self bit0 guard first; double-mla (player&1)*0x868 + idx*0x14 inline; :13 slot.id
 *   risk:       Orig uses two chained `mla` (r1=(player&1)*0x868+cf16c; r0=idx*0x14*... ) for the +0x30 address; mwcc -O4 tends to add/shift instead of mla, and self->f2 may fold to `and #1`. permuter-class.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_021ebe88 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft. Currently SHIPS-AS-.s (brief-302 walled). self+2
 * bit0 guard FIRST, then 021b8fcc, slot.id, then 021c1ef0+021c2084 (double-mla form).
 *   recipe: decl player(r6),self(r5)... self bit0 guard up front; mla-base (player&1)*0x868 then idx*0x14 inline; :13 slot.id.
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CardEnt30 { u32 _pad[12]; u32 id : 13; };
struct Self { u16 f0; u16 f2; };

extern char data_ov002_022cf16c[];
extern int  func_ov002_021b8fcc(int player, int idx);
extern int  func_ov002_021c1ef0(struct Self *self, int player, int idx);
extern int  func_ov002_021c2084(struct Self *self, int player, int idx, int d);

int func_ov002_021ebe88(struct Self *self, int player, int idx)
{
    if (player == ((u32)((u32)self->f2 << 31) >> 31))
        return 0;

    if (idx < 5) {
        if (func_ov002_021b8fcc(player, idx) == 0)
            return 0;
    }

    if (((struct CardEnt30 *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 0x14))->id == 0)
        return 0;

    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    if (func_ov002_021c2084(self, player, idx, 1) != 0)
        return 1;
    return 0;
}
