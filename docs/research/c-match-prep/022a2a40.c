/* CAMPAIGN-PREP candidate for func_022a2a40 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch(f4); n/10 and n%10 as separate smulls (no CSE); short-circuit >6 double-call clamp; out pair
 *   risk:       reshape-able: orig emits TWO smull for /10 (one for quotient ip, one inside %10). If mwcc CSEs q and r into one divide+sub, force two by computing `q=n/10` and `r=n%10` in separate statements or via a helper; r12/lr placement follows.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022a2a40 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: switch(rec->f4) 5/6/9 vs <0 vs else; mod-10 magic with q and r as SEPARATE
 *           smulls (do NOT CSE); short-circuit double-call clamp; results to res[0],res[1].
 */
extern int func_ov002_021afbc4(void);

typedef struct {
    int f0;
    int f4;          /* +0x04 state */
    char _pad08[0x28];
    int f30;         /* +0x30 */
} RecA2A;

void func_ov002_022a2a40(int *res, RecA2A *rec, int n) {
    int st = rec->f4;
    int out0, out1;

    if (st == 5 || st == 6 || st == 9) {
        out0 = (n % 10) * 16 + 0x38;
        out1 = (n / 10) * 16 + rec->f30 * 8 + 8;
    } else if (st < 0) {
        int r;
        if (func_ov002_021afbc4() > 6) r = 6;
        else r = func_ov002_021afbc4();
        out0 = 0x90 - (r * 32) / 2 + n * 32;
        out1 = 0x4a;
    } else {
        out0 = n * 0x18 + 0x40;
        out1 = rec->f30 * 8 + 8;
    }
    res[0] = out0;
    res[1] = out1;
}
