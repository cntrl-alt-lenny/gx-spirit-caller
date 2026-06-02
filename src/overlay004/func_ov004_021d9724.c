/* func_ov004_021d9724: set the active cursor (b500.22C) to arg0, broadcasting a
 * (3, arg0) status packet + 02037208 toast on change. Sibling of 021ce9e4. */
#include "ov004_core.h"
extern void func_02034888(int a, void *buf, int n);
extern void func_02037208(int a, int b, int c, int d);
void func_ov004_021d9724(int arg0) {
    char *b = data_ov004_0220b500;
    if (arg0 < 0) return;
    if (*(int *)(b + 0x22C) == arg0) return;
    {
        unsigned short buf[2];
        buf[0] = 3;
        buf[1] = arg0;
        func_02034888(3, buf, 4);
        *(int *)(b + 0x22C) = arg0;
        func_02037208(56, -1, 0, 1);
    }
}
