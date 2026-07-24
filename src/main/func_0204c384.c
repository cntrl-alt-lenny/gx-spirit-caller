#include <nitro/types.h>

extern void *func_020498f0(void);
extern s32 func_0204b280(s32);

s32 func_0204c384(s32 *a0, u32 a1) {
    if (*(u8 *)((u8 *)func_020498f0() + 0x1a6) != 0) {
        if (*(s32 *)((u8 *)func_020498f0() + 0x1a0) == 4) {
            return 1;
        }
    }
    u32 i;
    for (i = 0; i < a1; i++) {
        if (func_0204b280(a0[i]) == 0) {
            return 0;
        }
        if (*(u8 *)((u8 *)func_020498f0() + 0x1a6) != 0) {
            if (*(s32 *)((u8 *)func_020498f0() + 0x1a0) == 1) {
                return 1;
            }
        }
    }
    return 1;
}
