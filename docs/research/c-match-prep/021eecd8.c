/* CAMPAIGN-PREP candidate for func_021eecd8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     slot word loaded once, reused (bind) for :13 id-check AND sub-byte combine via mla index; asymmetric self->f4 (<<17)>>23; func_021c2084(...,0) with r3=0
 *   risk:       permuter-class: same sub-byte combine wall as 021ee704 (mwcc folds ((w<<2)>>24)<<1). Secondary: w must CSE with slot->id load into ONE ldr; if it splits, an extra ldr diverges.
 *   confidence: low
 */
/* func_ov002_021eecd8 (cls D): opponent + row<=4 guards, slot.id guard, a slot
 * sub-byte (level) vs self->f4 field compare, then require func_021c2084(...,0). */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; u16 f4; };
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021c2084(struct Ov002Self *self, int player, int row, int d);
int func_ov002_021eecd8(struct Ov002Self *self, int player, int row) {
    struct Ov002Slot *slot;
    unsigned int w;
    int lvl, fld;
    if (player != self->b0)
        return 0;
    if (row > 4)
        return 0;
    slot = (struct Ov002Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + row * 20 + 0x30);
    w = *(unsigned int *)slot;
    if (slot->id == 0)
        return 0;
    lvl = (int)(((unsigned int)(w << 2) >> 24) << 1) + (int)((unsigned int)(w << 18) >> 31);
    fld = (int)((unsigned int)((unsigned int)self->f4 << 17) >> 23);
    if (lvl == fld)
        return 0;
    return func_ov002_021c2084(self, player, row, 0) != 0;
}
