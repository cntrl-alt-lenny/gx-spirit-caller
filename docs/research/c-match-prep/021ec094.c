/* CAMPAIGN-PREP candidate for func_021ec094 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     frame; half=(player&1)*0x868 & row=idx*0x14 bound; :13 slot.id; 1ef0==0->0; cf1a4!=0->1
 *   risk:       Orig keeps half(r5) & row(r4) in callee-saved regs across the 021c1ef0 call to address cf1a4 after; if mwcc reloads cf1a4 base or recomputes idx*0x14 post-call the ldrh address diverges. reshape-able (bind half/row, declared r4/r5 order).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021ec094 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft. Currently SHIPS-AS-.s (raw disasm). slot.id,
 * single 021c1ef0 call, final cf1a4.
 *   recipe: frame {r3,r4,r5,lr}; bind half=(player&1)*0x868 & row=idx*0x14; :13 slot.id; 1ef0==0->0; cf1a4 !=0 -> 1.
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CardEnt30 { u32 _pad[12]; u32 id : 13; };
struct Self { u16 f0; u16 f2; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021c1ef0(struct Self *self, int player, int idx);

int func_ov002_021ec094(struct Self *self, int player, int idx)
{
    int half;
    int row;

    if (idx >= 5)
        return 0;

    half = (player & 1) * 0x868;
    row  = idx * 0x14;
    if (((struct CardEnt30 *)(data_ov002_022cf16c + half + row))->id == 0)
        return 0;

    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + half + row) != 0)
        return 1;
    return 0;
}
