#include "ov002_core.h"

extern int func_ov002_021b4120(int arg0, int arg1, int arg2);
extern int func_ov002_021b947c(void);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
extern void func_ov002_021d5b80(int arg0, int arg1, int arg2, int arg3);

int func_ov002_022648c8(int self) {
    if ((unsigned int)D016C->f_d28 >= 2) {
        goto done;
    }
    do {
        int xorVal = self ^ D016C->f_d28;
        int r4 = func_ov002_021b4120(xorVal, 0xb, 0x13a6);

        if (r4 > 0) {
            int callResult = func_ov002_021b947c();
            unsigned int byte1 = ((unsigned short)callResult >> 8) & 0xff;

            if (byte1 == 0xe) {
                unsigned int packed = (((unsigned int)xorVal << 31) & 0x80000000) | 0x0a4e13a6;
                func_ov002_021e30b4(packed, (unsigned short)r4, 0);
            }
            func_ov002_021d5b80(xorVal, 0xb, 0x13a6, 0);
            return 0;
        }
        D016C->f_d28 = D016C->f_d28 + 1;
    } while ((unsigned int)D016C->f_d28 < 2);

done:
    return 1;
}
