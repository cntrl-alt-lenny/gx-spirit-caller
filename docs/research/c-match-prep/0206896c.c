/* CAMPAIGN-PREP candidate for func_0206896c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u16 load widened to signed int so >>8 => asr; (u16) return = lsl16;lsr16
 *   risk:       low-risk leaf; only divergence is if mwcc proves x non-negative and emits lsr#8 instead of asr#8 — reshape-able (keep the (x>>8) on a plain int as written). +0xC offset struct-guessed.
 *   confidence: high
 */
/* func_0206896c @ 0x0206896c  (cls D, main) — load u16 field at +0xC, byteswap the two
   bytes, return zero-extended u16. The asr#8 means the loaded value is shifted as signed int. */
typedef unsigned short u16;

typedef struct H { unsigned char pad[0xC]; u16 f; } H; /* +0xC */

u16 func_0206896c(H *p)
{
    int x = p->f;            /* unsigned u16 widened into signed int */
    int hi = (x >> 8) & 0xFF;   /* signed >> => asr#8 */
    int lo = (x << 8) & 0xFF00;
    return (u16)(hi | lo);
}
