/* CAMPAIGN-PREP candidate for func_021cfad0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ternary sign-flag (movne;moveq); cmp-chain dispatch via if/else; early-return on wait!=0; reload base each arm
 *   risk:       reshape-able: state cmp-chain (cmp#0/#1/#2 sequential) — mwcc may emit a jump-table/range-opt instead of 3 cmps; if so, force with explicit early returns or keep else-if. h2 held in r4 across the switch (callee-saved) should match.
 *   confidence: med
 */
/* func_ov002_021cfad0: 3-state sequencer keyed on ce950+0x810. Reads flag@0 and
 * h2@2 up front. State 0 posts 0x43(flag,h2) and bumps the counter; state 1
 * waits on 0x43 then posts 0x20((flag&1)|0x20, h2); state 2 waits on 0x20 then
 * clears +0x80c. */

extern char data_ov002_022ce950[];
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);
extern int  func_ov002_0229c7f8(int a);

void func_ov002_021cfad0(void) {
    int flag = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    int st = *(int *)(data_ov002_022ce950 + 0x810);
    unsigned short h2 = *(unsigned short *)(data_ov002_022ce950 + 2);

    if (st == 0) {
        func_ov002_0229ade0(0x43, flag, h2, 0);
        *(int *)(data_ov002_022ce950 + 0x810) = *(int *)(data_ov002_022ce950 + 0x810) + 1;
    } else if (st == 1) {
        if (func_ov002_0229c7f8(0x43) != 0) return;
        func_ov002_0229ade0(0x20, (flag & 1) | 0x20, h2, 0);
        *(int *)(data_ov002_022ce950 + 0x810) = *(int *)(data_ov002_022ce950 + 0x810) + 1;
    } else if (st == 2) {
        if (func_ov002_0229c7f8(0x20) == 0)
            *(int *)(data_ov002_022ce950 + 0x80c) = 0;
    }
}
