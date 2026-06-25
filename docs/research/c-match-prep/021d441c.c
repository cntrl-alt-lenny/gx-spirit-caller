/* CAMPAIGN-PREP candidate for func_021d441c (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     changed-bool gate + global-gate + rsbs==1 two-arm + two void tail calls + store-order
 *   risk:       changed-bool `c` reg flip + global-gate materialize (unsteerable wall); 021c9d60 arg order ok; ~1 reg off
 *   confidence: low
 */
/* func_ov004_021d441c: state handler. On unk38-changed, trigger SE via
 * 021c9d60(0,0x13)->021d8798(lock,ret,4); then if the lock is held, bail;
 * else if (lock+8 != 1) run 0203268c()/02033278() and seed unk30=0xA,
 * else seed unk30=4; raise unk38, reset unk3C. */
#include "ov004_core.h"
extern int func_ov004_021c9d60(int a, int b);
extern void func_ov004_021d8798(void *tag, int v, int n);
extern void func_0203268c(void);
extern void func_02033278(void);

void func_ov004_021d441c(void *rec) {
    char *p = rec;
    int c = 0;
    if (*(int *)(p + 0x38)) { *(int *)(p + 0x38) = 0; c = 1; }
    if (c) {
        func_ov004_021d8798(data_ov004_022915e8, func_ov004_021c9d60(0, 0x13), 4);
    }
    if (*(int *)data_ov004_022915e8) return;
    if (*(int *)(data_ov004_022915e8 + 0x8) == 1) {
        *(int *)(p + 0x30) = 4;
    } else {
        func_0203268c();
        func_02033278();
        *(int *)(p + 0x30) = 0xA;
    }
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3C) = 0;
}
