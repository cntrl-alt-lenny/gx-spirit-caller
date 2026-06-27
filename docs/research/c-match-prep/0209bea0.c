/* CAMPAIGN-PREP candidate for func_0209bea0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: long long = (s64)days*86400 + secs; -1 sentinels -> -1LL
 *   risk:       (s64)days*86400 lowers to umull;mla r4,0;mla sign*86400;adds;adc with secs sign-extended in the adc - canonical mwcc 64-bit form; the exact mla/asr/adc sequence is the only divergence. reshape-able (cast placement) else permuter-class.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0209bea0 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: 64-bit multiply lowering is mwcc-version sensitive.
 *   recipe:     long long = (s64)days*86400 + secs; two guarded -1 sentinels return -1LL; constant 86400 multiply lowers to umull+mla+asr sign-correct
 *   risk:       the (s64)int*const + int chain lowers to umull;mla(*0);mla(sign*const);adds;adc - canonical mwcc 64-bit codegen, should match; but the exact sign-extension/adc sequence is the risk. reshape-able only via operand cast placement; else permuter-class.
 *   confidence: med
 */
/* func_0209bea0: total-seconds-since-epoch as a 64-bit value.
 * days = func_0209bf34(date); seconds-of-day = func_0209bf18(time);
 * result = (long long)days * 86400 + seconds.  -1 from either -> -1LL. */

extern int func_0209bf34(void *date);
extern int func_0209bf18(void *time);

long long func_0209bea0(void *date, void *time) {
    int days = func_0209bf34(date);
    if (days == -1)
        return -1LL;
    {
        int secs = func_0209bf18(time);
        if (secs == -1)
            return -1LL;
        return (long long)days * 86400 + secs;
    }
}
