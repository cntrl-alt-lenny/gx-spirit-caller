/* CAMPAIGN-PREP candidate for func_02244fe4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: store-order preserved (cap clamp via if-assign movhi; strh buf in 0,2,4 order); arg1>>16 unsigned for lsr; tail cmp==3||4||0x17
 *   risk:       struct-guessed: many ce288 offsets (0x5cc/5d0/5d4/5d8/5dc/5fc/680..68c) inferred from the asm; mis-sized would break. Also tail cmp-chain (==3||4||0x17) may range-opt vs orig cmpne chain (reshape-able).
 *   confidence: low
 */
/* func_ov002_02244fe4 — log/queue a (id,payload) event into one of two ring
 * structures, then set a 4-word command block. Two early gates. */
typedef unsigned char  u8;
typedef unsigned short u16;

extern char data_ov002_022d016c[];   /* (_LIT0) +0xd0c gate, +0xcec index */
extern int  data_ov002_022cd744[];   /* (_LIT1) state table */
extern char data_ov002_022ce288[];   /* (_LIT2) ring + command block */
extern char data_ov002_022ce863[];   /* (_LIT3) byte ring */
extern int  data_ov002_022ce880[];   /* (_LIT4) word ring */
extern void func_ov002_021b1570(int a, int b, u16 *out, int kind);

int func_ov002_02244fe4(int arg0, int arg1) {
    u16 buf[3];
    int idx;
    int cap;
    if (*(int *)(data_ov002_022d016c + 0xd0c) != 0 &&
        data_ov002_022cd744[*(int *)(data_ov002_022d016c + 0xcec)] == 2) {
        buf[0] = (u16)arg0;
        buf[1] = (u16)arg1;
        buf[2] = (u16)((unsigned int)arg1 >> 16);
        func_ov002_021b1570(9, 9 - 0xa, buf, 6);
        return 0;
    }
    if (*(int *)(data_ov002_022ce288 + 0x5d8) != 0)
        return 0;
    if (*(int *)(data_ov002_022ce288 + 0x5cc) != 0) {
        idx = *(int *)(data_ov002_022ce288 + 0x5d4) + 1;
        if (idx > 0x20)
            idx = 0x20;
        *(int *)(data_ov002_022ce288 + 0x5d4) = idx;
        data_ov002_022ce863[*(int *)(data_ov002_022ce288 + 0x5d4)] = (u8)arg0;
        data_ov002_022ce880[*(int *)(data_ov002_022ce288 + 0x5d4)] = arg1;
    } else {
        *(int *)(data_ov002_022ce288 + 0x5d4) = 1;
        *(int *)(data_ov002_022ce288 + 0x5d0) += 1;
        data_ov002_022ce288[0x5dc] = (u8)arg0;
        *(int *)(data_ov002_022ce288 + 0x5fc) = arg1;
    }
    *(int *)(data_ov002_022ce288 + 0x684) = *(int *)(data_ov002_022d016c + 0xcec);
    *(int *)(data_ov002_022ce288 + 0x680) = 0;
    *(int *)(data_ov002_022ce288 + 0x688) = 1;
    *(int *)(data_ov002_022ce288 + 0x68c) = 0;
    if (arg0 == 3 || arg0 == 4 || arg0 == 0x17)
        *(int *)(data_ov002_022ce288 + 0x684) = 1 - *(int *)(data_ov002_022d016c + 0xcec);
    return 0;
}
