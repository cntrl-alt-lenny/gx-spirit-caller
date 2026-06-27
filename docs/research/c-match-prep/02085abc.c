/* CAMPAIGN-PREP candidate for func_02085abc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: smull;lsr#8;orr<<24 == (ll)a*K>>8; rsb negate; mul/lsl combine
 *   risk:       permuter-class/struct-guessed: the 64-bit `smull;lsr#8;orr lo|hi<<24` is a >>8 of the full product, but the exact reduce (and the +0x30 vs +0x34 mul-chain order with `add r1,r4 lsl#3`) is reconstructed; reg-alloc dense, likely needs permuter.
 *   confidence: low
 */
/* func_02085abc: fixed-point transform via the smull reciprocal idiom (a
 * compile-time `/` by a constant, materialized as smull;lsr#8;orr<<24).
 * in: words +0x18,+0x1c,+0x24,+0x28; u16 +0x2c,+0x2e. out: +0x0,+0x4,+0x10,
 * +0x14,+0x30,+0x34. The (smull ip,r3,a,K; lsr#8|hi<<24) == (a * K) >> 40-ish
 * fixed-point reduce; modeled as `(long long)a * K >> 8` low-word. */

void func_02085abc(int *out, unsigned char *in)
{
    int a = *(int *)(in + 0x18);
    int b = *(int *)(in + 0x1c);
    unsigned short s0 = *(unsigned short *)(in + 0x2c);
    unsigned short s1 = *(unsigned short *)(in + 0x2e);
    int t0, t1;

    out[0]   = a;                 /* +0x0  */
    out[0x5] = b;                 /* +0x14 */
    out[0x1] = 0;                 /* +0x4  */

    t0 = (int)(((long long)a * *(int *)(in + 0x24)) >> 8);
    out[0xc] = s0 * -t0;          /* +0x30 */

    t1 = (int)(((long long)b * *(int *)(in + 0x28)) >> 8);
    out[0xd] = s1 * t1 + (s1 * (-(b << 1) + 0x2000) << 0x3); /* +0x34 */
    out[0x4] = 0;                 /* +0x10 */
}
