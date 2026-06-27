/* CAMPAIGN-PREP candidate for func_02217a24 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit2 guard; player/b0; cf178 mul-index two-arm gate; bit13 asym-shift; ret merge
 *   risk:       two 0x80 arms both return 0x7f — orig merges via b .L_1d0; mwcc may duplicate the epilogue. Plus 0x80-inline-first block ordering vs source. permuter-class (branch merge + dispatch placement); bit13 (*r<<18)>>31 asym-shift should hold.
 *   confidence: low
 */
/* func_ov002_02217a24 (ov002, class D) — bit2 guard, player=(+8)&1, ce288+0x5a8
 * dispatch; 0x80 splits on player==b0 (cf178 mul-index gate, two sinks merging
 * to ret 0x7f); 0x7f path: 021c93f0 -> bit13 -> 021d71e0/021e286c, ret 0x64. */
#include "ov002_core.h"
extern char data_ov002_022d0e6c[];
extern int *func_ov002_021c93f0(int a, int b, int c);
extern int  func_ov002_021d71e0(int a, int b, int c);
extern int  func_ov002_0226af94(int a, int b, int c);
extern int  func_ov002_0226afb4(int a, int b);

struct Self02217a24 {
    u16 f0;            /* +0 */
    u16 b0  : 1;       /* +2 bit0 */
    u16 _p2 : 15;
    u16 _p4a : 2;      /* +4 bits[1:0] */
    u16 b2  : 1;       /* +4 bit2 */
    u16 _p4b : 13;
    u16 f8;            /* +8 */
};

int func_ov002_02217a24(struct Self02217a24 *arg0) {
    int player = arg0->f8 & 1;
    int st;
    if (arg0->b2 != 0) return 0;
    st = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (st == 0x7f) {
        int node = *(unsigned short *)(data_ov002_022d0e6c + 0xb0);
        int *r = func_ov002_021c93f0(player, 0xb, node);
        int bit13 = (unsigned int)(*r << 18) >> 31;
        func_ov002_021d71e0(player, node, 1);
        func_ov002_021e286c(bit13);
        return 0x64;
    }
    if (st == 0x80) {
        int b0 = arg0->b0;
        if (player == b0) {
            if (*(int *)(data_ov002_022cf178 + (b0 & 1) * 0x868) == 0) return 0;
            func_ov002_0226afb4(b0, arg0->f0);
            return 0x7f;
        }
        if (*(int *)(data_ov002_022cf178 + ((1 - b0) & 1) * 0x868) == 0) return 0;
        func_ov002_0226af94(b0, arg0->f0, 1);
        return 0x7f;
    }
    return 0;
}
