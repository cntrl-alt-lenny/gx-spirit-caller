#include "ov002_core.h"

extern int func_ov002_021b4160(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021bae7c(int arg0, int arg1, int arg2);
extern int func_ov002_021b3e5c(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
extern int func_ov002_021d5be0(int arg0, int arg1, int arg2, int arg3, int arg4);

int func_ov002_022647c8(int player) {
    int i = D016C->f_d28;

    if ((unsigned)i >= 2) {
        goto ret_one;
    }
    do {
        int xorVal = player ^ i;
        int r7 = func_ov002_021b4160(xorVal, 11, 0x14e2, 1);
        if (r7 > 0) {
            if (func_ov002_021bae7c(1 - xorVal, 0x178b, -1) == 0) {
                int a = func_ov002_021b3e5c(xorVal, 11, 0x14e2, 1);
                int b = func_ov002_021b3e5c(xorVal, 11, 0x14e2, 2);
                int prod = a * b;
                if (prod != 0) {
                    int packed = (xorVal << 31) & (int)0x80000000;
                    packed |= 0x0a5014e2;
                    func_ov002_021e30b4(packed, (u16)r7, prod);
                    func_ov002_021d5be0(xorVal, 11, 0x14e2, 2, 1);
                    return 0;
                }
            }
        }
        i = D016C->f_d28 + 1;
        D016C->f_d28 = i;
    } while ((unsigned)i < 2);
ret_one:
    return 1;
}
