/* CAMPAIGN-PREP candidate for func_0206880c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     i(r6)/sz(r5) hoisted as loop-invariant locals; two iterator calls per pass (lookahead r7 + advance r8); seed before loop
 *   risk:       orig keeps r6=0/r5=0x5c live in callee-saved regs across the loop; decl-order of i/sz vs cur/next may rotate which regs (r4..r7) hold them. permuter-class (callee-saved assignment).
 *   confidence: low
 */
/* func_0206880c (main, class C) — loop over name table with calls; reg-alloc */
extern void *data_02101d5c;
extern void *func_02068890(int a, int b);
extern int   func_020688fc(void *e);
extern void  func_02068b54(void *self, void *cur, void *next);

void func_0206880c(void *self, int name) {
    void *cur;
    void *next;
    int   i;
    int   sz;

    cur = func_02068890(name + 1, 0x5c);
    if (cur == 0) return;

    i  = 0;
    sz = 0x5c;
    do {
        next = func_02068890(i, sz);
        if (next == 0) next = &data_02101d5c;
        if (func_020688fc(cur) != 0) {
            func_02068b54(self, cur, next);
        }
        cur = func_02068890(i, sz);
    } while (cur != 0);
}
