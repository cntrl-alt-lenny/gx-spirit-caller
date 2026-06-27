/* CAMPAIGN-PREP candidate for func_02009788 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D divmod leaf: n/32 word index, n%32 shift; return masked word (no &1), bx lr leaf
 *   risk:       reshape-able: returns the full masked word (and r0,r2,r1 lsl r0) NOT a boolean &1 — keep `arr[..] & (1<<..)` without `!= 0`/`& 1`. Low risk; only divergence is if mwcc normalises to a 0/1 boolean.
 *   confidence: high
 */
extern unsigned int data_021058d8[];

int func_02009788(int n)
{
    return data_021058d8[n / 32] & (1 << (n % 32));
}
