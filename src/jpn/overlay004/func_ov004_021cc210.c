#include "ov004_core.h"
extern char data_02104acc[];
extern int func_02006178(void);
extern int func_02006160(void);
extern void func_02006110(int *a, int *b);
extern void func_020060f4(int *a, int *b);
extern void func_ov004_021cbf34(void);
int func_ov004_021cc210(void) {
    char *b = data_ov004_0220b2a0;
    int r = 0;
    int z, y, x;
    if (func_02006178() != 0 || func_02006160() != 0) {
        func_02006110(&z, &x);
        func_020060f4(&z, &y);
        if (x < 32 && y < 30 && z >= 36 && z < 193) {
            r = 1;
            *(int *)(b + 144) = r - 2;
            if (func_02006160() != 0) {
                func_ov004_021cbf34();
            }
        }
    } else {
        unsigned f = *(unsigned short *)(data_02104acc + 84);
        if ((f & 0x800) || ((f & 1) && *(int *)(b + 140) == 512)) {
            r = 1;
            *(int *)(b + 144) = r - 2;
            func_ov004_021cbf34();
        }
    }
    return r;
}
