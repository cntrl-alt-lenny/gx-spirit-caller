/* func_ov004_021ce904: set the active cursor (b500.22C) to arg0 (>=3 remaps via
 * 021ce9b8+3), broadcasting a (3, v) status packet + 02037208 toast on change. */
#include "ov004_core.h"
extern int func_ov004_021ce8d8(void);
extern void func_02034838(int a, void *buf, int n);
extern void func_020371b8(int a, int b, int c, int d);
void func_ov004_021ce904(int arg0) {
    char *b = data_ov004_0220b2a0;
    int v = arg0;
    if (arg0 < 0) return;
    if (arg0 >= 3) v = func_ov004_021ce8d8() + 3;
    if (*(int *)(b + 0x22C) == v) return;
    {
        unsigned short buf[2];
        buf[0] = 3;
        buf[1] = v;
        func_02034838(3, buf, 4);
        *(int *)(b + 0x22C) = v;
        func_020371b8(56, -1, 0, 1);
    }
}
