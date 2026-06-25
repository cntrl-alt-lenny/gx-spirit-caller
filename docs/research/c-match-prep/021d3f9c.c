/* CAMPAIGN-PREP candidate for func_021d3f9c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dual mul-index with (flag&1) and ((1-flag)&1) strides; d=1/if-2 as if-assign; explicit store order
 *   risk:       store order: orig emits cf16c=0 then cf198=h2 then d016c.e0 then (cond) d016c.d00 then cd73c.228; mwcc -O4 may reschedule the two pool-based stores. reshape-able (keep statements ordered) but possibly permuter-class on the rsb/and pair.
 *   confidence: med
 */
/* func_ov002_021d3f9c (ov002, class C) — campaign-prep, UNVERIFIED.
 * flag from sign-bit; h2=h@2. 2-state on +0x810. State 0: if h2!=0xb post cmd
 * 0x30(flag,h2,0); always post cmd 0x0d(flag,0,0); bump. State 1: if h2!=0xb poll
 * 0x30 (busy->return). Then dual mul-index: cf16c[(flag&1)*0x868]=0;
 * cf198[((1-flag)&1)*0x868]=h2; d016c[0xe0]=1; d016c[0xd00]=(flag==cd73c[1])?2:1;
 * cd73c[0x228]=h2; clear +0x80c. */
#include "ov002_core.h"

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf198[];
extern char data_ov002_022d016c[];
extern char data_ov002_022cd73c[];
extern int  func_ov002_0229c7f8(int cmd);

void func_ov002_021d3f9c(void) {
    int flag;
    int st;
    int h2;
    int d;
    flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    st = *(int *)(data_ov002_022ce950 + 0x810);
    h2 = *(u16 *)(data_ov002_022ce950 + 0x2);
    if (st == 0) {
        if (h2 != 0xb)
            func_ov002_0229ade0(0x30, flag, h2, 0);
        func_ov002_0229ade0(0xd, flag, 0, 0);
        *(int *)(data_ov002_022ce950 + 0x810) =
            *(int *)(data_ov002_022ce950 + 0x810) + 1;
        return;
    }
    if (st == 1) {
        if (h2 != 0xb) {
            if (func_ov002_0229c7f8(0x30) != 0)
                return;
        }
        *(int *)(data_ov002_022cf16c + (flag & 1) * 0x868) = 0;
        *(int *)(data_ov002_022cf198 + ((1 - flag) & 1) * 0x868) = h2;
        *(int *)(data_ov002_022d016c + 0xe0) = 1;
        d = 1;
        if (flag == *(int *)(data_ov002_022cd73c + 0x4))
            d = 2;
        *(int *)(data_ov002_022d016c + 0xd00) = d;
        *(int *)(data_ov002_022cd73c + 0x228) = h2;
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
    }
}
