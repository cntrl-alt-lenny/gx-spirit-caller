/* CAMPAIGN-PREP candidate for func_021ed408 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: guard; u2 bit0==player->0; two muls; cf1a4 before :13 flags (swapped pool); cd3f4 f0&&f1c
 *   risk:       pool has cf1a4(_LIT0) before cf16c(_LIT1); table reads are cf1a4-first — if mwcc emits the :13 flags read first the two table relocs swap order. reshape-able (statement order) + struct-guessed (cd3f4 f0/f1c).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_021ed408 (ov002, class D, MED tier) — brief 498.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: idx>=5 guard first; bit0 self->u2 != player ->0; SEPARATE muls (not mla); cf1a4 u16 BEFORE cf16c :13 flags (pool order swapped here); cd3f4 f0==p && f1c==idx ->0 else 1
 *   risk:       pool order is cf1a4(_LIT0) then cf16c(_LIT1) — the table read order is cf1a4-first; if mwcc reorders to flags-first the two literal relocs swap. Also half/row built with two muls (not mla here) unlike sibling 021edba4. reshape-able (statement order; keep two-mul form) + struct-guessed (cd3f4 f0/f1c).
 *   confidence: med
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CardEnt30 { u32 _pad[12]; u32 flags : 13; };
struct Obj02 { u16 f0; u16 f2; };
struct Ctx3f4 { int f0; int _pad[6]; int f1c; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern struct Ctx3f4 data_ov002_022cd3f4;
extern int  func_ov002_021c1ef0(void *self, int player, int index);

int func_ov002_021ed408(struct Obj02 *self, int player, int index)
{
    int half;
    int row;
    struct CardEnt30 *e;

    if (index >= 5)
        return 0;
    if (player == (self->f2 & 1))
        return 0;

    half = (player & 1) * 0x868;
    row  = index * 0x14;

    if (*(u16 *)(data_ov002_022cf1a4 + half + row) == 0)
        return 0;
    e = (struct CardEnt30 *)(data_ov002_022cf16c + half + row);
    if (e->flags == 0)
        return 0;

    if (func_ov002_021c1ef0(self, player, index) == 0)
        return 0;
    if (data_ov002_022cd3f4.f0 == player && data_ov002_022cd3f4.f1c == index)
        return 0;
    return 1;
}
