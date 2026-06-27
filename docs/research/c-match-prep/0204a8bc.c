/* CAMPAIGN-PREP candidate for func_0204a8bc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     branch-table switch; (cls,off) pair via mvn(~K)+add(base); if(cls) guard; uninitialised default off (cases 2/5 return 0)
 *   risk:       the (int)0xfffeac28 + ~K folds to a single constant in C; mwcc may materialise the folded pointer via one ldr (literal pool) instead of the orig's mvn r2,#K + add r1,r2,base split. reshape-able only if a symbol/array base is substituted so the +~K index stays separate; otherwise permuter-class.
 *   confidence: med
 */
/* func_0204a8bc - main - class D (switch returning constant pairs, branch-table).
 * a0==0 -> return 0. Else switch sets (cls, off); tail calls
 * func_02050054(cls, BASE + off) when cls!=0. BASE=0xfffeac28; off is a small
 * negative (mvn) immediate, so the call arg is BASE + ~K. cases 2/5 zero the
 * return (ret=0, cls=0 => no call). default leaves cls=a0, off uninitialised
 * (matches mov r0 carrying a0 with r2 undefined in the .L_450 fall-through). */

extern void func_02050054(int cls, int msg);

int func_0204a8bc(int a0) {
    int ret = a0;
    int cls = a0;
    int off;            /* intentionally uninitialised in default path */

    if (a0 == 0)
        return 0;

    switch (a0) {
    case 1: cls = 9; off = ~0x0; break;
    case 2: cls = 0; ret = 0; break;
    case 3: cls = 6; off = ~0x9; break;
    case 4: cls = 6; off = ~0x1d; break;
    case 5: cls = 0; ret = 0; break;
    case 6: cls = 6; off = ~0x45; break;
    case 7: cls = 6; off = ~0x4f; break;
    }

    if (cls != 0)
        func_02050054(cls, (int)0xfffeac28 + off);
    return ret;
}
