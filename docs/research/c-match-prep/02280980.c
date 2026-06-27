/* CAMPAIGN-PREP candidate for func_02280980 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: stack out-params, max via if-assign, early returns keep cond-move+ret
 *   risk:       the two early-return blocks compile to `cmp;...gt;ldmgt` predicated epilogues; mwcc may instead branch-to-shared-epilogue, changing structure. reshape-able-ish but layout-sensitive (permuter-class fallback).
 *   confidence: low
 */
extern int func_ov002_0227b0b8(int a, int b, int c);
extern int func_ov002_02280a1c(int a, int *b, int *c, int d);

int func_ov002_02280980(int a)
{
    int b0;
    int b1;
    int c0;
    int c1;
    int t;

    func_ov002_02280a1c(1 - a, &b0, &c0, 0);
    func_ov002_02280a1c(a, &b1, &c1, 0);
    {
        int x = c0;
        if (b0 > x)
            x = b0;
        if (c1 > x)
            return 2;
    }
    {
        int y = c1;
        if (c1 <= b1)
            y = b1;
        if (b0 > y)
            return -2;
    }
    t = func_ov002_0227b0b8(1 - a, -1, 0);
    if (t >= 0x7d0)
        return -4;
    return 0;
}
