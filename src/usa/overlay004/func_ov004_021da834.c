#include "ov004_core.h"
extern char data_02104acc[];
extern int func_02006178(void);
extern int func_02006160(void);
extern void func_02006110(int *a, int *b);
extern void func_020060f4(int *a, int *b);
extern void func_020371b8(int a, int b, int c, int d);
int func_ov004_021da834(void) {
    char *b = data_ov004_0220b2a0;
    int r = 0;
    int z, y, x;
    if (func_02006178() != 0 || func_02006160() != 0) {
        func_02006110(&z, &x);
        func_020060f4(&z, &y);
        if (x < 32 && y < 30 && z >= 228 && z < 254) {
            r = 1;
            if (func_02006160() != 0) {
                *(int *)(b + 72) = r;
                func_020371b8(66, -1, 0, r);
            }
        }
    } else if (*(unsigned short *)(data_02104acc + 84) & 2) {
        r = 1;
        *(int *)(b + 72) = r;
        func_020371b8(66, -1, 0, r);
    }
    return r;
}
