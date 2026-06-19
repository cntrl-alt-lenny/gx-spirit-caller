#include "ov004_core.h"
extern char data_02104acc[];
extern int func_02006178(void);
extern int func_02006160(void);
extern int func_0202d94c(void);
extern int func_0202c94c(void);
extern int func_0202cda4(void);
extern void func_0202cdd0(void);
extern void func_02006110(int *a, int *b);
extern void func_020060f4(int *a, int *b);
void func_ov004_021d0214(void) {
    char *b = data_ov004_0220b2a0;
    int P, Q, M, N;
    if (!func_0202d94c()) return;
    if (!func_0202c94c()) return;
    if (!func_0202cda4()) return;
    if (*(unsigned short *)(data_02104acc + 84) & 0x800) {
        *(int *)(b + 15500) = 1;
        func_0202cdd0();
        return;
    }
    if (func_02006178() == 0 && func_02006160() == 0) return;
    func_02006110(&P, &Q);
    func_020060f4(&M, &N);
    if (!(Q < 20 && N < 20)) return;
    if (!(P >= 227 && M >= 227)) return;
    *(int *)(b + 15500) = 1;
    if (func_02006160() == 0) return;
    func_0202cdd0();
}
