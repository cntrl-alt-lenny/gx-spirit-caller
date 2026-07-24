#include <nitro/types.h>

extern void func_020624bc(void *);
extern s32 func_02061e14(void *);
extern void func_02064a2c(void *);

void func_02064450(void *a0) {
    if (*(s32 *)((u8 *)a0 + 0x18) != 0) {
        return;
    }
    *(s32 *)((u8 *)a0 + 0x18) = 1;
    func_020624bc(a0);
    if (func_02061e14(a0) == 0) {
        return;
    }
    func_02064a2c(a0);
}
