#include <nitro/types.h>

void func_020672b4(u8 *a0, s32 a1) {
    s32 count = *(s32 *)(a0 + 0x100);
    if (count >= 0xfe) {
        return;
    }
    if (a1 < 1 || a1 > 0xfe) {
        return;
    }
    *(s32 *)(a0 + 0x100) = count + 1;
    a0[count] = (u8)a1;
}
