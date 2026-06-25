/* CAMPAIGN-PREP candidate for func_021d48bc (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     changed-bool gate + void call + unk3C++ unsigned-<8 guard + store-order
 *   risk:       changed-bool `c` reg flip (this IS the shipped-.s wall 021d48bc); counter post-inc value held in r0 ok; ~1 reg off
 *   confidence: low
 */
/* func_ov004_021d48bc: state handler. On unk38-changed, run 021d3c88(); then
 * bump unk3C and, while it stays below 8, return; once it reaches 8 seed
 * unk30=0x29, raise unk38, reset unk3C. */
#include "ov004_core.h"
extern void func_ov004_021d3c88(void);

void func_ov004_021d48bc(void *rec) {
    char *p = rec;
    int c = 0;
    if (*(int *)(p + 0x38)) { *(int *)(p + 0x38) = 0; c = 1; }
    if (c) {
        func_ov004_021d3c88();
    }
    *(int *)(p + 0x3C) += 1;
    if ((unsigned int)*(int *)(p + 0x3C) < 8) return;
    *(int *)(p + 0x30) = 0x29;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3C) = 0;
}
