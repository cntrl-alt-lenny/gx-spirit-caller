/* CAMPAIGN-PREP candidate for func_021d42f8 (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     changed-bool gate + global-gate + rsbs==1 two-arm store-order
 *   risk:       changed-bool `c` reg-alloc (orig reuses r0) + global-gate materialize: documented unsteerable wall, likely 1 reg off
 *   confidence: low
 */
/* func_ov004_021d42f8: state handler. On unk38-changed, trigger SE via
 * 021c9d60(0,0x12)->021d8798(lock,ret,4); then if the lock is held, bail;
 * else seed unk30 from (lock+8==1 ? 0x29 : 6), raise unk38, reset unk3C. */
#include "ov004_core.h"
extern int func_ov004_021c9d60(int a, int b);
extern void func_ov004_021d8798(void *tag, int v, int n);

void func_ov004_021d42f8(void *rec) {
    char *p = rec;
    int c = 0;
    if (*(int *)(p + 0x38)) { *(int *)(p + 0x38) = 0; c = 1; }
    if (c) {
        func_ov004_021d8798(data_ov004_022915e8, func_ov004_021c9d60(0, 0x12), 4);
    }
    if (*(int *)data_ov004_022915e8) return;
    if (*(int *)(data_ov004_022915e8 + 0x8) == 1) {
        *(int *)(p + 0x30) = 0x29;
    } else {
        *(int *)(p + 0x30) = 6;
    }
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3C) = 0;
}
