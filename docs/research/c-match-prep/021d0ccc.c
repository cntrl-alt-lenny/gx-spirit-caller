/* CAMPAIGN-PREP candidate for func_021d0ccc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: switch(state) for beq-to-body layout; parity-mul cf17c index; unsigned val for movcc; flag/packed held
 *   risk:       reshape-able: dispatch shape. Orig is cmp#0/beq;cmp#1/beq;ret (switch). If mwcc emits bne-skip with inline body, swap switch<->if/elseif. val<2 must stay unsigned to keep movcc/strcc.
 *   confidence: med
 */
/* func_ov002_021d0ccc (cls D): 2-way dispatch on state810; parity-mul lookup
 * into cf17c, post 0x13 / (021ba230 + 0x14). */
typedef unsigned short u16;
extern char data_ov002_022ce950[];
extern char data_ov002_022cf17c[];
extern char data_ov002_022d016c[];
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);
extern int  func_ov002_0229c7f8(int cmd);
extern void func_ov002_021ba230(int flag);

void func_ov002_021d0ccc(void) {
    int flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    int idx  = *(u16 *)(data_ov002_022ce950 + 2);
    int b    = *(u16 *)(data_ov002_022ce950 + 4);
    int state = *(int *)(data_ov002_022ce950 + 0x810);
    int packed = idx | (b << 16);
    switch (state) {
    case 0: {
        unsigned int val = *(unsigned int *)((char *)data_ov002_022cf17c + (flag & 1) * 0x868);
        if (val < 2) {
            *(int *)(data_ov002_022ce950 + 0x80c) = 0;
            return;
        }
        func_ov002_0229ade0(0x13, flag, 0, 0);
        *(int *)(data_ov002_022ce950 + 0x810) =
            *(int *)(data_ov002_022ce950 + 0x810) + 1;
        break;
    }
    case 1:
        if (func_ov002_0229c7f8(0x13) != 0)
            return;
        *(int *)(data_ov002_022d016c + 0xce4) = packed;
        func_ov002_021ba230(flag);
        func_ov002_0229ade0(0x14, flag, 0xd, 0);
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
        break;
    }
}
