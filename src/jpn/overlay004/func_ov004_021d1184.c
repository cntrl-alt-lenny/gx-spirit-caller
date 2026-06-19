#include "ov004_core.h"
extern void func_0201ccc8(int a, void *b, int c);
extern void func_020371b8(int a, int b, int c, int d);
void func_ov004_021d1184(void) {
    short buf;
    *(int *)((char *)data_ov004_0220b2a0 + 72) = 1;
    *(int *)((char *)data_ov004_0220b2a0 + 84) = 4;
    buf = 10;
    func_0201ccc8(6, &buf, 2);
    func_020371b8(66, -1, 0, 1);
}
