/* CAMPAIGN-PREP candidate for func_02220340 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain + byte-extract + cmp-literal + 5-arg stacked call
 *   risk:       021d6808 4th/5th-arg count guessed from mov r3,#0 + str [sp]; scheduling
 *   confidence: high
 */
/* func_ov002_02220340: 2-guard chain (df38/2576), byte-extract a (b0,b1)
 * pair from 0223de94; if self->f0==0x1485 fire 021e2d94, then always
 * 021d6808(self,b0,b1,0,0). Returns 0. */
#include "ov002_core.h"
extern int func_ov002_0223df38(void *a, int b, int c);
extern int func_ov002_0225764c(void *a, int b, int c);
extern void func_ov002_021e2d94(int a, int b, int c, int d);
extern void func_ov002_021d6808(void *self, int b0, int b1, int d, int e);

int func_ov002_02220340(struct Ov002Self *arg0) {
    int ret, b0, b1;
    if (func_ov002_0223df38(arg0, 0, 0) == 0) goto end;
    ret = func_ov002_0223de94(arg0, 0);
    b0 = ret & 0xff;
    b1 = ((u16)ret >> 8) & 0xff;
    if (func_ov002_0225764c(arg0, b0, b1) == 0) goto end;
    if (arg0->f0 == 0x1485) {
        func_ov002_021e2d94(b0, b1, 0x15, 1);
    }
    func_ov002_021d6808(arg0, b0, b1, 0, 0);
end:
    return 0;
}
