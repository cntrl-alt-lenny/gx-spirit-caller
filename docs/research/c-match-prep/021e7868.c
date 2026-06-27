/* CAMPAIGN-PREP candidate for func_021e7868 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     asm-order guards; 021c1a2c(player,idx,f0) arg order; ==0?1:0 tail
 *   risk:       tail 'return cmp==0' must emit moveq#1/movne#0; if mwcc inverts to subs/rsbs the two movs swap — reshape-able (==0 vs !=0 spelling)
 *   confidence: med
 */
/* func_ov002_021e7868 (ov002, class C) — brief, batch p_0071.
 * UNVERIFIED build-free draft. Drop into src/, ninja+objdiff, tweak per risk.
 * Same guard prologue as 021e7748 but tail is 021c1a2c(player,idx,self->f0)
 * guard then 021c1e44 returning ==0?1:0.
 */
struct self_t { unsigned short f0; unsigned short b0 : 1; unsigned short _r : 15; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern int func_ov002_021c1ef0(void);
extern int func_ov002_021c1a2c(int player, int idx, int v);
extern int func_ov002_021c1e44(struct self_t *self, int player, int idx);

int func_ov002_021e7868(struct self_t *self, int player, int idx) {
    struct subrow *sr;
    if (player == self->b0)
        return 0;
    if (idx >= 5)
        return 0;
    sr = (struct subrow *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (sr->f30 == 0)
        return 0;
    if (func_ov002_021c1ef0() == 0)
        return 0;
    if (func_ov002_021c1a2c(player, idx, self->f0) == 0)
        return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}
