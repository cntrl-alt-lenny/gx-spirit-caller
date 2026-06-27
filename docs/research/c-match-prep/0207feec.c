/* CAMPAIGN-PREP candidate for func_0207feec (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stack out_t tmp inits {0,0}; max as memory accumulator (if-assign strgt); arg4 by &-and-value to fff8; (count-1)*(arg3+b)-arg3; copy *out=tmp
 *   risk:       reshape-able/permuter-class: orig keeps tmp.f0 in memory (ldr/cmp/strgt) — mwcc -O4 may promote it to a callee-saved reg, dropping the spill. Also fff8 may take 3 not 4 args (r2 leftover at call).
 *   confidence: med
 */
/* func_0207feec: max-accumulate over callee-zeroed flag, mul tail, struct-out. */
typedef struct { int f0; int f4; } out_t;

extern int func_0207fff8(void *a, int b, int c, int *pd);

void func_0207feec(out_t *out, signed char **arg1, int arg2, int arg3, int arg4) {
    out_t tmp;
    int count = 1;
    signed char b;
    tmp.f0 = 0;
    tmp.f4 = 0;
    if (arg4 != 0) {
        do {
            int v = func_0207fff8(arg1, arg2, arg4, &arg4);
            if (v > tmp.f0) tmp.f0 = v;
            count++;
        } while (arg4 != 0);
    }
    b = (*arg1)[1];
    tmp.f4 = (count - 1) * (arg3 + b) - arg3;
    *out = tmp;
}
