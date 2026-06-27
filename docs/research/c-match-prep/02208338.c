/* CAMPAIGN-PREP candidate for func_02208338 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind first call result to local 'a' across second call; if-assign returns
 *   risk:       reshape-able: 'a<=b' compiles to cmp+movle/movgt; if mwcc emits b<a/reversed, swap to (a<=b). The bind of 'a' across the second bl (orig holds it in r4) is forced by reading a after the call.
 *   confidence: high
 */
/* func_ov002_02208338: call func_ov002_021ff2c8(bit0) -> a (kept in r4),
 * then func_ov002_021bd3e0(bit0,1) -> b; if b==0 return 0; if a==0 return 0;
 * else return a<=b. The first result is BOUND across the second call (r4). */
typedef unsigned short u16;

struct F02208338_F2 { u16 bit0 : 1; u16 rest : 15; };
struct F02208338_Self { u16 f0; struct F02208338_F2 f2; };

extern int func_ov002_021ff2c8(struct F02208338_Self *self, unsigned int bit0);
extern int func_ov002_021bd3e0(unsigned int bit0, int one);

int func_ov002_02208338(struct F02208338_Self *self) {
    int a = func_ov002_021ff2c8(self, self->f2.bit0);
    int b = func_ov002_021bd3e0(self->f2.bit0, 1);
    if (b == 0) return 0;
    if (a == 0) return 0;
    return a <= b;
}
