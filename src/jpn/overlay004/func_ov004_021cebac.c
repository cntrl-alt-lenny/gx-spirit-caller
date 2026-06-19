#include "ov004_core.h"
extern char data_02104acc[];
extern int func_02006178(void);
extern int func_02006160(void);
extern void func_020060f4(int *a, int *b);
extern void func_0201d31c(void);
extern void func_020371b8(int a, int b, int c, int d);
int func_ov004_021cebac(void) {
    char *b = data_ov004_0220b2a0;
    int r = 0;
    int c, a;
    if (*(int *)(b + 92) != 0) return r;
    if (func_02006178() != 0 || func_02006160() != 0) {
        func_020060f4(&c, &a);
        if (c >= 224 && c < 250 && a >= 164 && a < 190) {
            r = 1;
            if (func_02006160() != 0) {
                func_0201d31c();
                *(int *)(b + 100) = r;
                *(int *)(b + 72) = 0;
                func_020371b8(66, -1, 0, r);
            }
        }
    } else if (*(unsigned short *)(data_02104acc + 84) & 2) {
        r = 1;
        func_0201d31c();
        *(int *)(b + 100) = r;
        *(int *)(b + 72) = 0;
        func_020371b8(66, -1, 0, r);
    }
    return r;
}
