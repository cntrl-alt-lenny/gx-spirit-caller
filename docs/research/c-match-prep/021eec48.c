/* CAMPAIGN-PREP candidate for func_021eec48 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     pass-through lever: forward (self,player,row) to 021c1ef0 (no arg-move, args stay r0-r2); body uses ip/lr/r3 scratch; :13 id + :1 b0 bitfields
 *   risk:       permuter-class: orig keeps r0/r1/r2 untouched (scratch in ip/lr/r3) for the bare bl 021c1ef0 — register coin-flip; if mwcc parks an index temp in r0-r2 the pass-through breaks and the bl needs mov setup.
 *   confidence: med
 */
/* func_ov002_021eec48 (cls D): slot.id + opponent + row<=4 guards, require the
 * cf1a4 field zero, then report whether func_021c1ef0 holds. */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c1ef0(struct Ov002Self *self, int player, int row);
int func_ov002_021eec48(struct Ov002Self *self, int player, int row) {
    struct Ov002Slot *slot;
    slot = (struct Ov002Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + row * 20 + 0x30);
    if (slot->id == 0)
        return 0;
    if (player == self->b0)
        return 0;
    if (row > 4)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + row * 20) != 0)
        return 0;
    return func_ov002_021c1ef0(self, player, row) != 0;
}
