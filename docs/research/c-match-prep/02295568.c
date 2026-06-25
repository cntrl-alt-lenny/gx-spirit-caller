/* CAMPAIGN-PREP candidate for func_02295568 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C if-assign guards; 1-b0 -> rsb; 5th stack arg via sub sp,#4; b0 reload per use
 *   risk:       orig shares ip=0 for both the -1 (sub r2,ip,#1) and the stacked 0 (str ip); mwcc may materialize 0 and -1 separately -> one extra mov. reshape-able (low impact).
 *   confidence: med
 */
/* func_ov002_02295568: linear guard chain (sub sp,#4 for one stacked arg).
 * b0 = p->b0 (u16@+2 bit0).
 *   if 02259f74(b0) == 0           -> return 0
 *   if 021bbf50(1 - b0) == 0       -> return 0
 *   return 02280b74(b0, b0, -1, 1, 0) >= 1000   (1 if >=0x3e8 else 0)
 * The 5th arg (0) is passed on the stack (str ip,[sp]); ip=0 also yields the
 * -1 via (0 - 1). */
extern int func_ov002_02259f74(int b0);
extern int func_ov002_021bbf50(int v);
extern int func_ov002_02280b74(int a, int b, int c, int d, int e);

struct Ov002Hdr1 { char _p2[2]; unsigned short b0 : 1; };

int func_ov002_02295568(struct Ov002Hdr1 *p) {
    if (func_ov002_02259f74(p->b0) == 0)
        return 0;
    if (func_ov002_021bbf50(1 - p->b0) == 0)
        return 0;
    return func_ov002_02280b74(p->b0, p->b0, -1, 1, 0) >= 1000;
}
