/* CAMPAIGN-PREP candidate for func_02293e80 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: stack out-params a..d; max via if-assign(movgt/movle) recomputed twice as orig does
 *   risk:       orig keeps r3=[spc],r1=[sp8] live and redoes cmp r3,r1 for the 2nd max (movle r3,r1) rather than caching m; my second if/else may collapse to one max. reshape-able: mirror the recompute. struct-guessed out-param layout
 *   confidence: low
 */
typedef struct Unit {
    unsigned short field0;
    unsigned short f0 : 1;
    unsigned short f1 : 5;
    unsigned short pad6 : 6;
    unsigned short f12 : 2;
    unsigned short f14 : 1;
    unsigned short pad15 : 1;
} Unit;

extern void func_ov002_02280a1c(int side, int *a, int *b, int one);

int func_ov002_02293e80(Unit *u) {
    int a, b, c, d;
    int m;
    func_ov002_02280a1c(1 - u->f0, &a, &b, 1);
    func_ov002_02280a1c(u->f0, &c, &d, 1);
    m = b;
    if (a > b)
        m = a;
    if (c > m)
        return 0;
    if (a > b)
        m = a;
    else
        m = b;
    return d > m ? 1 : 0;
}
