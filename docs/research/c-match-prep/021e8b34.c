/* CAMPAIGN-PREP candidate for func_021e8b34 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f30-first eval order; idx>4 (not >=5); two reads => mul+add; no temps
 *   risk:       only r3/lr saved: mwcc must keep self/player/idx live in r0-r2 with no callee-save spill; any extra local that lives across the read forces a stmdb regset mismatch — permuter-class register pressure
 *   confidence: med
 */
/* func_ov002_021e8b34 (ov002, class C) — brief, batch p_0071.
 * UNVERIFIED build-free draft. Drop into src/, ninja+objdiff, tweak per risk.
 * Leaf-ish: stmdb {r3,lr}, no callee-saves — params stay live in r0-r2.
 * Guard ORDER is f30 FIRST, then header bit0, then idx>4, then cf1a4 hw,
 * then single 021c1e44 tail. Two reads => split mul+add.
 */
struct self_t { unsigned short f0; unsigned short b0 : 1; unsigned short _r : 15; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a4[];
extern int func_ov002_021c1e44(struct self_t *self, int player, int idx);

int func_ov002_021e8b34(struct self_t *self, int player, int idx) {
    struct subrow *sr = (struct subrow *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (sr->f30 == 0)
        return 0;
    if (player == self->b0)
        return 0;
    if (idx > 4)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) != 0)
        return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}
