/* CAMPAIGN-PREP candidate for func_021d55d8 (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     changed-bool flag-RMW + cmp-select-call + tail-call
 *   risk:       changed-bool reg-alloc may flip c onto a fresh reg vs orig's reused unk38 reg; otherwise clean
 *   confidence: med
 */
/* func_ov004_021d55d8: on the unk38 'changed' edge, run 021d6468(0), pick SE id 9
 * (if 0220b500.unk88==3) else 5 via 021c9d8c, then tail 02031d0c(rec). */
#include "ov004_core.h"
extern void func_ov004_021d6468(int a);
extern void func_ov004_021c9d8c(int id);
extern void func_02031d0c(void *rec);

void func_ov004_021d55d8(void *rec) {
    char *p = rec;
    int c = 0;
    if (*(int *)(p + 0x38) != 0) { *(int *)(p + 0x38) = 0; c = 1; }
    if (!c) return;
    func_ov004_021d6468(0);
    if (*(int *)(data_ov004_0220b500 + 0x88) == 3)
        func_ov004_021c9d8c(9);
    else
        func_ov004_021c9d8c(5);
    func_02031d0c(rec);
}
