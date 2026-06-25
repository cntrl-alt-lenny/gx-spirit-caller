/* CAMPAIGN-PREP candidate for func_021d49b4 (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     changed-bool gate + 021c9d60 call + global-gate + e500[0xCCC]=1 + two void calls + store-order
 *   risk:       changed-bool `c` reg flip + global-gate materialize (unsteerable wall); e500 store before the two calls ok; ~1 reg off
 *   confidence: low
 */
/* func_ov004_021d49b4: state handler. On unk38-changed, trigger SE via
 * 021c9d60(0,0x15)->021d8798(lock,ret,0x12); then if the lock is held, bail;
 * else set e500+0xCCC=1, run 0203268c()/02033488(), seed unk30=0x22, raise
 * unk38, reset unk3C. */
#include "ov004_core.h"
extern int func_ov004_021c9d60(int a, int b);
extern void func_ov004_021d8798(void *tag, int v, int n);
extern void func_0203268c(void);
extern void func_02033488(void);

void func_ov004_021d49b4(void *rec) {
    char *p = rec;
    int c = 0;
    if (*(int *)(p + 0x38)) { *(int *)(p + 0x38) = 0; c = 1; }
    if (c) {
        func_ov004_021d8798(data_ov004_022915e8, func_ov004_021c9d60(0, 0x15), 0x12);
    }
    if (*(int *)data_ov004_022915e8) return;
    *(int *)(data_ov004_0220e500 + 0xCCC) = 1;
    func_0203268c();
    func_02033488();
    *(int *)(p + 0x30) = 0x22;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3C) = 0;
}
