/* CAMPAIGN-PREP candidate for func_0208bfc4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: sqrt-MMIO 64-bit mode, sumsq[1,0,2], (u64)sq<<2 param, (res+1)>>1
 *   risk:       store-order: orig interleaves low-word str then finishes high-word (orr ip>>0x1e) then str; a u64 volatile store may emit both shifts then both str. reshape-able by splitting into explicit lo/hi int stores if it diverges.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0208bfc4 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. recipe: D, DS hardware sqrt unit in 64-bit
 * mode. d = a - b componentwise; sumsq = d.x^2+d.y^2+d.z^2 (signed 64-bit);
 * write (u64)sumsq<<2 to SQRT_PARAM (0x040002b8), busy-poll SQRTCNT bit15,
 * return (SQRT_RESULT+1)>>1 (rounds the doubled root back down).
 * Component eval order in asm is [1] then [0] then [2]; preserved.
 * Sibling precedent: docs/research/c-match-prep/0208be70.c, 0208bf3c.c.
 */
#include <nitro/types.h>

int func_0208bfc4(int *a, int *b)
{
    int d1 = a[1] - b[1];
    int d0 = a[0] - b[0];
    int d2 = a[2] - b[2];
    long long sq = (long long)d1 * d1 + (long long)d0 * d0 + (long long)d2 * d2;

    *(vu16 *)0x040002b0 = 1;
    *(volatile unsigned long long *)0x040002b8 = (unsigned long long)sq << 2;
    while (*(vu16 *)0x040002b0 & 0x8000)
        ;
    return (*(vu32 *)0x040002b4 + 1) >> 1;
}
