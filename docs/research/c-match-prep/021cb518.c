/* CAMPAIGN-PREP candidate for func_021cb518 (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     fn-ptr table dispatch + B6C field-pool RMW (reload global)
 *   risk:       DOCUMENTED WALL (ov004_core.h brief 318, == ov011 021d0afc): B6C field-pool index/base reg-alloc differs; C-unsteerable, will not byte-match
 *   confidence: low
 */
/* func_ov004_021cb518: dispatch the current step's fn-ptr from table
 * data_ov004_02209ac0[idx] (idx = data_021040ac.B6C). 1 if no handler; on a
 * truthy handler bump the B6C index, return 0. */
#include "ov004_core.h"
extern char data_021040ac[];
extern void *data_ov004_02209ac0[];

int func_ov004_021cb518(void) {
    int idx = *(int *)(data_021040ac + 0xb6c);
    int (*fn)(void) = (int (*)(void))data_ov004_02209ac0[idx];
    if (fn == 0)
        return 1;
    if (fn() != 0)
        *(int *)(data_021040ac + 0xb6c) = *(int *)(data_021040ac + 0xb6c) + 1;
    return 0;
}
