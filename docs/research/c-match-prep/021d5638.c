/* CAMPAIGN-PREP candidate for func_021d5638 (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     changed-bool + tst-flag bool-materialize + bic RMW + store-order epilogue
 *   risk:       two changed-bool/materialized-bool blocks: reg-alloc on c and on the tst-bool may flip vs orig
 *   confidence: low
 */
/* func_ov004_021d5638: on the unk38 edge post msg(0,0x17). If 020334c0 ctx live and
 * its +0xeb4 has bit 0x100, run 021d3d2c(rec,2) and clear that bit; then post
 * msg(0,0x18) and latch state 0x29. */
#include "ov004_core.h"
extern int func_ov004_021c9d60(int a, int b);
extern void func_ov004_021d8798(void *tag, int v, int n);
extern void *func_0203268c(void);
extern int func_020334c0(void);
extern void func_ov004_021d3d2c(void *rec, int flags);

void func_ov004_021d5638(void *rec) {
    char *p = rec;
    int c = 0;
    if (*(int *)(p + 0x38) != 0) { *(int *)(p + 0x38) = 0; c = 1; }
    if (c)
        func_ov004_021d8798(data_ov004_022915e8, func_ov004_021c9d60(0, 0x17), 0);
    func_0203268c();
    if (func_020334c0() == 0) return;
    if (*(int *)((char *)func_0203268c() + 0xeb4) & 0x100) {
        func_ov004_021d3d2c(rec, 2);
        {
            char *q = (char *)func_0203268c();
            *(int *)(q + 0xeb4) &= ~0x100;
        }
    }
    func_ov004_021d8798(data_ov004_022915e8, func_ov004_021c9d60(0, 0x18), 2);
    *(int *)(p + 0x30) = 0x29;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3c) = 0;
}
