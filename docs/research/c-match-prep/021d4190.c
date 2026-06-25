/* CAMPAIGN-PREP candidate for func_021d4190 (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     changed-bool flag-toggle + global guard + rsbs==1 select (ternary) + fields
 *   risk:       DOCUMENTED changed-bool WALL (reg 1-off); also `==1` may compile to cmp;beq not the orig rsbs r0,#1;beq, flipping the 0x29/0xa select codegen
 *   confidence: low
 */
/* func_ov004_021d4190: if unk38 was set, clear it and post status msg 15; then
 * unless the global lock is held, seed unk30 = (global[8]==1 ? 0x29 : 0xa),
 * raise unk38, reset unk3C. */
#include "ov004_core.h"
extern int func_ov004_021c9d60(int a, int b);
extern void func_ov004_021d8798(void *tag, int v, int n);

void func_ov004_021d4190(void *rec) {
    char *p = rec;
    int c = 0;
    if (*(int *)(p + 0x38) != 0) {
        *(int *)(p + 0x38) = 0;
        c = 1;
    }
    if (c)
        func_ov004_021d8798(data_ov004_022915e8, func_ov004_021c9d60(0, 0xf), 4);
    if (*(int *)data_ov004_022915e8 != 0)
        return;
    *(int *)(p + 0x30) = (*(int *)(data_ov004_022915e8 + 8) == 1) ? 0x29 : 0xa;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3c) = 0;
}
