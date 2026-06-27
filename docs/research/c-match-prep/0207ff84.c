/* CAMPAIGN-PREP candidate for func_0207ff84 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     st.a=arg2 stored first then cb=obj->f4 then b,c zeroed; do-while first-call-outside; addeq count on r==10; count*(arg1+by)-arg1
 *   risk:       reshape-able: store-order st.a,st.b,st.c must hold (a first, b/c reuse zero reg). Minor: cb bound from obj->f4 forces blx; otherwise the r==10 loop is tight, low divergence.
 *   confidence: med
 */
/* func_0207ff84: count via indirect callback until 0, mul tail. */
typedef struct {
    signed char *f0;        /* 0x0  (->[1] read as s8) */
    int (*f4)(void *);      /* 0x4  callback */
} obj_t;

int func_0207ff84(obj_t *obj, int arg1, int arg2) {
    struct { int a; int b; int c; } st;
    int (*cb)(void *) = obj->f4;
    int count = 1;
    int r;
    signed char by;
    st.a = arg2;
    st.b = 0;
    st.c = 0;
    r = cb(&st);
    if (r != 0) {
        do {
            if (r == 10) count++;
            r = cb(&st);
        } while (r != 0);
    }
    by = obj->f0[1];
    return count * (arg1 + by) - arg1;
}
