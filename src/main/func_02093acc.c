#include <nitro/types.h>

extern s32 data_021a66f8;
extern u16 data_021a66fc[9];

void func_02093acc(void) {
    s32 i;
    data_021a66f8 = 0;
    for (i = 0; i < 9; i++) {
        data_021a66fc[i] = 0;
    }
}
