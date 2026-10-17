#include "ov002_core.h"

extern int func_ov002_021b9ecc(int a, int b);

int func_ov002_0227dd6c(int arg0, int (*fn)(int)) {
    int i;
    int count;
    u8 *p = data_ov002_022cf16c + (arg0 & 1) * 0x868;

    for (i = count = 0; i < 5; i++, p += 0x14) {
        u32 w = *(u32 *)(p + 0x40);
        u16 h = *(u16 *)(p + 0x38);
        if (h & ~((w >> 6) & 1) & ~(((w >> 1) | (w >> 2)) & 1)) {
            if (fn(func_ov002_021b9ecc(arg0, i)) != 0) {
                count++;
            }
        }
    }
    return count;
}
