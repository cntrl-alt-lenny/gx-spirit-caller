/* CAMPAIGN-PREP candidate for func_021d44cc (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     changed-bool gate + early b500[0x48]=1 store + 021c9d60 call + global-gate + rsbs==1 + store-order
 *   risk:       changed-bool `c` reg flip + global-gate materialize (unsteerable wall); early-store ordering inside if(c) ok; ~1 reg off
 *   confidence: low
 */
/* func_ov004_021d44cc: state handler. On unk38-changed, set b500+0x48=1 then
 * trigger SE via 021c9d60(0,0xE)->021d8798(lock,ret,4); then if the lock is
 * held, bail; else seed unk30 from (lock+8==1 ? 0x29 : 9), raise unk38,
 * reset unk3C. */
#include "ov004_core.h"
extern int func_ov004_021c9d60(int a, int b);
extern void func_ov004_021d8798(void *tag, int v, int n);

void func_ov004_021d44cc(void *rec) {
    char *p = rec;
    int c = 0;
    if (*(int *)(p + 0x38)) { *(int *)(p + 0x38) = 0; c = 1; }
    if (c) {
        *(int *)(data_ov004_0220b500 + 0x48) = 1;
        func_ov004_021d8798(data_ov004_022915e8, func_ov004_021c9d60(0, 0xE), 4);
    }
    if (*(int *)data_ov004_022915e8) return;
    if (*(int *)(data_ov004_022915e8 + 0x8) == 1) {
        *(int *)(p + 0x30) = 0x29;
    } else {
        *(int *)(p + 0x30) = 9;
    }
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3C) = 0;
}
