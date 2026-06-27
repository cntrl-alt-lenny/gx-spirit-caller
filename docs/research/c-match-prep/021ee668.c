/* CAMPAIGN-PREP candidate for func_021ee668 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     proven family: :13 slot.id + :1 self.b0 bitfields, (player&1)*0x868 stride; CSE the two products (mul once each, held across 3 bases)
 *   risk:       reshape-able: cf1a2 = cf1a4-2 (adjacent). mwcc may fuse them to one base + #-2/0 offset (2 ldr base) vs orig's two distinct pool loads of cf1a4/cf1a2; keep separate extern bases to force 2 pools.
 *   confidence: med
 */
/* func_ov002_021ee668 (cls D): pure accessor — row/slot.id/opponent guards,
 * require cf1a4 field nonzero, return cf1a2 field == 0. */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];
int func_ov002_021ee668(struct Ov002Self *self, int player, int row) {
    struct Ov002Slot *slot;
    if (row >= 5)
        return 0;
    slot = (struct Ov002Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + row * 20 + 0x30);
    if (slot->id == 0)
        return 0;
    if (player == self->b0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + row * 20) == 0)
        return 0;
    return *(u16 *)(data_ov002_022cf1a2 + (player & 1) * 0x868 + row * 20) == 0;
}
