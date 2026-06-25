/* CAMPAIGN-PREP candidate for func_02077018 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     read pattern byte first (r0) then a (r1); signed char; la kept in callee-saved across 2nd call; la-lb order
 *   risk:       loop/branch layout: asm puts the match+NUL-check block ABOVE the reads (backward beq .L_3cc) with a `b .L_3dc` entry. mwcc may lay match as fall-through instead. reshape-able (try do/while or goto to flip branch polarity).
 *   confidence: med
 */
/* func_02077018: wildcard ('*'=0x2a) suffix string matcher.
 * a=arg0 (r6), b=arg1 (r5, the pattern). cb=*b++ read FIRST (r0),
 * ca=*a++ second (r1). Match -> if NUL return 0. Mismatch -> if cb!='*'
 * return 1; back up a; la=strlen(a), lb=strlen(b); if lb>la return 1;
 * a += la-lb; retry. Loop entered mid-body via `b .L_3dc`. */
extern int func_02077094(signed char *s);

int func_02077018(signed char *a, signed char *b) {
    int cb, ca;
    for (;;) {
        cb = *b++;
        ca = *a++;
        if (ca == cb) {
            if (ca == 0)
                return 0;
            continue;
        }
        if (cb != 0x2a)
            return 1;
        a--;
        {
            int la = func_02077094(a);
            int lb = func_02077094(b);
            if (lb > la)
                return 1;
            a += la - lb;
        }
    }
}
