/* CAMPAIGN-PREP candidate for func_02052b34 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign for final ge compare; early-return guard chain in source order; min/max-style movge/movlt via signed >=
 *   risk:       func_02052350 returns u8 compared to 1, and func_02051f1c arg is passed-but-ignored; if mwcc drops the dead `mov r0,r4` before the no-arg call, that instr diverges. permuter-class (dead-arg materialization)
 *   confidence: med
 */
/* func_02052b34: guard-chain predicate.
 * r0=handle, r1=mode. Returns 0/1.
 */

extern int  func_02045280(void);
extern int  func_020469d0(int handle);
extern int  func_02046718(int handle);
extern unsigned char func_02052350(int handle);
extern int  func_02051f1c(int handle);   /* arg passed but callee ignores it */
extern int  func_02052704(int mode);

int func_02052b34(int handle, int mode) {
    int a;
    int b;

    if (func_02045280() != 0)
        return 0;
    if (mode == 1) {
        if (func_020469d0(handle) == 0)
            return 0;
    }
    if (func_02046718(handle) == 0)
        return 0;
    if (func_02052350(handle) == 1)
        return 0;
    a = func_02051f1c(handle);
    b = func_02052704(mode);
    if (a >= b)
        return 1;
    return 0;
}
