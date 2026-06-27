/* CAMPAIGN-PREP candidate for func_0208c2e0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: sqrt-MMIO 64-bit, sumsq[1,0,2], (u64)sq<<2 param, (res+1)>>1, leaf
 *   risk:       store-order: same low-then-high interleave as 0208bfc4; u64 volatile store may schedule both shifts before both str. reshape-able via explicit lo/hi int field stores; otherwise body (no frame) should match cleanly.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0208c2e0 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. recipe: D, DS hardware sqrt unit, 64-bit
 * mode, clean leaf (no subtract). sumsq = v.x^2+v.y^2+v.z^2 (signed 64-bit),
 * eval order [1],[0],[2]; write (u64)sumsq<<2 to SQRT_PARAM, busy-poll bit15,
 * return (SQRT_RESULT+1)>>1. No stack frame (pure leaf, r1/ip scratch).
 * Sibling precedent: 0208bfc4 (this batch), 0208be70.c, 0208bf3c.c.
 */
#include <nitro/types.h>

int func_0208c2e0(int *v)
{
    long long sq = (long long)v[1] * v[1] + (long long)v[0] * v[0] + (long long)v[2] * v[2];

    *(vu16 *)0x040002b0 = 1;
    *(volatile unsigned long long *)0x040002b8 = (unsigned long long)sq << 2;
    while (*(vu16 *)0x040002b0 & 0x8000)
        ;
    return (*(vu32 *)0x040002b4 + 1) >> 1;
}
