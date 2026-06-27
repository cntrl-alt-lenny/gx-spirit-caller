/* CAMPAIGN-PREP candidate for func_02008d1c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D divmod: n/32, n%32 shift-chain; call-for-side-effect; extract &1, ip holds base after call
 *   risk:       reshape-able: orig defers base ldr (ip,_LIT0) and rec*8 add to AFTER the call and computes word index first; if mwcc hoists data_02105bb0 load before the call, ldr/add scheduling diverges. Reorder so divmod precedes array access.
 *   confidence: med
 */
extern unsigned int data_02105bb0[][8];
extern void func_02008c10(int);

int func_02008d1c(int rec, int n)
{
    func_02008c10(rec);
    return (data_02105bb0[rec][n / 32] >> (n % 32)) & 1;
}
