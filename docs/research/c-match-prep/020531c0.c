/* CAMPAIGN-PREP candidate for func_020531c0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two-arm cmpeq-flag; branch-tail duplication; long-long callee
 *   risk:       struct offsets guessed; cmp/cmpeq operand order (hi-then-lo) may swap; moveq/movne block-order coin-flip
 *   confidence: med
 */
/* func_020531c0: fill a 0x18 stack struct, then pick one of two
 * 64-bit field-pairs and compare against func_02053728(self) (a long long).
 *   func_02044c60(&s);
 *   v = func_02053728(self);           // lo=r0, hi=r1
 *   if (s.f_10) return s.f_4==hi && s.f_0==lo;
 *   else        return s.f_c==hi && s.f_8==lo;
 * Each branch is written self-contained so mwcc won't cross-jump the tails. */

typedef struct {
    unsigned int f_0;    /* 0x00 */
    unsigned int f_4;    /* 0x04 */
    unsigned int f_8;    /* 0x08 */
    unsigned int f_c;    /* 0x0c */
    int          f_10;   /* 0x10 */
    int          f_14;   /* 0x14 */
} pair_t;

extern void               func_02044c60(pair_t *out);
extern unsigned long long func_02053728(void *self);

int func_020531c0(void *self) {
    pair_t s;
    func_02044c60(&s);
    if (s.f_10 != 0) {
        unsigned long long v = func_02053728(self);
        return s.f_4 == (unsigned int)(v >> 32) && s.f_0 == (unsigned int)v;
    } else {
        unsigned long long v = func_02053728(self);
        return s.f_c == (unsigned int)(v >> 32) && s.f_8 == (unsigned int)v;
    }
}
