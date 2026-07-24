#include <nitro/types.h>

extern u8 data_021a9770[0x10];

void func_020a2ea8(void) {
    void *p = *(void **)(data_021a9770 + 0x4);
    *(u16 *)((u8 *)p + 0x400 + 0xb0) = 1;
    p = *(void **)(data_021a9770 + 0x4);
    *(u8 *)(data_021a9770 + 0xe) = *(u8 *)((u8 *)p + 0x4b4);
    *(u8 *)(data_021a9770 + 0xc) = 5;
}
