/* CAMPAIGN-PREP candidate for func_02049710 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     save a3->r6, a4(stack)->r4, s via movs r5; buf=sp+0 reused; reload *a4 (r4=[r4]) for second branch
 *   risk:       asm reloads *a4 into r4 (ldr r4,[r4]) before the -1 test and reuses that for the 2nd func_02043728 arg; if mwcc keeps the function-return value live instead of reloading *a4, the ldr r4,[r4] disappears. reshape-able by reading *a4 into a fresh local before the compare.
 *   confidence: med
 */
/* func_02049710 (main, class C). Args (a0,a1,a2,a3, a4=[sp,#0x110]).
 * r6=a3 saved; buf[0x100] at sp+0. s = func_020497a8(a0,a1,a2,buf).
 * If s==0: *a4 = -1; return 0. Else: t = func_020aaddc(buf);
 *   *a4 = func_02043728(buf, t, 0, 0);
 *   if a3==0 OR *a4==-1: return s;
 *   else: t2 = func_020aaddc(buf); func_02043728(buf, t2, a3, *a4); return s. */

extern int func_020497a8(int a0, int a1, int a2, char *buf);
extern int func_020aaddc(char *buf);
extern int func_02043728(char *buf, int t, int c, int d);

int func_02049710(int a0, int a1, int a2, int a3, int *a4) {
    char buf[0x100];
    int s = func_020497a8(a0, a1, a2, buf);
    if (s == 0) {
        *a4 = -1;
        return 0;
    }
    {
        int t = func_020aaddc(buf);
        *a4 = func_02043728(buf, t, 0, 0);
        if (a3 == 0 || *a4 == -1) {
            return s;
        }
        func_02043728(buf, func_020aaddc(buf), a3, *a4);
        return s;
    }
}
