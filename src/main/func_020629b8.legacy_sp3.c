#include "runtime/intrinsics.h"
typedef struct {
    int f0;
    unsigned short f4;
    char _6[2];
    int f8;
    char _c[0x5a];
    unsigned short f66;
    char _68[0x20];
    int f88;
    int f8c;
    int f90;
} obj_02062280_t;
extern int func_02062280(obj_02062280_t *o, int a, int b);
extern void func_02064490(char *p, int idx, int hw);
extern unsigned char data_02101530[];

int func_020629b8(obj_02062280_t *o) {
    char buf[5];
    __memcpy(buf, data_02101530, 2);
    buf[2] = 0x64;
    func_02064490(buf, 3, o->f66);
    if (func_02062280(o, (int)buf, 5) == 0) {
        return 0;
    }
    o->f90 = 0;
    return 1;
}
