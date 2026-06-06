#include "ov004_core.h"
extern char data_021040ac[];
extern void func_020124a4(int a, void *b);
extern void func_02034888(int a, void *b, int c);
int func_ov004_021d66f4(short arg0) {
    char buf[512];
    *(short *)buf = arg0;
    func_020124a4(*(int *)(data_021040ac + 3132), buf + 2);
    func_02034888(3, buf, 0x126);
    return 1;
}
