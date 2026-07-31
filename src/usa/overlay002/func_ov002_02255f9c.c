#include "ov002_core.h"

extern int func_ov002_021b3d48(int a, int b, int c);
extern void func_ov002_021df5e4(int a, int b);
extern void func_ov002_021e0f5c(int a, int b);
extern void func_ov002_021d5a90(int a, int b, int c, int d);

int func_ov002_02255f9c(void) {
    int i;
    for (i = 0; i < 2; i++) {
        int v = D016C->f_cec ^ i;
        if (func_ov002_021b3d48(v, 11, 0x1a0b)) {
            func_ov002_021df5e4(v, 0x1a0b);
            func_ov002_021e0f5c(v, 1);
            func_ov002_021d5a90(v, 11, 11 + 0x1a00, 0);
            return 1;
        }
    }
    return 0;
}
