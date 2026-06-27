/* CAMPAIGN-PREP candidate for func_0221771c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit2 guard; player=(+8)&1; 3-way ce288 dispatch; cf178 mul-index gate
 *   risk:       orig tests 7e/7f/80 in order but lays the 0x80 body inline (fallthrough) FIRST, 7f/7e out-of-line. if-chain in source order likely reorders blocks. permuter-class (dispatch block placement).
 *   confidence: low
 */
/* func_ov002_0221771c (ov002, class D) — bit2 guard, player=(+8)&1, ce288+0x5a8
 * three-way dispatch (0x7e/0x7f/0x80), mul-index cf178[(player&1)*0x868] gate. */
#include "ov002_core.h"
extern int  func_ov002_0226ad5c(int a, int b, int c, int d);
extern int  func_ov002_0226af38(int a, int b, int c);

struct Self0221771c {
    u16 f0;            /* +0 */
    u16 b0  : 1;       /* +2 bit0 */
    u16 _p2 : 15;
    u16 _p4a : 2;      /* +4 bits[1:0] */
    u16 b2  : 1;       /* +4 bit2 */
    u16 _p4b : 13;
    u16 f8;            /* +8 */
};

int func_ov002_0221771c(struct Self0221771c *arg0) {
    int player = arg0->f8 & 1;
    int st;
    if (arg0->b2 != 0) return 0;
    st = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (st == 0x7e) {
        func_ov002_021e2c5c();
        return 0;
    }
    if (st == 0x7f) {
        func_ov002_0226ad5c(player, 1, 0, 1);
        return 0x7e;
    }
    if (st == 0x80) {
        if (*(int *)(data_ov002_022cf178 + (player & 1) * 0x868) == 0) return 0;
        func_ov002_021e2b3c();
        func_ov002_0226af38(player, 1, 1);
        return 0x7f;
    }
    return 0;
}
