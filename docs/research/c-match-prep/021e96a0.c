/* CAMPAIGN-PREP candidate for func_021e96a0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     single-read sr => mla; header/idx/f30 order; 021c2084 flag literal 0
 *   risk:       sr base held in callee-saved (r4-r6) across the 021c1e44 call; if mwcc reloads data_022cf16c the mla recomputes — permuter-class spill/reload
 *   confidence: med
 */
/* func_ov002_021e96a0 (ov002, class C) — brief, batch p_0071.
 * UNVERIFIED build-free draft. Drop into src/, ninja+objdiff, tweak per risk.
 * Like 021e7748 but NO 021c1ef0 guard, and the 021c2084 4th arg is 0.
 * Guards: header bit0==player, idx>=5, f30==0; then 021c1e44 guard;
 * tail 021c2084(self,player,idx,0) != 0 ? 1 : 0. Single read => mla.
 */
struct self_t { unsigned short f0; unsigned short b0 : 1; unsigned short _r : 15; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern int func_ov002_021c1e44(struct self_t *self, int player, int idx);
extern int func_ov002_021c2084(struct self_t *self, int player, int idx, int flag);

int func_ov002_021e96a0(struct self_t *self, int player, int idx) {
    struct subrow *sr;
    if (player == self->b0)
        return 0;
    if (idx >= 5)
        return 0;
    sr = (struct subrow *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (sr->f30 == 0)
        return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0)
        return 0;
    return func_ov002_021c2084(self, player, idx, 0) != 0;
}
