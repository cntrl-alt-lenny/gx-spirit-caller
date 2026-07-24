#include <nitro/types.h>

typedef s32 (*Callback0219e3ec)(void *, s32);

extern void *data_0219e3ec;
extern s32 func_02046870(void *);

void func_020525dc(void *a0, void *a1) {
    Callback0219e3ec cb = *(Callback0219e3ec *)((u8 *)data_0219e3ec + 0x60c);
    if (cb == NULL) {
        return;
    }
    s32 result = func_02046870(a0);
    cb = *(Callback0219e3ec *)((u8 *)data_0219e3ec + 0x60c);
    cb(a1, result);
}
