#include "ov004_core.h"
extern char data_02104bac[];
extern int func_02006194(void);
extern int func_0200617c(void);
extern void func_0200612c(int *a, int *b);
extern void func_02006110(int *a, int *b);
extern void func_02037208(int a, int b, int c, int d);
int func_ov004_021cc3c0(void) {
    char *b = data_ov004_0220b500;
    int r = 0;
    int z, y, x;
    if (func_02006194() != 0 || func_0200617c() != 0) {
        func_0200612c(&z, &x);
        func_02006110(&z, &y);
        if (x < 32 && y < 30 && z >= 228 && z < 254) {
            r = 1;
            if (func_0200617c() != 0) {
                *(int *)(b + 72) = 11;
                func_02037208(66, -1, 0, r);
            }
        }
    } else if (*(unsigned short *)(data_02104bac + 84) & 2) {
        r = 1;
        *(int *)(b + 72) = 11;
        func_02037208(66, -1, 0, r);
    }
    return r;
}
