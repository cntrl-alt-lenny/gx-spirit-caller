#include "ov004_core.h"

extern int  func_ov004_021c9d60(int a, int b);
extern void func_ov004_021d8798(void *tag, int v, int n);

int func_ov004_021d4190(void *arg0) {
    int tmp;
    int flag;

    if (*(int *)((char *)arg0 + 0x38) != 0) {
        *(int *)((char *)arg0 + 0x38) = 0;
        flag = 1;
    } else {
        flag = 0;
    }
    if (flag) {
        tmp = func_ov004_021c9d60(0, 0xf);
        func_ov004_021d8798(data_ov004_022915e8, tmp, 4);
    }

    if (*(int *)data_ov004_022915e8 != 0) {
        flag = 1;
    } else {
        flag = 0;
    }
    if (flag) {
        return flag;
    }

    if (1 - *(int *)(data_ov004_022915e8 + 0x8) != 0) {
        *(int *)((char *)arg0 + 0x30) = 0xa;
        *(int *)((char *)arg0 + 0x38) = 1;
        *(int *)((char *)arg0 + 0x3c) = 0;
        return 0;
    }
    *(int *)((char *)arg0 + 0x30) = 0x29;
    *(int *)((char *)arg0 + 0x38) = 1;
    *(int *)((char *)arg0 + 0x3c) = 0;
    return 0;
}
