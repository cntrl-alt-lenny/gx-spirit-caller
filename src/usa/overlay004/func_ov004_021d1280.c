#include "ov004_core.h"
extern void func_0201ccc8(int a, void *b, int c);
extern void func_020371b8(int a, int b, int c, int d);
extern void func_ov004_021d0450(int a);
void func_ov004_021d1280(void) {
    char *b = data_ov004_0220b2a0;
    short buf[2];
    buf[0] = 15;
    buf[1] = 1;
    func_0201ccc8(6, buf, 4);
    *(int *)((char *)data_ov004_0220e2a0 + 3188) = 1;
    func_020371b8(58, -1, 0, 1);
    if (*(int *)(b + 68) != 0) {
        *(int *)(b + 84) = 16;
        return;
    }
    func_ov004_021d0450(223);
}
