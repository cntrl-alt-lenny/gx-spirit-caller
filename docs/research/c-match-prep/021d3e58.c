/* CAMPAIGN-PREP candidate for func_021d3e58 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     min-clamp as if-assign; Ov002Slot.id :13 bitfield (NOT mask); per-player+row index; n on stack via local
 *   risk:       asm truncated in state 1; the multiply chain (flag&1)*0x868 and h2*20 fed to several stores is reg-alloc heavy AND row addr is struct-guessed (offsets +0x30/+0x0). struct-guessed + permuter-class.
 *   confidence: low
 */
/* func_ov002_021d3e58 (ov002, class C) — campaign-prep, UNVERIFIED. PARTIAL:
 * asm truncated in state 1. flag from sign-bit; n=func_021b9dd4(flag,h2) clamped
 * by min(n,h@4) with n==0 also clamping to h@4. Read slot.id (:13 bitfield) at
 * cf16c+(flag&1)*0x868 + h2*20 + 0x30; if 0 clear +0x80c. Else 2-state on +0x810:
 * 0 builds a row, calls 021b212c + 021b1f20(...,n on stack) + posts cmd 0x26, bump;
 * 1 polls 0x26. One stack slot (sub sp,#4) holds n for the 021b1f20 stacked arg. */
#include "ov002_core.h"

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a6[];
extern int  func_ov002_021b9dd4(int flag, int h2);
extern void func_ov002_021b1f20(int flag, int h2, int k, int n);
extern void func_ov002_021b212c(int v, char *tbl, int one);
extern int  func_ov002_0229c7f8(int cmd);

void func_ov002_021d3e58(void) {
    int flag;
    int h2;
    int n;
    char *row;
    flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    h2 = *(u16 *)(data_ov002_022ce950 + 0x2);
    n = func_ov002_021b9dd4(flag, h2);
    if (n == 0 || n > *(u16 *)(data_ov002_022ce950 + 0x4))
        n = *(u16 *)(data_ov002_022ce950 + 0x4);
    row = data_ov002_022cf16c + (flag & 1) * 0x868 + h2 * 0x14;
    if (((struct Ov002Slot *)(row + 0x30))->id == 0) {
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
        return;
    }
    if (*(int *)(data_ov002_022ce950 + 0x810) == 0) {
        func_ov002_021b212c(*(u16 *)row, data_ov002_022cf1a6, 1);
        func_ov002_021b1f20(flag, h2, 3, n);
        func_ov002_0229ade0(0x26, flag, h2, n);
        *(int *)(data_ov002_022ce950 + 0x810) =
            *(int *)(data_ov002_022ce950 + 0x810) + 1;
    } else if (*(int *)(data_ov002_022ce950 + 0x810) == 1) {
        if (func_ov002_0229c7f8(0x26) == 0)
            *(int *)(data_ov002_022ce950 + 0x80c) = 0;
    }
}
