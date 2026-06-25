/* CAMPAIGN-PREP candidate for func_0203f030 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear call seq; guard-then-tail; store-order for global
 *   risk:       data_0219ecdc decl type (u32 vs int*) may flip the str reloc class; callee signatures guessed
 *   confidence: high
 */
#include "types.h"

extern u32 data_0219ecdc;
extern int func_0203c85c(int);
extern int func_0203c900(int);
extern int func_0203edd4(int a, int b, int c);
extern int func_0206e7bc(int);

int func_0203f030(int a)
{
    int v5 = func_0203c900(1);
    int v4 = func_0203c900(4);
    func_0203edd4(v5, a, v4);
    data_0219ecdc = 4;
    if (func_0206e7bc(v4) == 0) {
        return 0xc;
    }
    func_0203c85c(2);
    return 0x11;
}
