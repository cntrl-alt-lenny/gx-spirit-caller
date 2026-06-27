/* CAMPAIGN-PREP candidate for func_0209bf34 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: word table[month], carry-before-clobber leap branch, /4 via >>2
 *   risk:       reshape-able: the duplicate month range-guard (orig re-tests 1<=m<=12 after the field check) may be CSE-folded away; if so emit it as a separate `if` to keep both cmp pairs.
 *   confidence: med
 */
/* func_0209bf34: validate a date struct then return days-since-epoch.
 * class D: leap-day branch + word-indexed cumulative-month table.
 * Struct: 0=year(u<100), 4=month(1..12), 8=day(1..31), 0xc=field(<7).
 * cmp month,#3 sets carry BEFORE r2 is overwritten -> the leap test is
 * (month>=3 && (year&3)==0); mla = year*365 + days; + (year+3)>>2 leaps.
 */

extern const int data_021026a4[]; /* cumulative days before month[1..12], word array */

struct Date { int year; int month; int day; int field; };

int func_0209bf34(struct Date *d) {
    int year = d->year;
    if ((unsigned)year >= 0x64) return -1;
    {
        int month = d->month;
        if ((unsigned)(month - 1) > 0xb) return -1;
        {
            int day = d->day;
            if ((unsigned)(day - 1) > 0x1e) return -1;
            if (d->field >= 7) return -1;
            if ((unsigned)(month - 1) > 0xb) return -1;
            {
                int days = (day - 1) + data_021026a4[month];
                if (month >= 3 && (year & 3) == 0) days += 1;
                return year * 0x16d + days + ((year + 3) >> 2);
            }
        }
    }
}
