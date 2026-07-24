#include <nitro/types.h>

extern void func_020964b8(void *, s32);

void func_02096f80(void *a0, s32 a1) {
    u8 *p = (u8 *)a0;
    *(s32 *)(p + 0xc) = *(s32 *)(p + 0xc) | 0x4;
    *(s32 *)(p + 0x30) = *(s32 *)(p + 0x8);
    *(s32 *)(p + 0x38) = 0;
    *(u16 *)(p + 0x36) = 0;
    *(u16 *)(p + 0x34) = (u16)a1;
    func_020964b8(a0, 2);
}
