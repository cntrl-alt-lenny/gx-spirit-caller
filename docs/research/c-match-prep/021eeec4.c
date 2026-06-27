/* CAMPAIGN-PREP candidate for func_021eeec4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     cmp self->b0,player operand-order (b0 first); b8fcc(player,row) guard for row<5; slot word once for :13 id + sub-byte combine; mla index
 *   risk:       permuter-class: sub-byte combine wall (same as 021ee704/eecd8). Note operand order: orig is cmp b0,player so write self->b0 != player (not player != b0) to pick the cmp dest.
 *   confidence: low
 */
/* func_ov002_021eeec4 (cls D): opponent guard, for row<5 require func_021b8fcc,
 * slot.id guard, slot sub-byte (level) vs self->f4 field compare, then require
 * func_021c23ac. */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; u16 f4; };
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021b8fcc(int player, int row);
extern int func_ov002_021c23ac(int player, int row);
int func_ov002_021eeec4(struct Ov002Self *self, int player, int row) {
    struct Ov002Slot *slot;
    unsigned int w;
    int lvl, fld;
    if (self->b0 != player)
        return 0;
    if (row < 5) {
        if (func_ov002_021b8fcc(player, row) == 0)
            return 0;
    }
    slot = (struct Ov002Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + row * 20 + 0x30);
    w = *(unsigned int *)slot;
    if (slot->id == 0)
        return 0;
    lvl = (int)(((unsigned int)(w << 2) >> 24) << 1) + (int)((unsigned int)(w << 18) >> 31);
    fld = (int)((unsigned int)((unsigned int)self->f4 << 17) >> 23);
    if (lvl == fld)
        return 0;
    return func_ov002_021c23ac(player, row) != 0;
}
