/* CAMPAIGN-PREP candidate for func_021ee704 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sub-byte level rebuild ((w>>22&0xff)<<1)+(w>>13&1) as explicit shifts; asymmetric self->f4 extract (<<17)>>23 (mwcc won't fold unequal shifts); :13 id; range [5,10]
 *   risk:       permuter-class: the 5-insn combine (lsl#2;lsr#24;...;lsl#1;add ...,lsr#31) — mwcc likely folds ((w<<2)>>24)<<1 to (w<<2)>>23, losing a mov. Identical extract shipped as .s at 0221eecc -> wall.
 *   confidence: low
 */
/* func_ov002_021ee704 (cls D): slot.id + opponent guards, row in [5,10], a
 * cf1ac bit9 gate (else func_0202b878 must not be 0x17), cf1a4 nonzero, a
 * slot sub-byte (level) vs self->f4 field compare, then require 021c1ef0. */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; u16 f4; };
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int func_0202b878(void);
extern int func_ov002_021c1ef0(struct Ov002Self *self, int player, int row);
int func_ov002_021ee704(struct Ov002Self *self, int player, int row) {
    struct Ov002Slot *slot;
    unsigned int w;
    int lvl, fld;
    slot = (struct Ov002Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + row * 20 + 0x30);
    if (slot->id == 0)
        return 0;
    if (player != self->b0)
        return 0;
    if (row < 5 || row > 10)
        return 0;
    if ((*(unsigned int *)(data_ov002_022cf1ac + (player & 1) * 0x868 + row * 20) >> 9 & 1) == 0) {
        if (func_0202b878() == 0x17)
            return 0;
    }
    if (*(u16 *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + row * 20) == 0)
        return 0;
    w = *(unsigned int *)(data_ov002_022cf16c + (player & 1) * 0x868 + row * 20 + 0x30);
    lvl = (int)(((unsigned int)(w << 2) >> 24) << 1) + (int)((unsigned int)(w << 18) >> 31);
    fld = (int)((unsigned int)((unsigned int)self->f4 << 17) >> 23);
    if (lvl == fld)
        return 0;
    return func_ov002_021c1ef0(self, player, row) != 0;
}
