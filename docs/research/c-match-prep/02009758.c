/* CAMPAIGN-PREP candidate for func_02009758 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D divmod: n/32 word, n%32 shift; tst-early-return then orr/str; bind constant 1 in ip
 *   risk:       reshape-able: orig reuses ip=#1 for both tst and orr (one mov), and re-stores the same word index lr (not recomputed). If mwcc rematerialises the shift mask or word index for the store path, instructions diverge — keep single n%32/n/32 expressions so CSE binds them.
 *   confidence: med
 */
extern unsigned int data_021059b8[];
extern unsigned int data_02104f3c[];

void func_02009758(int n)
{
    if (data_021059b8[n / 32] & (1 << (n % 32)))
        return;
    data_021059b8[n / 32] |= 1 << (n % 32);
    data_02104f3c[0xa88 / 4] = 1;
}
