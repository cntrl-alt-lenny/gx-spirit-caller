/* CAMPAIGN-PREP candidate for func_021d4804 (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     changed-bool gate + 021c9d60 call + global-gate + tail call 021d4004
 *   risk:       changed-bool `c` reg flip + global-gate materialize: same shipped-.s wall family; tail call ok; ~1 reg off
 *   confidence: low
 */
/* func_ov004_021d4804: state handler. On unk38-changed, trigger SE via
 * 021c9d60(0,0x10)->021d8798(lock,ret,2); then if the lock is held, bail;
 * else hand off to 021d4004(rec). */
#include "ov004_core.h"
extern int func_ov004_021c9d60(int a, int b);
extern void func_ov004_021d8798(void *tag, int v, int n);
extern void func_ov004_021d4004(void *rec);

void func_ov004_021d4804(void *rec) {
    char *p = rec;
    int c = 0;
    if (*(int *)(p + 0x38)) { *(int *)(p + 0x38) = 0; c = 1; }
    if (c) {
        func_ov004_021d8798(data_ov004_022915e8, func_ov004_021c9d60(0, 0x10), 2);
    }
    if (*(int *)data_ov004_022915e8) return;
    func_ov004_021d4004(rec);
}
