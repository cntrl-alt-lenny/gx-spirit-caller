#include <nitro/types.h>

extern void *func_0204987c(void);
extern s32 func_0204b20c(s32);

s32 func_0204c310(s32 *a0, u32 a1) {
    if (*(u8 *)((u8 *)func_0204987c() + 0x19e) != 0) {
        if (*(s32 *)((u8 *)func_0204987c() + 0x198) == 4) {
            return 1;
        }
    }
    u32 i;
    for (i = 0; i < a1; i++) {
        if (func_0204b20c(a0[i]) == 0) {
            return 0;
        }
        if (*(u8 *)((u8 *)func_0204987c() + 0x19e) != 0) {
            if (*(s32 *)((u8 *)func_0204987c() + 0x198) == 1) {
                return 1;
            }
        }
    }
    return 1;
}
