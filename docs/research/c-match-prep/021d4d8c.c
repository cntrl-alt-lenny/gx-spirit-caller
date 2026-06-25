/* CAMPAIGN-PREP candidate for func_021d4d8c (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     changed-bool gate + 0202c0c0(0x66b) call + global-gate + store-order
 *   risk:       changed-bool `c` reg flip + global-gate materialize: this IS shipped-.s wall 021d4d8c; expect 1 reg off
 *   confidence: low
 */
/* func_ov004_021d4d8c: state handler. On unk38-changed, play SE
 * 0202c0c0(0x66b) -> 021d8798(lock,ret,0x12); then if the lock is held, bail;
 * else seed unk30=0x18, raise unk38, reset unk3C. */
#include "ov004_core.h"
extern int func_0202c0c0(int id);
extern void func_ov004_021d8798(void *tag, int v, int n);

void func_ov004_021d4d8c(void *rec) {
    char *p = rec;
    int c = 0;
    if (*(int *)(p + 0x38)) { *(int *)(p + 0x38) = 0; c = 1; }
    if (c) {
        func_ov004_021d8798(data_ov004_022915e8, func_0202c0c0(0x66b), 0x12);
    }
    if (*(int *)data_ov004_022915e8) return;
    *(int *)(p + 0x30) = 0x18;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3C) = 0;
}
