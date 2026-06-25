/* CAMPAIGN-PREP candidate for func_02040de8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop over 0x20 stride-8 table; +0x1000 field; recompute base each iter
 *   risk:       i<<3 must lower to add r0,base,r4,lsl#3 (not strength-reduced to a pointer bump) — risk it bumps; signed blt
 *   confidence: med
 */
#include "types.h"

extern int func_020aaf40(void *arg1);

void *func_02040de8(void *base, void *arg1)
{
    int i;
    for (i = 0; i < 0x20; i++) {
        if (*(int *)((char *)base + (i << 3) + 0x1000 + 0xa34) == 0) {
            return 0;
        }
        if (func_020aaf40(arg1) == 0) {
            return *(void **)((char *)base + (i << 3) + 0x1000 + 0xa38);
        }
    }
    return 0;
}
