/* CAMPAIGN-PREP candidate for func_021d552c (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     changed-bool flag-RMW + guard-chain + tail-setter
 *   risk:       changed-bool: orig reuses dead unk38 reg for c, mwcc may pick fresh reg (1 reg off, whole body)
 *   confidence: med
 */
/* func_ov004_021d552c: state handler. On the unk38 'changed' edge, fire SE 0xde
 * and post it via the 022915e8 lock tag; if 02046ac4 ok, run 021d62b8(0). Then if
 * 02046ae0 < 2 latch state 0x27; else if data_0220b500.unk78 set, flush 021d8cd0
 * and run 021d3a58(rec, 0x25, 0x78). */
#include "ov004_core.h"
extern int func_0202c0c0(int id);
extern void func_ov004_021d8798(void *tag, int v, int n);
extern int func_02046ac4(void);
extern int func_02046ae0(void);
extern void func_ov004_021d62b8(int a);
extern void func_ov004_021d8cd0(void *tag);
extern void func_ov004_021d3a58(void *rec, int a1, int a2);

void func_ov004_021d552c(void *rec) {
    char *p = rec;
    int c = 0;
    if (*(int *)(p + 0x38) != 0) { *(int *)(p + 0x38) = 0; c = 1; }
    if (c) {
        func_ov004_021d8798(data_ov004_022915e8, func_0202c0c0(0xde), 0);
        if (func_02046ac4() != 0) func_ov004_021d62b8(0);
    }
    if (func_02046ae0() >= 2) {
        if (*(int *)(data_ov004_0220b500 + 0x78) == 0) return;
        func_ov004_021d8cd0(data_ov004_022915e8);
        func_ov004_021d3a58(rec, 0x25, 0x78);
        return;
    }
    *(int *)(p + 0x30) = 0x27;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3c) = 0;
}
