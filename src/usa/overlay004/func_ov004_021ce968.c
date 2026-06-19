/* func_ov004_021ce968: confirm/cancel the active cursor (b500.22C) — if a panel
 * is open (unk44), accept only value 2 (else reject 67); otherwise commit it
 * (>=3 remaps via 021ce9b8) and broadcast the (4, v) packet + 58 toast. */
#include "ov004_core.h"
extern int func_ov004_021ce8d8(void);
extern void func_02034838(int a, void *buf, int n);
extern void func_020371b8(int a, int b, int c, int d);
void func_ov004_021ce968(void) {
    char *b = data_ov004_0220b2a0;
    if (*(int *)(b + 0x44) != 0) {
        int v = *(int *)(b + 0x22C);
        if (v == 2) {
            unsigned short buf[2];
            *(int *)(b + 0x224) = 1;
            buf[0] = 4;
            buf[1] = v;
            func_02034838(3, buf, 4);
            *(int *)(b + 0x234) = 1;
            func_020371b8(58, -1, 0, 1);
        } else {
            func_020371b8(67, -1, 0, 1);
        }
    } else {
        unsigned short buf[2];
        int v;
        *(int *)(b + 0x224) = 1;
        v = *(int *)(b + 0x22C);
        if (v >= 3) {
            v = func_ov004_021ce8d8() + 3;
            *(int *)(b + 0x22C) = v;
        }
        buf[0] = 4;
        buf[1] = *(int *)(b + 0x22C);
        func_02034838(3, buf, 4);
        *(int *)(b + 0x234) = 1;
        func_020371b8(58, -1, 0, 1);
    }
}
