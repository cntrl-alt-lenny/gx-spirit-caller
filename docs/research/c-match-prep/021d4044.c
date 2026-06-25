/* CAMPAIGN-PREP candidate for func_021d4044 (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     changed-bool flag-toggle + materialized-bool global guard + store-order fields
 *   risk:       DOCUMENTED WALL (ov004_core.h brief 318): orig reuses dead unk38 reg for c, mwcc picks fresh reg (1 off); global guard branches direct vs movne/moveq materialize
 *   confidence: low
 */
/* func_ov004_021d4044: if the record's unk38 was set, clear it and post status
 * msg 13; then unless the global lock is held, seed unk30=1, raise unk38,
 * reset unk3C. */
#include "ov004_core.h"
extern int func_ov004_021c9d60(int a, int b);
extern void func_ov004_021d8798(void *tag, int v, int n);

void func_ov004_021d4044(void *rec) {
    char *p = rec;
    int c = 0;
    if (*(int *)(p + 0x38) != 0) {
        *(int *)(p + 0x38) = 0;
        c = 1;
    }
    if (c)
        func_ov004_021d8798(data_ov004_022915e8, func_ov004_021c9d60(0, 0xd), 0x12);
    if (*(int *)data_ov004_022915e8 != 0)
        return;
    *(int *)(p + 0x30) = 1;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3c) = 0;
}
