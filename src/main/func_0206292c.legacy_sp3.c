#include "runtime/intrinsics.h"
typedef struct {
    int f0;
    unsigned short f4;
    char _6[2];
    int f8;
    char _c[0x7c];
    int f88;
} obj_02062280_t;
extern int func_02062280(obj_02062280_t *o, int a, int b);
extern void func_02064490(char *p, int idx, int hw);
extern unsigned char data_02101530[];

int func_0206292c(obj_02062280_t *o, int a, int b) {
    char buf[7];
    int len = 0;
    __memcpy(buf, data_02101530, 2);
    buf[2] = 0x65;
    func_02064490(buf, 3, a);
    len += 5;
    if (a != b) {
        func_02064490(buf, len, b);
        len += 2;
    }
    if (func_02062280(o, (int)buf, len) == 0) {
        return 0;
    }
    return 1;
}

