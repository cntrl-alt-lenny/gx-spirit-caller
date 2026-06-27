/* CAMPAIGN-PREP candidate for func_021d45ec (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-then-compare reload of cf16c[idx]; cd73c[1]&1 reselect index; eor flag^1 for the other-player diff
 *   risk:       orig RELOADS cf16c[idx] after the store for the `< prev` test and recomputes (flag&1)*0x868 each use; if mwcc CSEs the index/value, the extra mul+ldr collapse and diverge. reshape-able (separate reads, no temp) but reg-alloc-finicky.
 *   confidence: med
 */
/* func_ov002_021d45ec (ov002, class C) — campaign-prep, UNVERIFIED.
 * flag from sign-bit; h2=h@2. 2-state on +0x810. State 0: post cmd 0x0d(flag,h2,0);
 * bump. State 1: poll 0x0d (busy->return). prev=cf16c[(flag&1)*0x868];
 * cf16c[(flag&1)*0x868]=h2; if (flag==cd73c[1] && h2<prev) func_021b0b54(0x36,1).
 * Then func_021b0bdc(0x13, cf16c[(cd73c[1]&1)*0x868]); diff = cf16c[(flag&1)*0x868]
 * - cf16c[((flag^1)&1)*0x868]; func_021b0bdc(0x14, diff); clear +0x80c. */
#include "ov002_core.h"

extern char data_ov002_022cf16c[];
extern char data_ov002_022cd73c[];
extern void func_ov002_021b0b54(int a, int b);
extern void func_ov002_021b0bdc(int a, int b);
extern int  func_ov002_0229c7f8(int cmd);

void func_ov002_021d45ec(void) {
    int flag;
    int st;
    int h2;
    int prev;
    int sel;
    flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    st = *(int *)(data_ov002_022ce950 + 0x810);
    h2 = *(u16 *)(data_ov002_022ce950 + 0x2);
    if (st == 0) {
        func_ov002_0229ade0(0xd, flag, h2, 0);
        *(int *)(data_ov002_022ce950 + 0x810) =
            *(int *)(data_ov002_022ce950 + 0x810) + 1;
        return;
    }
    if (st != 1)
        return;
    if (func_ov002_0229c7f8(0xd) != 0)
        return;
    prev = *(int *)(data_ov002_022cf16c + (flag & 1) * 0x868);
    *(int *)(data_ov002_022cf16c + (flag & 1) * 0x868) = h2;
    if (flag == *(int *)(data_ov002_022cd73c + 0x4)) {
        if (*(int *)(data_ov002_022cf16c + (flag & 1) * 0x868) < prev)
            func_ov002_021b0b54(0x36, 1);
    }
    sel = *(int *)(data_ov002_022cd73c + 0x4) & 1;
    func_ov002_021b0bdc(0x13, *(int *)(data_ov002_022cf16c + sel * 0x868));
    func_ov002_021b0bdc(0x14,
        *(int *)(data_ov002_022cf16c + (flag & 1) * 0x868) -
        *(int *)(data_ov002_022cf16c + ((flag ^ 1) & 1) * 0x868));
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
