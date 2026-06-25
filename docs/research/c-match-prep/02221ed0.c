/* CAMPAIGN-PREP candidate for func_02221ed0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two stacked guard-chains + byte-extract (proven 0223a87c twin)
 *   risk:       nested-if vs goto may change guard branch targets; otherwise byte-identical idiom
 *   confidence: high
 */
/* func_ov002_02221ed0: two sequential guard-chains (idx 0 then 1); each on full
 * pass byte-extracts (b0,b1) and fires a final 3-arg call (021de9d4 / 021de910).
 * Returns 0. */
#include "ov002_core.h"
extern int func_ov002_0223df38(void *a, int b, int c);
extern int func_ov002_0225764c(void *a, int b, int c);
extern void func_ov002_021de9d4(void *a, int b, int c);
extern void func_ov002_021de910(void *a, int b, int c);

int func_ov002_02221ed0(struct Ov002Self *arg0) {
    int ret, b0, b1;
    if (func_ov002_0223df38(arg0, 0, 0) != 0) {
        ret = func_ov002_0223de94(arg0, 0);
        b0 = ret & 0xff;
        b1 = ((u16)ret >> 8) & 0xff;
        if (func_ov002_0225764c(arg0, b0, b1) != 0) {
            func_ov002_021de9d4(arg0, b0, b1);
        }
    }
    if (func_ov002_0223df38(arg0, 1, 0) != 0) {
        ret = func_ov002_0223de94(arg0, 1);
        b0 = ret & 0xff;
        b1 = ((u16)ret >> 8) & 0xff;
        if (func_ov002_0225764c(arg0, b0, b1) != 0) {
            func_ov002_021de910(arg0, b0, b1);
        }
    }
    return 0;
}
