/* CAMPAIGN-PREP candidate for func_02296ac0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     3-helper guard chain; b0:1 bitfield; 1-b0 (rsb) tail bool
 *   risk:       reshape-able: clean guard-chain matching sibling 02296a78 family; only likely miss is the final `!=0` bool form (movne#1;moveq#0) vs a predicated early-return polarity
 *   confidence: high
 */
typedef unsigned short u16;

struct S02296ac0 { u16 f0; u16 b0 : 1; u16 rest : 15; };

extern int func_ov002_02259f74(unsigned int bit);
extern int func_ov002_02280980(unsigned int bit);
extern int func_ov002_021bc22c(unsigned int bit, unsigned int k);

int func_ov002_02296ac0(struct S02296ac0 *self) {
    if (func_ov002_02259f74(self->b0) == 0) return 0;
    if (func_ov002_02280980(self->b0) <= 0) return 0;
    return func_ov002_021bc22c(1 - self->b0, 1) != 0;
}
