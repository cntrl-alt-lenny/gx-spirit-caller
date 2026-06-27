/* CAMPAIGN-PREP candidate for func_02216fb8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-chain dispatch; movs ip;bmi -> signed idx>=0; per-player base+0x260+idx*4 pointer arg
 *   risk:       021ba294 result kept in ip across the next ldrh+mla while bit0 is re-extracted; the pointer is passed in r1 with r0/r2/r3 as leftovers, so 021d8288's true arity/arg-positions are guessed. struct-guessed.
 *   confidence: low
 */
/* func_ov002_02216fb8: dispatch on ce288+0x5a8. 0x64->021e286c. 0x6f->0226b054(!bit0).
 * 0x80: 021ba294(bit0,0x12e5); if >=0 index a per-player list (cf16c+0x868*bit0+0x260)
 * [idx], 021d8288 -> 0x64; if <0 021ae400(bit0,0x15)->0x6f. */
#include "ov002_core.h"
extern int  func_ov002_021ba294(int a, int b);
extern int  func_ov002_021e286c(int a);
extern void func_ov002_0226b054(int a);

int func_ov002_02216fb8(struct Ov002Self *arg0) {
    int st = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (st == 0x64) {
        func_ov002_021e286c(arg0->b0);
        return 0;
    }
    if (st == 0x6f) {
        func_ov002_0226b054(1 - arg0->b0);
        return 0x64;
    }
    if (st == 0x80) {
        int bit0 = arg0->b0;
        int idx = func_ov002_021ba294(bit0, 0x12e5);
        if (idx >= 0) {
            int *p = (int *)(data_ov002_022cf16c + (arg0->b0 & 1) * 0x868 + 0x260);
            if (func_ov002_021d8288(arg0->b0, (int)(p + idx), 0, 0) != 0) return 0x64;
            return 0;
        }
        func_ov002_021ae400(arg0->b0, 0x15);
        return 0x6f;
    }
    return 0;
}
