/* CAMPAIGN-PREP candidate for func_021ab1b0 (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     divmod/bit-twiddle: SWAR popcount, accumulator-first add operand order
 *   risk:       permuter-class: SWAR popcount has many register-equivalent encodings; mwcc loading hi-mask + deriving lo via `mask>>k` vs my `x & lo` may diverge on which side is shifted and on the final lsl/lsr-16 fold. Likely needs permuter or operand reshaping.
 *   confidence: med
 */
/* func_ov000_021ab1b0: 32-bit population count (SWAR), returns bit count in r0.
 *   n = (x & 0x55555555) + ((x & 0xaaaaaaaa) >> 1)
 *   n = (n & 0x33333333) + ((n & 0xcccccccc) >> 2)
 *   n = (n & 0x0f0f0f0f) + ((n & 0xf0f0f0f0) >> 4)
 *   n = (n & 0x00ff00ff) + ((n & 0xff00ff00) >> 8)
 *   n = (n & 0x0000ffff) + (n >> 16)
 * The asm loads the HIGH mask (0xaaaa.., 0xcccc.., 0xf0f0.., 0xff00..) from the
 * pool and derives the low mask as `mask>>1/2/4/8` inline -- the `& M` and
 * `& M>>k` pair is the tell. Final fold uses lsl#16/lsr#16 + (-0x10000) mask. */
int func_ov000_021ab1b0(unsigned int x) {
    x = (x & 0x55555555u) + ((x & 0xaaaaaaaau) >> 1);
    x = (x & 0x33333333u) + ((x & 0xccccccccu) >> 2);
    x = (x & 0x0f0f0f0fu) + ((x & 0xf0f0f0f0u) >> 4);
    x = (x & 0x00ff00ffu) + ((x & 0xff00ff00u) >> 8);
    x = (x & 0x0000ffffu) + (x >> 16);
    return (int)x;
}
