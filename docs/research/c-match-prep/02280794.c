/* CAMPAIGN-PREP candidate for func_02280794 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: count holds in r4 across two min-clamps (if-assign), store r7 before branch
 *   risk:       `movs r8,r0; bmi` is a signed-negative test fused with the store of the call result; mwcc may emit `cmp #0` + separate mov, costing the movs flag-reuse. reshape-able (bind result to signed temp).
 *   confidence: med
 */
extern int data_ov002_022cd524;
extern int data_ov002_022d016c;
extern int func_ov002_021afb64(void);
extern int func_ov002_021aff4c(int a, int b);
extern int func_ov002_021bcf00(int a);
extern int func_ov002_0225368c(void);
extern int func_ov002_0227f03c(int a, int b, int c);

int func_ov002_02280794(int a, int b, int c, int count)
{
    int lim;
    int n;
    int v;

    lim = func_ov002_0225368c();
    if (count >= lim)
        count = lim;
    *(int *)&data_ov002_022cd524 = a;
    if (b == 0x18e0) {
        lim = func_ov002_021bcf00(1 - a);
        if (count >= lim)
            count = lim;
    }
    if (count == 0)
        count = 1;
    n = 0;
    if (count > 0) {
        do {
            v = func_ov002_0227f03c(a, b, c);
            if (v < 0)
                break;
            func_ov002_021afb64();
            func_ov002_021aff4c(v, n + 1);
            n++;
        } while (n < count);
    }
    *(int *)((char *)&data_ov002_022d016c + 0xd44) = n;
    return n;
}
