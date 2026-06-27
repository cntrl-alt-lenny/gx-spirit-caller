/* CAMPAIGN-PREP candidate for func_02038908 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store s1(+0x60) before s0(+0x5c); orr/eor shift chain; attempt reload via repeated g-> reads
 *   risk:       VERIFIED: store-order (+0x60 then +0x5c) and eor/orr shift chain match. BUT mwcc -O4 CSE'd the 8 redundant ldr (orig reloads s1 3x/s0 4x) into 2 loads, and folds s1+s1 to s1<<1. permuter-class/opt-level (redundant reloads need volatile or lower -O)
 *   confidence: low
 */
/* func_02038908 (class D, PRNG, store-order + reload): state at
 * data_0219b2e0 with s0 @ +0x5c, s1 @ +0x60. Orig RELOADS each global rather
 * than caching. Update s1 FIRST then s0:
 *   s1' = s1 + s1 + (s0 & 1);                       // store +0x60
 *   t   = (s0_old >> 1) | (s1_old << 31);
 *   t  ^= s0 << 12;
 *   t  ^= t >> 20;
 *   s0' = t;                                        // store +0x5c
 *   return s0';
 * s1_old and (s0>>1) are captured before the s1 store. */

extern unsigned char data_0219b2e0[];

struct Rng {
    char _p[0x5c];
    unsigned int s0;            /* 0x5c */
    unsigned int s1;            /* 0x60 */
};

int func_02038908(void) {
    struct Rng *g = (struct Rng *)data_0219b2e0;
    unsigned int s1_old;
    unsigned int s0_sr;
    unsigned int t;

    s1_old = g->s1;
    s0_sr = g->s0 >> 1;
    g->s1 = g->s1 + g->s1 + (g->s0 & 1);

    t = s0_sr | (s1_old << 31);
    t = t ^ (g->s0 << 12);
    t = t ^ (t >> 20);
    g->s0 = t;
    return g->s0;
}
