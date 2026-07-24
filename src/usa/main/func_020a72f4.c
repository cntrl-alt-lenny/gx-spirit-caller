#include <nitro/types.h>

void *func_020a72f4(u8 *a0, s32 a1, s32 a2) {
    u8 target = (u8)a1;
    while (a2 != 0) {
        u8 c = *a0++;
        if (c == target) {
            return a0 - 1;
        }
        a2--;
    }
    return NULL;
}
