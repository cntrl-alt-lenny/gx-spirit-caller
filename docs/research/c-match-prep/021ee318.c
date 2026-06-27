/* CAMPAIGN-PREP candidate for func_021ee318 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     divmod /100 (magic 0x51eb851f asr#5); :13 slot.id bitfield; load out.b(+0x18) before out.a(+0x14) for movle; max as if-assign
 *   risk:       struct-guessed: Cd3f4 +0x1c/+0x20 & Out +0x14/+0x18 offsets inferred. Also orig RELOADS cd3f4 base per && block (ldr _LIT2 twice); mwcc likely CSEs the global base -> ldr count diverges (reshape hard).
 *   confidence: med
 */
/* func_ov002_021ee318 (cls D): row/slot.id/opponent guards + a cd3f4 pending-pair
 * gate, require 021c1ef0 and !021c1e44, then 021c4c9c fills an out struct;
 * return (max(out.a,out.b) / 100) != 0. */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };
struct Ov002Slot { unsigned int id : 13; };
struct Cd3f4 { int p0; int p1; char _pad[0x18]; int r0; int r1; };
struct Out { char _pad[0x14]; int a; int b; };
extern char data_ov002_022cf16c[];
extern struct Cd3f4 data_ov002_022cd3f4;
extern int func_ov002_021c1ef0(struct Ov002Self *self, int player, int row);
extern int func_ov002_021c1e44(struct Ov002Self *self, int player, int row);
extern int func_ov002_021c4c9c(int player, int row, struct Out *out);
int func_ov002_021ee318(struct Ov002Self *self, int player, int row) {
    struct Ov002Slot *slot;
    struct Out out;
    int b, m;
    if (row >= 5)
        return 0;
    slot = (struct Ov002Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + row * 20 + 0x30);
    if (slot->id == 0)
        return 0;
    if (player == self->b0)
        return 0;
    if (!(data_ov002_022cd3f4.p0 == player && data_ov002_022cd3f4.r0 == row) &&
        !(data_ov002_022cd3f4.p1 == player && data_ov002_022cd3f4.r1 == row))
        return 0;
    if (func_ov002_021c1ef0(self, player, row) == 0)
        return 0;
    if (func_ov002_021c1e44(self, player, row) != 0)
        return 0;
    func_ov002_021c4c9c(player, row, &out);
    b = out.b;
    m = out.a;
    if (m <= b)
        m = b;
    return (m / 100) != 0;
}
