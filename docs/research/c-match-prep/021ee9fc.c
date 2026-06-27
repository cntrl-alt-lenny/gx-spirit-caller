/* CAMPAIGN-PREP candidate for func_021ee9fc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mirrors shipped 021ede94 shape; :13 slot.id + :1 b0 bitfields; (player&1)*0x868 stride; value-map return (field==0) emits moveq#1/movne#0
 *   risk:       reshape-able: order of the held products in regs — orig binds (player&1)*0x868 in r5 and row*20 in r4 across slot+cf1a4 uses. If mwcc reloads/reorders one product, 1-2 mul/add shift; fixable via decl order.
 *   confidence: med
 */
/* func_ov002_021ee9fc (cls D): slot.id + opponent guards; for in-range row
 * also require func_021b8fcc; return whether the cf1a4 field is zero. */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021b8fcc(int player, int row);
int func_ov002_021ee9fc(struct Ov002Self *self, int player, int row) {
    struct Ov002Slot *slot;
    slot = (struct Ov002Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + row * 20 + 0x30);
    if (slot->id == 0)
        return 0;
    if (player == self->b0)
        return 0;
    if (row < 5) {
        if (func_ov002_021b8fcc(player, row) == 0)
            return 0;
    }
    return *(u16 *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + row * 20) == 0;
}
