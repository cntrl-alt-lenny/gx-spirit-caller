/* CAMPAIGN-PREP candidate for func_021ebb34 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl half/row; :13 slot.id; packed reconstruct recon-first cmp; 1ef0+2084 chain; cf1a4 tail
 *   risk:       Orig reloads word via `add r0,r1,#0x30; ldr [r0,r4]` reusing the cf16c+half base from the slot.id check; mwcc may form a fresh mla base. Plus the recon shift sequence. permuter-class.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_021ebb34 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft. Currently SHIPS-AS-.s (brief-302 walled). Full
 * guard chain: slot.id, packed-field reconstruct compare, two sink calls, cf1a4.
 *   recipe: decl-order idx,player,self via 021b8fcc guard; packed reconstruct (recon-first cmp); 021c1ef0+021c2084 chain.
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CardEnt30 { u32 _pad[12]; u32 id : 13; };
struct Self { u16 f0; u16 f2; u16 f4; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021b8fcc(int player, int idx);
extern int  func_ov002_021c1ef0(struct Self *self, int player, int idx);
extern int  func_ov002_021c2084(struct Self *self, int player, int idx, int d);

int func_ov002_021ebb34(struct Self *self, int player, int idx)
{
    int half;
    int row;
    u32 word;
    int recon;

    if (idx < 5) {
        if (func_ov002_021b8fcc(player, idx) == 0)
            return 0;
    }

    half = (player & 1) * 0x868;
    row  = idx * 0x14;
    if (((struct CardEnt30 *)(data_ov002_022cf16c + half + row))->id == 0)
        return 0;

    word  = *(u32 *)(data_ov002_022cf16c + half + 0x30 + row);
    recon = (((u32)(word << 2) >> 24) << 1) + ((u32)(word << 18) >> 31);
    if (recon == ((u32)((u32)self->f4 << 17) >> 23))
        return 0;

    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    if (func_ov002_021c2084(self, player, idx, 1) == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + half + row) == 0)
        return 1;
    return 0;
}
