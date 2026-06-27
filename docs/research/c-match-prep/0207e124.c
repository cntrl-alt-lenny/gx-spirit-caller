/* CAMPAIGN-PREP candidate for func_0207e124 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     unsigned mode>2 branch picks arg layout; early-return on flag==0 via if
 *   risk:       early-return: orig emits addeq sp/ldmeq inline for flag==0 then falls through. mwcc may instead branch to a shared epilogue, changing the predicated-vs-branch epilogue. reshape-able (invert test / structure).
 *   confidence: med
 */
#include <stdint.h>

extern uint16_t data_021a08e0;
extern void *data_021020f4;
extern void *data_021020f8;
extern void *func_0207df18;
extern void *func_0207df20;
extern void func_0207e0a8(void);
extern void func_0207e1c4(int a, int b, int c, int d, int e);

void func_0207e124(int mode, int flag) {
    if (mode > 2) {
        func_0207e1c4(4, 3, 0, 2, 1);
    } else {
        func_0207e1c4(4, 3, 2, 0, 1);
    }
    data_021a08e0 = (uint16_t)mode;
    func_0207e0a8();
    if (flag != 0) {
        data_021020f4 = func_0207df20;
        data_021020f8 = func_0207df18;
    }
}
