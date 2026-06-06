#include "ov004_core.h"
extern void func_0201cd1c(int a, void *b, int c);
extern void func_02037208(int a, int b, int c, int d);
void func_ov004_021d12b0(void) {
    short buf;
    *(int *)((char *)data_ov004_0220b500 + 156) = 1;
    *(int *)((char *)data_ov004_0220b500 + 72) = 7;
    buf = 11;
    func_0201cd1c(6, &buf, 2);
    *(int *)((char *)data_ov004_0220e500 + 3184) = 0;
    func_02037208(58, -1, 0, 1);
}
