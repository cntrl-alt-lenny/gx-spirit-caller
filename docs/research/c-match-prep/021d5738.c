/* CAMPAIGN-PREP candidate for func_021d5738 (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     changed-bool + materialized-bool-global guard + rsbs two-arm latch
 *   risk:       materialized-bool-global (if g!=0 return) wall: orig movne#1/moveq#0, mwcc branches direct; likely 1+ insn off
 *   confidence: low
 */
/* func_ov004_021d5738: on the unk38 edge post msg(0,0x16,4). If the 022915e8 lock
 * is set, return. Else if (1 - lock.unk8)==0 latch state 0x18; otherwise run
 * 0203268c/02033488 teardown, latch state 0x22 and run 021d7c00. */
#include "ov004_core.h"
extern int func_ov004_021c9d60(int a, int b);
extern void func_ov004_021d8798(void *tag, int v, int n);
extern void *func_0203268c(void);
extern void func_02033488(void);
extern void func_ov004_021d7c00(void);

void func_ov004_021d5738(void *rec) {
    char *p = rec;
    int c = 0;
    if (*(int *)(p + 0x38) != 0) { *(int *)(p + 0x38) = 0; c = 1; }
    if (c)
        func_ov004_021d8798(data_ov004_022915e8, func_ov004_021c9d60(0, 0x16), 4);
    if (*(int *)data_ov004_022915e8 != 0) return;
    if (*(int *)(data_ov004_022915e8 + 0x8) != 1) {
        func_0203268c();
        func_02033488();
        *(int *)(p + 0x30) = 0x22;
        *(int *)(p + 0x38) = 1;
        *(int *)(p + 0x3c) = 0;
        func_ov004_021d7c00();
        return;
    }
    *(int *)(p + 0x30) = 0x18;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3c) = 0;
}
