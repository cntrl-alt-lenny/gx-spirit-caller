/* CAMPAIGN-PREP candidate for func_0208aa50 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: n>>1 count; (a+b+1)>>1 signed asr average; ldrsh via short* ; index i*2
 *   risk:       reshape-able: the `lr = i<<1` byte-offset addressing and post-increment-then-compare loop shape are mwcc-natural for short[]. Risk: loop reads dst[i] (RMW) — if mwcc keeps base in reg vs reindexing, ldrsh offset form may shift.
 *   confidence: med
 */
/* func_0208aa50 (main, class D): halfword rounding-average of two
 * s16 arrays into the first, count = n>>1, then a fixed tail call.
 *   movs r5,r2,lsr#1 => half-count, beq skip.
 *   lr = i*2 (halfword index); a[i] = (a[i]+b[i]+1) >> 1 (asr#1).
 *   loop var i declared first (r4), then result count (r5). */
extern void func_02094550(void);

void func_0208aa50(short *dst, short *src, int n) {
    int i;
    int count = (unsigned int)n >> 1;

    for (i = 0; i < count; i++) {
        dst[i] = (short)((dst[i] + src[i] + 1) >> 1);
    }
    func_02094550();
}
