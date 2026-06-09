#include "ov004_core.h"
extern char data_02104bac[];
extern int func_02006194(void);
extern int func_0200617c(void);
extern int func_0202d9a0(void);
extern int func_0202c9a0(void);
extern int func_0202cdf8(void);
extern void func_0202ce24(void);
extern void func_0200612c(int *a, int *b);
extern void func_02006110(int *a, int *b);
void func_ov004_021d02f4(void) {
    char *b = data_ov004_0220b500;
    int P, Q, M, N;
    if (!func_0202d9a0()) return;
    if (!func_0202c9a0()) return;
    if (!func_0202cdf8()) return;
    if (*(unsigned short *)(data_02104bac + 84) & 0x800) {
        *(int *)(b + 15500) = 1;
        func_0202ce24();
        return;
    }
    if (func_02006194() == 0 && func_0200617c() == 0) return;
    func_0200612c(&P, &Q);
    func_02006110(&M, &N);
    if (!(Q < 20 && N < 20)) return;
    if (!(P >= 227 && M >= 227)) return;
    *(int *)(b + 15500) = 1;
    if (func_0200617c() == 0) return;
    func_0202ce24();
}
