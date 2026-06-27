/* CAMPAIGN-PREP candidate for func_0205ba5c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: rotate->%4, smull-magic->%100/%400, branch-table months, day<=N as if-assign.
 *   risk:       reshape-able: leap path is one shared smull chain in orig (year%4 with %100/%400 inline); my goto-leap may duplicate the day<=29 tail or reorder the %100/%400 sub-tests — fold to single if.
 *   confidence: low
 */
/* func_0205ba5c — date validator (class D: divmod / switch).
 * r0=day, r1=month, r2=year. Returns 1 if (0,0,0) sentinel or a valid date.
 * Leap = year%4==0 && (year%100!=0 || year%400==0). Month branch-table -> day limit.
 * The two smull chains (asr#5 / asr#7) decode to %100 and %400; the lsl30/ror30
 * prologue decodes to year%4==0.
 */
int func_0205ba5c(int day, int month, int year)
{
    /* all-zero sentinel accepted first */
    if (day == 0 && month == 0 && year == 0)
        return 1;

    /* any negative component is invalid */
    if (day < 0 || month < 0 || year < 0)
        return 0;

    switch (month) {
    case 1:
        if (day == 0)
            return 1;
        return 0;
    case 2:
    case 4:
    case 6:
    case 8:
    case 9:
    case 11:
        /* 31-day months */
        if (day <= 31)
            return 1;
        return 0;
    case 5:
    case 7:
    case 10:
    case 12:
        /* 30-day months */
        if (day <= 30)
            return 1;
        return 0;
    case 3:
        /* February: leap test */
        if ((year % 4) == 0) {
            if ((year % 100) != 0)
                goto leap;
            if ((year % 400) == 0)
                goto leap;
        }
        /* non-leap */
        if (day <= 29)
            return 1;
        return 0;
    leap:
        if (day <= 29)
            return 1;
        return 0;
    default:
        return 0;
    }
}
