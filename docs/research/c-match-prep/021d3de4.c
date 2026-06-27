/* CAMPAIGN-PREP candidate for func_021d3de4 (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     plain %1000 for smull-magic; if-assign abs x2; &&-materialized over-bool
 *   risk:       orig recomputes |d| twice (subs/movpl/rsbmi, then cmp/rsblt); if mwcc CSEs my two `if(d<0)d=-d` into one abs the tail diverges. reshape-able (keep distinct temps / reorder).
 *   confidence: med
 */
/* func_ov004_021d3de4: read a metric via func_02051ab0, reduce mod 1000, then
 * compute a 0..100 "closeness" score vs a reference halfword (data_0210594c+0x58).
 * cls D: smull /1000 divmod (magic 0x10624dd3) + abs/clamp arithmetic.
 *   val = func_02051ab0(self, &data_ov004_02209f88, 1)
 *   over = (e500[0xc9c] != 0 && val >= 1000)
 *   m   = val % 1000
 *   if (over) return 50
 *   d = m - ref;  score = 100 - 10*|d|
 *   if (m <= 10 && ref <= 10) return score
 *   if (|d| > 5) return 0
 *   return score
 */
#include "ov004_core.h"
extern char *func_ov004_021d38b4(void);
extern int   func_02051ab0(char *self, void *a1, int a2);
extern char  data_ov004_02209f88[];
extern char  data_0210594c[];

int func_ov004_021d3de4(char *self) {
    int val, m, ref, d, ad, score, over;
    func_ov004_021d38b4();
    val = func_02051ab0(self, data_ov004_02209f88, 1);
    over = 0;
    if (*(int *)(data_ov004_0220e500 + 0xc9c) != 0 && val >= 1000)
        over = 1;
    m = val % 1000;
    if (over)
        return 50;
    ref = *(unsigned short *)(data_0210594c + 0x58);
    d = m - ref;
    ad = d;
    if (d < 0)
        ad = -d;
    score = 100 - ad * 10;
    if (m <= 10 && ref <= 10)
        return score;
    if (d < 0)
        d = -d;
    if (d > 5)
        return 0;
    return score;
}
