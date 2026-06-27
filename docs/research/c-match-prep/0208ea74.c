/* CAMPAIGN-PREP candidate for func_0208ea74 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind fifo reg + src base once; explicit unrolled stores in asm order; <<4 on first 12 only
 *   risk:       if mwcc re-loads the 0x458 literal per store or reorders, str sequence diverges; volatile + single bound pointer should hold. reshape-able (keep explicit, bind pointer). Mild struct-guessed (src as u32[16]).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0208ea74 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 * Register-array push: write 3 to 0x04000440, then stream 16 input words to the
 * single FIFO register 0x04000458. First 12 words are shifted <<4; last 4 are
 * written verbatim. STORE-ORDER is load-bearing (all stores to same address).
 * Orig binds 0x04000458 in one reg (r1) and the input base in r0 across all 16
 * stores; written explicitly (not a loop) to guarantee identical store order. */
typedef unsigned int u32;

void func_0208ea74(u32 *src)
{
    volatile u32 *fifo = (volatile u32 *)0x04000458;
    *(volatile u32 *)0x04000440 = 3;
    *fifo = src[0]  << 4;
    *fifo = src[1]  << 4;
    *fifo = src[2]  << 4;
    *fifo = src[3]  << 4;
    *fifo = src[4]  << 4;
    *fifo = src[5]  << 4;
    *fifo = src[6]  << 4;
    *fifo = src[7]  << 4;
    *fifo = src[8]  << 4;
    *fifo = src[9]  << 4;
    *fifo = src[10] << 4;
    *fifo = src[11] << 4;
    *fifo = src[12];
    *fifo = src[13];
    *fifo = src[14];
    *fifo = src[15];
}
