#include "ov002_core.h"

extern int func_ov002_021b3e28(int a, int b, int c);
extern void func_ov002_021df6d4(int a, int b);
extern void func_ov002_021e104c(int a, int b);
extern void func_ov002_021d5b80(int a, int b, int c, int d);

int func_ov002_02256084(void) {
    int i;
    for (i = 0; i < 2; i++) {
        int v = D016C->f_cec ^ i;
        if (func_ov002_021b3e28(v, 11, 0x1a0b)) {
            func_ov002_021df6d4(v, 0x1a0b);
            func_ov002_021e104c(v, 1);
            func_ov002_021d5b80(v, 11, 11 + 0x1a00, 0);
            return 1;
        }
    }
    return 0;
}
