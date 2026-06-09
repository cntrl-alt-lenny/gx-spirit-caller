#include "ov004_core.h"
extern char data_02104bac[];
extern int func_02006194(void);
extern int func_0200617c(void);
extern void func_0200612c(int *a, int *b);
extern void func_02006110(int *a, int *b);
extern void func_ov004_021da91c(void);
int func_ov004_021da978(void) {
    char *b = data_ov004_0220b500;
    int r = 0;
    int z, y, x;
    if (func_02006194() != 0 || func_0200617c() != 0) {
        func_0200612c(&z, &x);
        func_02006110(&z, &y);
        if (x < 32 && y < 30 && z >= 36 && z < 193) {
            r = 1;
            *(int *)(b + 144) = r - 2;
            if (func_0200617c() != 0) {
                func_ov004_021da91c();
            }
        }
    } else {
        unsigned f = *(unsigned short *)(data_02104bac + 84);
        if ((f & 0x800) || ((f & 1) && *(int *)(b + 140) == 512)) {
            r = 1;
            *(int *)(b + 144) = r - 2;
            func_ov004_021da91c();
        }
    }
    return r;
}
