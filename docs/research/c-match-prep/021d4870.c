/* CAMPAIGN-PREP candidate for func_021d4870 (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     unconditional unk38-clear + materialized-bool-global guard + store-order (leaf, bx lr)
 *   risk:       global guard materializes movne#1/moveq#0; mwcc tends to branch direct (documented 021d4870 wall) -> flagged unsteerable
 *   confidence: low
 */
/* func_ov004_021d4870: tiny leaf state handler. Clear unk38 if set; if the
 * global lock is held, return; else seed unk30=0x29, raise unk38, reset unk3C.
 * Uses arg ptr directly (no frame). */
#include "ov004_core.h"

void func_ov004_021d4870(void *rec) {
    char *p = rec;
    if (*(int *)(p + 0x38)) *(int *)(p + 0x38) = 0;
    if (*(int *)data_ov004_022915e8) return;
    *(int *)(p + 0x30) = 0x29;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3C) = 0;
}
