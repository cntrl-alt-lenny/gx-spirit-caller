#include "ov004_core.h"
extern void func_0201ccc8(int a, void *b, int c);
extern void func_020371b8(int a, int b, int c, int d);
void func_ov004_021d11d0(void) {
    short buf;
    *(int *)((char *)data_ov004_0220b2a0 + 156) = 1;
    *(int *)((char *)data_ov004_0220b2a0 + 72) = 7;
    buf = 11;
    func_0201ccc8(6, &buf, 2);
    *(int *)((char *)data_ov004_0220e2a0 + 3184) = 0;
    func_020371b8(58, -1, 0, 1);
}
