/* CAMPAIGN-PREP candidate for func_021ebd5c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     half/row bind; :13 slot.id; self bit0 via lsl#31;lsr#31; cf1a2(!a4) tail==0->1
 *   risk:       Self field at +2 read as ldrh then lsl#31;lsr#31 — `(self->f2<<31)>>31` should give that, but mwcc may emit `and #1` instead of the shift pair; bitfield struct{u16 b0:1} at +2 is the steer. struct-guessed/reshape-able.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021ebd5c (ov002, class D, MED tier).
 * UNVERIFIED build-free draft. Currently SHIPS-AS-.s (brief-302 walled). Small
 * frame {r3,lr}; self+2 bit0 compare; cf1a2 table (NOTE: a2, not a4).
 *   recipe: :13 slot.id; self->b0 1-bit field (lsl#31;lsr#31) compared to player; cf1a2 u16 ==0 -> return 1.
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CardEnt30 { u32 _pad[12]; u32 id : 13; };
struct Self { u16 f0; u16 f2; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];

int func_ov002_021ebd5c(struct Self *self, int player, int idx)
{
    int half;
    int row;

    if (idx >= 5)
        return 0;

    half = (player & 1) * 0x868;
    row  = idx * 0x14;
    if (((struct CardEnt30 *)(data_ov002_022cf16c + half + row))->id == 0)
        return 0;
    if (player == ((u32)((u32)self->f2 << 31) >> 31))
        return 0;
    if (*(u16 *)(data_ov002_022cf1a2 + half + row) == 0)
        return 1;
    return 0;
}
