/* CAMPAIGN-PREP candidate for func_021de4d8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard + 1<<(idx) mask-test tail; sibling of matched 021de4b0
 *   risk:       SHIPS AS .s (reg-alloc wall): r4 holds mask and is reused for arg2; the r4/r5/r6 mirror is exactly why it resisted C
 *   confidence: low
 */
/* func_ov002_021de4d8: guard func_021c2084(self,arg1,arg2,1); if set, test bit
 * (arg2 + arg1*16) of mask returned by func_021de408(self,mask). Sibling of the
 * matched 021de4b0 but with a leading guard + 3 callee-saved regs. */
#include "ov002_core.h"

extern int func_ov002_021de408(int a, int mask);

int func_ov002_021de4d8(struct Ov002Self *self, int arg1, int arg2) {
    int mask;
    if (func_ov002_021c2084(self, arg1, arg2, 1) == 0)
        return 0;
    mask = 1 << (arg2 + arg1 * 16);
    return (func_ov002_021de408((int)self, mask) & mask) != 0;
}
