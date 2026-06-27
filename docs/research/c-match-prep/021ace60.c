/* CAMPAIGN-PREP candidate for func_021ace60 (ov009, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D divmod: const-divisor smull magic => plain `/`; range guard => shared exit; ip/lr temps
 *   risk:       permuter-class: explicitly shipped .s (brief 302). The two signed-magic divides ARE plain `/85`,`/45`, but the orig parks results in ip/lr (caller-clean) and the `b=0` default + late `+1` ordering ties to specific regs; reg-alloc coin-flip the reshape won't fix.
 *   confidence: low
 */
/* func_ov009_021ace60 — two smull magic-divides + range checks (class D divmod).
 * func_02006110(&x,&y) yields two ints; an out-of-range pair sets f3c=1,f30=0;
 * else f3c=0 and two /N magic divides (0x78787879 -> /85-ish, 0xb60b60b7) fill
 * f34/f38. Already shipped as .s (reg-alloc walled). */
#include "ov009_core.h"

extern void func_02006110(int *x, int *y);

void func_ov009_021ace60(int *o) {
    int x, y;
    func_02006110(&y, &x);                 /* r0=&[sp+4]=y, r1=&[sp]=x */
    if (y < 0x21 || y >= 0xdf || x < 0x15 || x >= 0x9d) {
        o[0x3c / 4] = 1;
        o[0x30 / 4] = 0;
        return;
    }
    o[0x3c / 4] = 0;
    {
        int a = (x - 0x15) / 85;           /* smull 0x78787879, asr#4 */
        int c = 3 - a;
        int b = 0;
        if (y < 0xa8) {
            b = (y - 0x21) / 45 + 1;       /* smull 0xb60b60b7, +base, asr#5 */
        }
        o[0x34 / 4] = b;
        o[0x38 / 4] = c;
    }
}
