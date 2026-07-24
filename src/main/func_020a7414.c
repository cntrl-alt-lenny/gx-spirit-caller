#include <nitro/types.h>

void *func_020a7414(u8 *a0, s32 a1, s32 a2) {
    u8 target = (u8)a1;
    u8 *p = a0 + a2;
    while (a2 != 0) {
        if (*--p == target) {
            return p;
        }
        a2--;
    }
    return NULL;
}
