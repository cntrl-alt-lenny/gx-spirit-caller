/* CAMPAIGN-PREP candidate for func_021ced78 (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch->addls jump-table; per-case reload of s->val; struct-base bound
 *   risk:       reshape-able: mwcc may emit a cmp tree instead of addls pc table for a 5-case switch returning bools; force with dense 0..4 cases (done). struct-guessed offsets.
 *   confidence: med
 */
/* func_ov004_021ced78 (ov004, cls D): gated branch-table returning bool
 * comparisons. gate @+0x228, selector @+0x22c, value @+0x230. The shared
 * .L_38 (cases 0,1,2) compares value to the *runtime* selector, so write
 * 'val == sel'; cases 3/4 compare against constants 4/3 (note the swap). */

extern char data_ov004_0220b500[];

struct S021ced78 {
    char  _pad0[0x228];
    int   gate;   /* +0x228 */
    int   sel;    /* +0x22c */
    int   val;    /* +0x230 */
};

int func_ov004_021ced78(void) {
    struct S021ced78 *s = (struct S021ced78 *)data_ov004_0220b500;
    if (s->gate == 0)
        return 0;
    switch (s->sel) {
    case 0:
    case 1:
    case 2:
        return s->val == s->sel;
    case 3:
        return s->val == 4;
    case 4:
        return s->val == 3;
    }
    return 0;
}
