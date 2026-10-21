#include "runtime/intrinsics.h"
extern unsigned char data_02101530[];
extern int func_020645e0(int a, int b, int c, unsigned char *buf, int len);

int func_020628b0(int a, int b, int c) {
    unsigned char buf[3];
    __memcpy(buf, data_02101530, 2);
    buf[2] = 0x68;
    return func_020645e0(a, b, c, buf, 3) != 0;
}
