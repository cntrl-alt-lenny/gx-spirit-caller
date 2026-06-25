/* CAMPAIGN-PREP candidate for func_022221dc (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain + byte-extract + tick calls + inner guard (goto-end shared epilogue)
 *   risk:       goto-end must branch to shared ret-0 (not inline movne#0); else identical
 *   confidence: high
 */
/* func_ov002_022221dc: guard-chain (df38/2576) + byte-extract; on pass call tick
 * 021e2b3c, then if 021de4d8(self,b0,b1) fire 021df818(self,b0,500); always
 * tick 021e2c5c. Returns 0. */
#include "ov002_core.h"
extern int func_ov002_0223df38(void *a, int b, int c);
extern int func_ov002_0225764c(void *a, int b, int c);
extern int func_ov002_021de4d8(void *a, int b, int c);
extern void func_ov002_021df818(void *a, int b, int c);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);

int func_ov002_022221dc(struct Ov002Self *arg0) {
    int ret, b0, b1;
    if (func_ov002_0223df38(arg0, 0, 0) == 0) goto end;
    ret = func_ov002_0223de94(arg0, 0);
    b0 = ret & 0xff;
    b1 = ((u16)ret >> 8) & 0xff;
    if (func_ov002_0225764c(arg0, b0, b1) == 0) goto end;
    func_ov002_021e2b3c();
    if (func_ov002_021de4d8(arg0, b0, b1) != 0) {
        func_ov002_021df818(arg0, b0, 0x1f4);
    }
    func_ov002_021e2c5c();
end:
    return 0;
}
