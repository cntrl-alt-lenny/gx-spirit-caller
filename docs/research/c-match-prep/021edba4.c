/* CAMPAIGN-PREP candidate for func_021edba4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: guard; u2 bit0==player->0; MLA-fused address (one expr, no bound half/row); :13 flags; cd3f4
 *   risk:       orig fuses index math into two mla; write the address as one expression so mwcc emits mla not mul+add. if it CSEs (p&1)*0x868 to a temp the mla splits. reshape-able (single-expr addr) + struct-guessed (cd3f4).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_021edba4 (ov002, class D, MED tier) — brief 498.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: idx>=5 guard; bit0 self->u2 != player ->0; MLA-fused index (cf16c + (p&1)*0x868 + idx*0x14 as one expr) -> e->flags :13; cd3f4 f0==p && f1c==idx ->0 else 1
 *   risk:       orig fuses both index steps into mla (mla ip,(p&1),0x868,cf16c then mla r3,idx,0x14,ip). To get the two mla you must write the address as one un-CSE'd expression; if mwcc splits to mul+add (like sibling 021ed408) the fusion is lost. reshape-able (single-expression address, don't bind half/row) + struct-guessed (cd3f4).
 *   confidence: med
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CardEnt30 { u32 _pad[12]; u32 flags : 13; };
struct Obj02 { u16 f0; u16 f2; };
struct Ctx3f4 { int f0; int _pad[6]; int f1c; };

extern char data_ov002_022cf16c[];
extern struct Ctx3f4 data_ov002_022cd3f4;
extern int  func_ov002_021c1ef0(void *self, int player, int index);

int func_ov002_021edba4(struct Obj02 *self, int player, int index)
{
    struct CardEnt30 *e;

    if (index >= 5)
        return 0;
    if (player == (self->f2 & 1))
        return 0;

    e = (struct CardEnt30 *)(data_ov002_022cf16c + (player & 1) * 0x868 + index * 0x14);
    if (e->flags == 0)
        return 0;

    if (func_ov002_021c1ef0(self, player, index) == 0)
        return 0;
    if (data_ov002_022cd3f4.f0 == player && data_ov002_022cd3f4.f1c == index)
        return 0;
    return 1;
}
