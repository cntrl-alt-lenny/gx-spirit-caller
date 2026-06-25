/* CAMPAIGN-PREP candidate for func_021d2f84 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     state dispatch; h2 kept live into post; counted loop, two 021afb90 fetches; shift-pack arg3; (cd73c+4) guard
 *   risk:       SOURCE ASM IS TRUNCATED (state-2 tail + loop-invariant r4=cd73c/r5=3 hoist cut off) plus the loop's reg-alloc (r8 i, r9 p1) is a coin-flip. permuter-class; tail also struct-guessed.
 *   confidence: low
 */
/* func_ov002_021d2f84 (ov002, class C) — campaign-prep, UNVERIFIED. PARTIAL:
 * the source asm is truncated mid state-2, so the state>=2 tail is reconstructed
 * conservatively (post cmd 0x23 path not fully visible).
 * flag from sign-bit. State 0: post cmd 0x41(flag,h2,0), bump. State 1: poll
 * 0x41; if busy return; post cmd 0x35(flag,h4,h6); for i in 0..h6-1 fetch two
 * records via func_021afb90(i) and feed func_021b1fe8; bump. State 2+: poll 0x35. */
#include "ov002_core.h"

extern char data_ov002_022cd73c[];
extern int *func_ov002_021afb90(int i);
extern void func_ov002_021b0c04(int a, int b);
extern void func_ov002_021b1fe8(int a, int b, char *tbl, int d);
extern int  func_ov002_0229c7f8(int cmd);

void func_ov002_021d2f84(void) {
    int flag;
    int st;
    u16 h2;
    u16 h4;
    u16 h6;
    int i;
    int *p1;
    int *p2;
    flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    st = *(int *)(data_ov002_022ce950 + 0x810);
    h2 = *(u16 *)(data_ov002_022ce950 + 0x2);
    h4 = *(u16 *)(data_ov002_022ce950 + 0x4);
    h6 = *(u16 *)(data_ov002_022ce950 + 0x6);
    if (st == 0) {
        func_ov002_0229ade0(0x41, flag, h2, 0);
        *(int *)(data_ov002_022ce950 + 0x810) =
            *(int *)(data_ov002_022ce950 + 0x810) + 1;
        return;
    }
    if (st == 1) {
        if (func_ov002_0229c7f8(0x41) != 0)
            return;
        func_ov002_0229ade0(0x35, flag, h4, h6);
        for (i = 0; i < h6; i++) {
            int a;
            int b;
            p1 = func_ov002_021afb90(i);
            p2 = func_ov002_021afb90(i);
            a = *p1 << 0x12;
            b = ((unsigned int)(*p2 << 2) >> 0x18) << 1;
            func_ov002_021b1fe8(h4, 3, data_ov002_022cd73c,
                                b + ((unsigned int)a >> 0x1f));
        }
        *(int *)(data_ov002_022ce950 + 0x810) =
            *(int *)(data_ov002_022ce950 + 0x810) + 1;
        return;
    }
    if (func_ov002_0229c7f8(0x35) != 0)
        return;
    if (flag == *(int *)(data_ov002_022cd73c + 0x4)) {
        func_ov002_021b0c04(0x23, 1);
    }
}
