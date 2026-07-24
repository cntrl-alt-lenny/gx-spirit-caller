#include <nitro/types.h>

extern s32 data_021a6618;
extern u16 data_021a661c[9];

void func_020939d8(void) {
    s32 i;
    data_021a6618 = 0;
    for (i = 0; i < 9; i++) {
        data_021a661c[i] = 0;
    }
}
