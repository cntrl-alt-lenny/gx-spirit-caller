#include "ov004_core.h"
extern void func_0201cd1c(int a, void *b, int c);
extern void func_02037208(int a, int b, int c, int d);
void func_ov004_021d1264(void) {
    short buf;
    *(int *)((char *)data_ov004_0220b500 + 72) = 1;
    *(int *)((char *)data_ov004_0220b500 + 84) = 4;
    buf = 10;
    func_0201cd1c(6, &buf, 2);
    func_02037208(66, -1, 0, 1);
}
