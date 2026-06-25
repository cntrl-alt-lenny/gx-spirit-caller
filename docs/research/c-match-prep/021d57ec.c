/* CAMPAIGN-PREP candidate for func_021d57ec (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     flag-RMW (no bool) + materialized-bool-global guard + latch
 *   risk:       KNOWN WALL: exact twin of .s-shipped 021d4870; orig materializes movne#1/moveq#0/bxne, mwcc branches — unsteerable
 *   confidence: low
 */
/* func_ov004_021d57ec: leaf handler. Clear the unk38 edge flag; if the 022915e8
 * lock is set, return; else latch state 0x18. (Structural twin of 021d4870, which
 * ships as .s due to the materialized-bool-global codegen wall.) */
#include "ov004_core.h"

void func_ov004_021d57ec(void *rec) {
    char *p = rec;
    if (*(int *)(p + 0x38) != 0) *(int *)(p + 0x38) = 0;
    if (*(int *)data_ov004_022915e8 != 0) return;
    *(int *)(p + 0x30) = 0x18;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3c) = 0;
}
