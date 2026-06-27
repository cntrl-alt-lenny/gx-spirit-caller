/* CAMPAIGN-PREP candidate for func_021eee20 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     no b0 guard (starts row<=4); slot word loaded once for :13 id + sub-byte combine; asymmetric self->f4 (<<17)>>23; pass-through to 021c1ef0
 *   risk:       permuter-class: the sub-byte combine (lsl#2;lsr#24;lsl#1;add ...,lsr#31) is the wall — mwcc folds the >>24<<1 pair. Slot word/id CSE into one ldr is the secondary near-miss.
 *   confidence: low
 */
/* func_ov002_021eee20 (cls D): row<=4 guard, slot.id guard, a slot sub-byte
 * (level) vs self->f4 field compare, then require func_021c1ef0. */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; u16 f4; };
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021c1ef0(struct Ov002Self *self, int player, int row);
int func_ov002_021eee20(struct Ov002Self *self, int player, int row) {
    struct Ov002Slot *slot;
    unsigned int w;
    int lvl, fld;
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
    return func_ov002_021c1ef0(self, player, row) != 0;
}
