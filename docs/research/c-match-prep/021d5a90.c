/* CAMPAIGN-PREP candidate for func_021d5a90 (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     changed-bool + materialized-bool-global guard + cmp-select-call + tail-call
 *   risk:       materialized-bool-global guard (if g!=0 return via movne/moveq) likely diverges; plus changed-bool reg-alloc
 *   confidence: low
 */
/* func_ov004_021d5a90: on the unk38 edge run 0203473c. If the 022915e8 lock is
 * set, return. Else run 021d6468(0), pick SE id 0xa (if 0220e500.unkccc set) else
 * 0xb via 021c9d8c, then tail 02031d0c(rec). */
#include "ov004_core.h"
extern void func_0203473c(void);
extern void func_ov004_021d6468(int a);
extern void func_ov004_021c9d8c(int id);
extern void func_02031d0c(void *rec);

void func_ov004_021d5a90(void *rec) {
    char *p = rec;
    int c = 0;
    if (*(int *)(p + 0x38) != 0) { *(int *)(p + 0x38) = 0; c = 1; }
    if (c) func_0203473c();
    if (*(int *)data_ov004_022915e8 != 0) return;
    func_ov004_021d6468(0);
    if (*(int *)(data_ov004_0220e500 + 0xccc) != 0)
        func_ov004_021c9d8c(0xa);
    else
        func_ov004_021c9d8c(0xb);
    func_02031d0c(rec);
}
