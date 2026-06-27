/* CAMPAIGN-PREP candidate for func_021d2390 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D store-order: pack two s16 coord pairs <<12 once; 3 distance calls reuse stack slots
 *   risk:       permuter-class + struct-guessed: 3 calls re-load OVERLAPPING stack-packed pairs (sp+0/8/28) in an order the direct C can't fix; exact coord routing per call (which pair each call gets) inferred from ldmia bases — verify against the stack layout.
 *   confidence: low
 */
/* func_ov011_021d2390: three Q12 distances among two points p0=(r0),p1=(r1),
 * each a struct of two s16 (f0=x, f2=y), then combine. Reads p0.x,p1.x,p1.y,
 * p0.y (sign-ext), each <<12, packs into stack and calls func_ov011_021d22d4
 * three times: d(p0,p1)->r5, d(p1,p1?)->r4 ... combine sub r1,r4,r5; sub r0,r0,r1.
 * The 3 calls reuse overlapping stack-packed coord pairs (store-order driven). */
extern int func_ov011_021d22d4(int x0, int y0, int x1, int y1);

int func_ov011_021d2390(short *p0, short *p1) {
    int a0x = (int)p0[0] << 12;
    int a0y = (int)p0[1] << 12;
    int a1x = (int)p1[0] << 12;
    int a1y = (int)p1[1] << 12;
    int d0 = func_ov011_021d22d4(a0x, a0y, a1x, a1y);
    int d1 = func_ov011_021d22d4(a1x, a1y, a0x, a0y);
    int d2 = func_ov011_021d22d4(a0x, a0y, a1x, a1y);
    return d2 - (d1 - d0);
}
