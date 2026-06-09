#include "ov004_core.h"
extern char data_02104bac[];
extern int func_02006194(void);
extern int func_0200617c(void);
extern void func_02006110(int *a, int *b);
extern void func_0201d370(void);
extern void func_02037208(int a, int b, int c, int d);
int func_ov004_021ceb6c(void) {
    char *b = data_ov004_0220b500;
    int r = 0;
    int c, a;
    if (*(int *)(b + 92) != 0) return r;
    if (*(int *)(b + 84) != 5) return r;
    if (*(int *)(b + 548) != 0) return r;
    if (func_02006194() != 0 || func_0200617c() != 0) {
        func_02006110(&c, &a);
        if (c >= 228 && c < 254 && a >= 2 && a < 30) {
            r = 1;
            if (func_0200617c() != 0) {
                func_0201d370();
                *(int *)(b + 100) = r;
                *(int *)(b + 72) = 0;
                func_02037208(66, -1, 0, r);
            }
        }
    } else if ((*(unsigned short *)(data_02104bac + 84) & 2) && *(int *)(b + 548) == 0) {
        r = 1;
        func_0201d370();
        *(int *)(b + 100) = r;
        *(int *)(b + 72) = 0;
        func_02037208(66, -1, 0, r);
    }
    return r;
}
