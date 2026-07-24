#include <nitro/types.h>

extern void func_02062530(void *);
extern s32 func_02061e88(void *);
extern void func_02064aa0(void *);

void func_020644c4(void *a0) {
    if (*(s32 *)((u8 *)a0 + 0x18) != 0) {
        return;
    }
    *(s32 *)((u8 *)a0 + 0x18) = 1;
    func_02062530(a0);
    if (func_02061e88(a0) == 0) {
        return;
    }
    func_02064aa0(a0);
}
