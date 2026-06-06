#include "ov004_core.h"
extern void func_0201cd1c(int a, void *b, int c);
extern void func_02037208(int a, int b, int c, int d);
extern void func_ov004_021d0530(int a);
void func_ov004_021d1360(void) {
    char *b = data_ov004_0220b500;
    short buf[2];
    buf[0] = 15;
    buf[1] = 1;
    func_0201cd1c(6, buf, 4);
    *(int *)((char *)data_ov004_0220e500 + 3188) = 1;
    func_02037208(58, -1, 0, 1);
    if (*(int *)(b + 68) != 0) {
        *(int *)(b + 84) = 16;
        return;
    }
    func_ov004_021d0530(223);
}
