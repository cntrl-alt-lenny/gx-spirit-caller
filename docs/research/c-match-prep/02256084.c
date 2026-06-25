/* CAMPAIGN-PREP candidate for func_02256084 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bounded(2) loop; eor key; guarded multi-sink; early return 1
 *   risk:       0x1a0b built as 0xb+0x1a00 (add-reuse) may not reproduce; d016c reload vs bind
 *   confidence: med
 */
/* func_ov002_02256084: for each of 2 sides, derive key = *(int*)(d016c+0xcec)
 * ^ side; if func_ov002_021b3e28(key,0xb,0x1a0b) holds, run the
 * df6d4/e104c/d5b80 sink trio and return 1. Return 0 if neither side fires. */
#include "ov002_core.h"
extern int func_ov002_021b3e28(int a, int b, int c);
extern int func_ov002_021df6d4(int a, int b);
extern int func_ov002_021e104c(int a, int b);
extern int func_ov002_021d5b80(int a, int b, int c, int d);

int func_ov002_02256084(void) {
    int i;
    for (i = 0; i < 2; i++) {
        int key = *(int *)((char *)data_ov002_022d016c + 0xcec) ^ i;
        if (func_ov002_021b3e28(key, 0xb, 0x1a0b) != 0) {
            func_ov002_021df6d4(key, 0x1a0b);
            func_ov002_021e104c(key, 1);
            func_ov002_021d5b80(key, 0xb, 0x1a0b, 0);
            return 1;
        }
    }
    return 0;
}
