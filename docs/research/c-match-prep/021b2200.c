/* CAMPAIGN-PREP candidate for func_021b2200 (ov008, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD early-return + && short-circuit teardown
 *   risk:       early-return guard may compile popeq-return vs branch-skip; the cmp/cmpne && chain reg-alloc on o base should match (proven family)
 *   confidence: high
 */
/* func_ov008_021b2200: guarded teardown of the ov008 scene object. o =
 * *data_ov008_021b270c. If o[0x6c] handle is null, return. Else call
 * func_0202cca4(o[0xc]); if func_0202cdf8() reports an edge AND the a0 arg is
 * set, fire func_0202ce24(); always finish with func_0202d9a0(). (Mirror of
 * the ov009 021ab32c / ov008 021b2028 short-circuit teardown family.) */
#include "ov008_core.h"
extern void func_0202cca4(int a);
extern int func_0202cdf8(void);
extern void func_0202ce24(void);
extern void func_0202d9a0(void);

void func_ov008_021b2200(int a0) {
    int *o = *(int **)data_ov008_021b270c;
    if (o[27] != 0) {                       /* +0x6c */
        func_0202cca4(o[3]);                /* +0xc */
        if (func_0202cdf8() != 0 && a0 != 0) {
            func_0202ce24();
        }
        func_0202d9a0();
    }
}
