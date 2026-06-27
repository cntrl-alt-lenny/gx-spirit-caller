/* CAMPAIGN-PREP candidate for func_02262804 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: arg-pack u16 truncation + (v?0x8000:0) ne-first; if-chain dispatch; unsigned>=9 cmp
 *   risk:       reshape-able: arg-pack operand-order/u16 width to 021d479c; if mwcc binds cd3f4 base once (orig reloads it twice) one `ldr` of the base diverges.
 *   confidence: med
 */
/* func_ov002_02262804: 3-state machine on d016c.f_d9c (0/1/else).
 * State0: set f_d2c=6, f_d30=1, call sinks, optional arg-packed 021d479c
 * (packed = (cd3f4[0]?0x8000:0)|0x1b truncated u16; arg = u16 cd3f4[+0x1c]),
 * set cd3f4.f14=1, f_d9c++. State1: tick 022627ac, return (u)f_d2c>=9.
 * cd3f4 base is loaded TWICE in the orig (once for [0], once for [+0x1c]). */
#include "ov002_core.h"

extern void func_ov002_021e2cd4(int a);
extern void func_ov002_021e2d20(int a, int b, int c);
extern void func_ov002_022627ac(void);

int func_ov002_02262804(int arg0, int arg1) {
    int state;

    state = *(int *)(data_ov002_022d016c + 0xd9c);
    if (state == 0) {
        *(int *)(data_ov002_022d016c + 0xd2c) = 6;
        *(int *)(data_ov002_022d016c + 0xd30) = 1;
        func_ov002_021e2cd4(0);
        func_ov002_021e2d20(arg0, 0x13, 1);
        if (arg1 != 0) {
            int v = *(int *)data_ov002_022cd3f4;
            func_ov002_021d479c(
                (u16)((v ? 0x8000 : 0) | 0x1b),
                (u16)*(int *)(data_ov002_022cd3f4 + 0x1c),
                1, 0);
        }
        *(int *)(data_ov002_022cd3f4 + 0x14) = 1;
        *(int *)(data_ov002_022d016c + 0xd9c) += 1;
        return 0;
    }
    if (state == 1) {
        func_ov002_022627ac();
        return (unsigned int)*(int *)(data_ov002_022d016c + 0xd2c) >= 9;
    }
    return 0;
}
