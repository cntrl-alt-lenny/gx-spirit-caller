/* CAMPAIGN-PREP candidate for func_0208f458 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store result unconditionally before zero early-return; if/else-if test 0x20 then 0x40; no default store
 *   risk:       branch ordering: orig branches forward on ==0x20 and handles 0x40 inline; mwcc may invert which body is inline vs out-of-line, or build a jump table. reshape-able (reorder the if-chain / try switch).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0208f458 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Dispatch on a call result.
 * r = func_0208cefc(); STORE r to data_021a6328 UNCONDITIONALLY (before the
 * zero-test). r==0 -> return. r==0x20 -> data_021a6324 = 0x06890000.
 * r==0x40 -> data_021a6324 = 0x06894000. default -> nothing.
 * STORE-ORDER: the data_021a6328 store precedes the early r==0 return; written
 * as a statement before the if to match `str r0,[r1]; cmp r0,#0; ...bxeq`.
 * Orig tests 0x20 first (beq forward) then 0x40 inline, so 0x20 body sits at
 * the tail — modeled as if/else-if in that test order. */
extern int  func_0208cefc(void);
extern int  data_021a6324;
extern int  data_021a6328;

void func_0208f458(void)
{
    int r = func_0208cefc();
    data_021a6328 = r;
    if (r == 0)
        return;
    if (r == 0x20) {
        data_021a6324 = 0x06890000;
        return;
    }
    if (r == 0x40)
        data_021a6324 = 0x06894000;
}
