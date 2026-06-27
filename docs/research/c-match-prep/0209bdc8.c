/* CAMPAIGN-PREP candidate for func_0209bdc8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D divmod: Zeller; reuse (month-2) test <1; / and % to smull magics
 *   risk:       orig derives year/100 and year%100 from one 0x51eb851f dividend via TWO materialised smull (not CSE'd) plus ordered sign-correction adds; mwcc divmod lowering + final-sum term order will diverge. permuter-class (permuter or escape-to-.s).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0209bdc8 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: heavy divmod chain, highly scheduling-sensitive.
 *   recipe:     Zeller's congruence; reuse (month-2) as m2 and test m2<1 (matches sub r3,#2;cmp #1;addlt #0xc); constant / and % lower to the smull magics
 *   risk:       orig computes year/100 AND year%100 from the SAME 0x51eb851f dividend via TWO smull (materialised twice, not CSE'd) and threads sign-correction adds in a specific order; mwcc's divmod lowering + the final sum term-order is the divergence. permuter-class (run permuter or escape-to-.s).
 *   confidence: low
 */
/* func_0209bdc8: day-of-week via Zeller's congruence. date = {int year(+0),
 * int month(+4), int day(+8)} with year an offset from 2000. Returns 0..6. */

int func_0209bdc8(int *date) {
    int month = date[1];
    int year  = date[0] + 2000;
    int day;
    int m2 = month - 2;
    int K, J, monthTerm;
    if (m2 < 1) {
        year -= 1;
        m2 += 12;
    }
    day = date[2];
    monthTerm = (26 * m2 - 2) / 10;
    K = year % 100;
    J = year / 100;
    return (day + monthTerm + K + K / 4 + 5 * J + J / 4) % 7;
}
