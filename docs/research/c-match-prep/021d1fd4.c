/* CAMPAIGN-PREP candidate for func_021d1fd4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     shifted-or operand-first (h2|(h4<<16)); packed held r5; bic = &~4 store-order; parity*0x868 slot; cmp-chain dispatch
 *   risk:       reshape-able: parity index `and r4,#1; mul r2,r1,0x868` then bic load/store — risk mwcc reorders the `ldr +0x810` (loaded early in orig, used late) or range-opts the st==0/1 chain. packed must survive across the c3d84 call (callee-saved) — should hold.
 *   confidence: med
 */
/* func_ov002_021d1fd4: 2-state. packed = h2 | (h4<<16). State 0: wait on
 * 0229c7f8(-1); store packed at d016c+0xce4; if 021c3d84(flag) post 0x10(flag);
 * then clear bit2 of cf288[parity*0x868] (bic #4) and bump +0x810. State 1:
 * wait on 0x10, then clear +0x80c. flag = ce950 sign bit; packed held in r5. */

extern char data_ov002_022ce950[];
extern char data_ov002_022cf288[];
extern char data_ov002_022d016c[];
extern int  func_ov002_021c3d84(int a);
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);
extern int  func_ov002_0229c7f8(int a);

void func_ov002_021d1fd4(void) {
    int flag = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    unsigned short h2 = *(unsigned short *)(data_ov002_022ce950 + 2);
    unsigned short h4 = *(unsigned short *)(data_ov002_022ce950 + 4);
    int st = *(int *)(data_ov002_022ce950 + 0x810);
    int packed = (int)h2 | ((int)h4 << 16);
    char *slot;

    if (st == 0) {
        if (func_ov002_0229c7f8(-1) != 0) return;
        *(int *)(data_ov002_022d016c + 0xce4) = packed;
        if (func_ov002_021c3d84(flag) != 0)
            func_ov002_0229ade0(0x10, flag, 0, 0);
        slot = data_ov002_022cf288 + (flag & 1) * 0x868;
        *(int *)slot = *(int *)slot & ~4;
        *(int *)(data_ov002_022ce950 + 0x810) = *(int *)(data_ov002_022ce950 + 0x810) + 1;
    } else if (st == 1) {
        if (func_ov002_0229c7f8(0x10) == 0)
            *(int *)(data_ov002_022ce950 + 0x80c) = 0;
    }
}
