/* CAMPAIGN-PREP candidate for func_02217638 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit2 guard; player=(+8)&1 plain; b0 bitfield; mul-index cf178 gate
 *   risk:       orig lays the 0x80 body inline (fallthrough) BEFORE the 0x7f block; the if(0x7f)-first source order may invert block placement. permuter-class (inline-vs-branch ordering, unsteerable by C form per brief 356/358).
 *   confidence: low
 */
/* func_ov002_02217638 (ov002, class D) — bit2 guard, player=(+8)&1, ce288+0x5a8
 * dispatch (0x7f/0x80), mul-index cf178[(1-b0)&1*0x868] table gate. */
#include "ov002_core.h"
extern char data_ov002_022d0e6c[];
extern int  func_ov002_021d7970(int a, int b, int c, int d);
extern int  func_ov002_0226ad5c(int a, int b, int c, int d);
extern int  func_ov002_0226af94(int a, int b, int c);

struct Self02217638 {
    u16 f0;            /* +0 */
    u16 b0  : 1;       /* +2 bit0 */
    u16 _p2 : 15;
    u16 _p4a : 2;      /* +4 bits[1:0] */
    u16 b2  : 1;       /* +4 bit2 */
    u16 _p4b : 13;
    u16 f8;            /* +8 */
};

int func_ov002_02217638(struct Self02217638 *arg0) {
    int player = arg0->f8 & 1;
    int st;
    if (arg0->b2 != 0) return 0;
    st = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (st == 0x7f) {
        int node = *(unsigned short *)(data_ov002_022d0e6c + 0xb0);
        func_ov002_021d7970(1 - arg0->b0, node, 1, arg0->b0);
        return 0;
    }
    if (st == 0x80) {
        if (player == arg0->b0) {
            func_ov002_0226ad5c(player, 1, 0, 0);
            return 0;
        }
        if (*(int *)(data_ov002_022cf178 + ((1 - arg0->b0) & 1) * 0x868) == 0) return 0;
        func_ov002_0226af94(arg0->b0, arg0->f0, 1);
        return 0x7f;
    }
    return 0;
}
