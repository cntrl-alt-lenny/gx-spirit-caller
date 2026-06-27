/* CAMPAIGN-PREP candidate for func_0229e010 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: divmod /11 (magic 0x2e8ba2e9); eor-parity branch select; min/clamp if-assign; store-order
 *   risk:       loc[2]=a/loc[3]=b are written but never read (str r3,[sp,8]/r2,[sp,0xc]); mwcc will DCE them unless loc address forces liveness, dropping 2 str. struct-guessed
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229e010 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. recipe: OUT-struct call; eor-parity branch
 * select of signed diff; signed /11 (magic 0x2e8ba2e9); clamp lim=min(m,8),
 * q>=lim -> m-1, else base+max(q,0). stack/struct layout guessed. */
extern int data_ov002_022cd73c[];
extern void func_ov002_0229dbc8(int *out, char *self, int base);

int func_ov002_0229e010(char *self, int arg1) {
    int loc[4];
    int base = *(int *)(self + 0xa8);
    int a, b, d, q, m, lim;

    func_ov002_0229dbc8(loc, self, base);
    a = loc[0];
    b = loc[1];

    if (*(int *)(self + 0xa0) != (data_ov002_022cd73c[1] ^ 1)) {
        int t = a - 0xb;
        loc[2] = a;
        loc[3] = b;
        d = arg1 - t;
    } else {
        loc[2] = a;
        loc[3] = b;
        d = (a + 0xb) - arg1;
    }

    q = d / 11;
    m = *(int *)(self + 0xa4);
    if (m > 8)
        lim = 8;
    else
        lim = m;
    if (q >= lim)
        return m - 1;
    if (q < 0)
        q = 0;
    return base + q;
}
