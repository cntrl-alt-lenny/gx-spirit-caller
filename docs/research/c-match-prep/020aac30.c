/* CAMPAIGN-PREP candidate for func_020aac30 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     null/empty guard; stack arg cell str-order; signed-char deref guard
 *   risk:       struct-guessed/permuter-class: arg shuffling through r1=a1->lr, r2=a2->r3 then re-marshalled onto stack is a hand calling-convention thunk; exact str [sp],[sp,#8] ordering and which incoming arg lands where won't reproduce from a normal C call.
 *   confidence: low
 */
extern int func_020a9e58(void *fmt, void *a, void *b, void *stk0, void *stk1);
extern int func_020aabac(void);

int func_020aac30(signed char *s, int a1, int a2)
{
    void *st[2];
    st[0] = s;
    st[1] = (void *)0;

    if (s == 0 || *s == 0)
        return -1;

    return func_020a9e58((void *)func_020aabac, &st[0], (void *)a1,
                         (void *)0, (void *)0);
}
