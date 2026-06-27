/* CAMPAIGN-PREP candidate for func_02217374 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     +2 bitfields f12:2/f6:6/b0:1; ||-fold to .L_30 first; reload-per-access
 *   risk:       orig holds +2 in r3 across the f12 AND f6 extracts (1 ldrh); separate bitfield reads may emit 2 ldrh. reshape-able: bind u16 h=*(u16*)(self+2) and use (unsigned)(h<<18)>>30 / (h<<20)>>26.
 *   confidence: med
 */
/* func_ov002_02217374 (ov002, class D) — bitfield extracts on the +2 holder
 * (f12 @bit12:2, f6 @bit6:6, b0 @bit0:1) + guard chain + 3 sinks. */
#include "ov002_core.h"
extern int  func_ov002_021e276c(int a, int b, int c, int d);
extern int  func_ov002_021d5b80(int a, int b, int c, int d);
extern int  func_ov002_0221d288(void *self, int arg1);

struct Self02217374 {
    u16 f0;            /* +0 */
    u16 b0  : 1;       /* +2 bit0 */
    u16 _p1 : 5;
    u16 f6  : 6;       /* +2 bits[11:6] */
    u16 f12 : 2;       /* +2 bits[13:12] */
    u16 _p14 : 2;
};

int func_ov002_02217374(struct Self02217374 *arg0, int arg1) {
    if (arg0->f12 != 2 || arg0->f6 == 0x23) {
        func_ov002_021e276c(arg0->b0, arg0->f0, 1, 0);
        func_ov002_021ae400(arg0->b0, 0xa2);
        return 0;
    }
    if (*(int *)(data_ov002_022ce288 + 0x5a8) == 0x80) {
        func_ov002_021d5b80(arg0->b0, 0xb, arg0->f0, 0);
    }
    func_ov002_0221d288(arg0, arg1);
    return 0;
}
