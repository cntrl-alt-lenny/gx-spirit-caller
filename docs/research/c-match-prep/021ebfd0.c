/* CAMPAIGN-PREP candidate for func_021ebfd0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl idx/self/player order; half/row bind; :13 slot.id; cf1a4==0->0; 1e44 ne->0; 1ef0;2084
 *   risk:       Orig stashes half(r3-derived) & idx*0x14(ip) in callee-saved regs across the cf1a4 read BEFORE the calls; mwcc may not keep both live across 3 bl's, forcing reloads -> ldr-count diverge. permuter-class (callee-saved alloc).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_021ebfd0 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft. Currently SHIPS-AS-.s (brief-302 walled). slot.id,
 * cf1a4 guard, 021c1e44 (ne -> return 0), 021c1ef0, 021c2084.
 *   recipe: decl idx(r4),self(r6),player(r5); bind half/row; :13 slot.id; cf1a4==0->0; 1e44 ne->0; 1ef0; 2084.
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CardEnt30 { u32 _pad[12]; u32 id : 13; };
struct Self { u16 f0; u16 f2; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021c1e44(struct Self *self, int player, int idx);
extern int  func_ov002_021c1ef0(struct Self *self, int player, int idx);
extern int  func_ov002_021c2084(struct Self *self, int player, int idx, int d);

int func_ov002_021ebfd0(struct Self *self, int player, int idx)
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
        return 0;

    if (func_ov002_021c1e44(self, player, idx) != 0)
        return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    if (func_ov002_021c2084(self, player, idx, 1) != 0)
        return 1;
    return 0;
}
