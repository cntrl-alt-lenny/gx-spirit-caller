#include <nitro/types.h>

extern u8 data_0219dcb4[];

s32 func_0204b3d0(void) {
    u8 i = 0;
    do {
        if (data_0219dcb4[i * 12] == 0) {
            return (s32)(u8)(i + 0x64);
        }
        i = (u8)(i + 1);
    } while (i < 0x9a);
    return 0;
}
