/* CAMPAIGN-PREP candidate for func_021e9860 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     single-read => mla; idx/f30/1a2c order; 1a2c(player,idx,f0) args
 *   risk:       asm computes the mla index into the arg regs r0-r2 (scratch) not callee-saved, freeing regs before 021c1a2c; mwcc may instead allocate r4-r6 changing the stmdb set — permuter-class register choice
 *   confidence: med
 */
/* func_ov002_021e9860 (ov002, class C) — brief, batch p_0071.
 * UNVERIFIED build-free draft. Drop into src/, ninja+objdiff, tweak per risk.
 * NO header(b0) test, NO 021c1ef0. Index computed in r0/r1/r2 (mla form).
 * Guards: idx>=5, f30==0, 021c1a2c(player,idx,f0)==0; tail 021c1e44 ==0?1:0.
 */
struct self_t { unsigned short f0; unsigned short b0 : 1; unsigned short _r : 15; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern int func_ov002_021c1a2c(int player, int idx, int v);
extern int func_ov002_021c1e44(struct self_t *self, int player, int idx);

int func_ov002_021e9860(struct self_t *self, int player, int idx) {
    struct subrow *sr;
    if (idx >= 5)
        return 0;
    sr = (struct subrow *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (sr->f30 == 0)
        return 0;
    if (func_ov002_021c1a2c(player, idx, self->f0) == 0)
        return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}
