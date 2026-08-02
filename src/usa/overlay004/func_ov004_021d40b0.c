#include "ov004_core.h"

extern int  func_ov004_021c9c80(int a, int b);
extern void func_ov004_021d86ac(void *tag, int v, int n);

int func_ov004_021d40b0(void *arg0) {
    int tmp;
    int flag;

    if (*(int *)((char *)arg0 + 0x38) != 0) {
        *(int *)((char *)arg0 + 0x38) = 0;
        flag = 1;
    } else {
        flag = 0;
    }
    if (flag) {
        tmp = func_ov004_021c9c80(0, 0xf);
        func_ov004_021d86ac(data_ov004_02291388, tmp, 4);
    }

    if (*(int *)data_ov004_02291388 != 0) {
        flag = 1;
    } else {
        flag = 0;
    }
    if (flag) {
        return flag;
    }

    if (1 - *(int *)(data_ov004_02291388 + 0x8) != 0) {
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
