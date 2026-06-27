/* CAMPAIGN-PREP candidate for func_02068890 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ldrsb => signed char c; cursor reload each iter (orig re-ldr's the global); break-on-0/match then post-loop ip==start ?0:start tail
 *   risk:       orig's `cmp ip,r0; moveq r0,#0` is a dead movcc on the c!=0 path; the ternary may compile to that exact movcc/branch or mwcc may pick a different cmp-order. permuter-class (cmp/movcc coin-flip).
 *   confidence: low
 */
/* func_02068890 (main, class C) — global-pointer walk, branch structure */
extern signed char *data_0219ecc4;   /* cursor into a name table */

signed char *func_02068890(signed char *set, int match) {
    signed char *start;
    signed char *p;
    int          c;

    if (set != 0) {
        data_0219ecc4 = set;
    }
    start = data_0219ecc4;

    for (;;) {
        p = data_0219ecc4;
        c = *p;
        if (c == 0) break;
        if (c == match) break;
        data_0219ecc4 = data_0219ecc4 + 1;
    }

    if (c == 0) {
        return (p == start) ? (signed char *)0 : start;
    }
    data_0219ecc4 = data_0219ecc4 + 1;
    *p = 0;
    return p;
}
