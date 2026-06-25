/* CAMPAIGN-PREP candidate for func_022230b0 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain + byte-extract + 4-arg call with u16 self->f0
 *   risk:       021d94ac 4th arg (ldrh r3) order/presence guessed; ldrh scheduling vs movs
 *   confidence: high
 */
/* func_ov002_022230b0: guard-chain (df38/2576) + byte-extract; on pass call
 * 021d94ac(b0, b1, 1, *(u16*)self). Returns 0. */
#include "ov002_core.h"
extern int func_ov002_0223df38(void *a, int b, int c);
extern int func_ov002_0225764c(void *a, int b, int c);
extern void func_ov002_021d94ac(int b0, int b1, int c, int f0);

int func_ov002_022230b0(struct Ov002Self *arg0) {
    int ret, b0, b1;
    if (func_ov002_0223df38(arg0, 0, 0) == 0) goto end;
    ret = func_ov002_0223de94(arg0, 0);
    b0 = ret & 0xff;
    b1 = ((u16)ret >> 8) & 0xff;
    if (func_ov002_0225764c(arg0, b0, b1) == 0) goto end;
    func_ov002_021d94ac(b0, b1, 1, arg0->f0);
end:
    return 0;
}
