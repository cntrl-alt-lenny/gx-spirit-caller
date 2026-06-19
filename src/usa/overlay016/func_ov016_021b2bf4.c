/* func_ov016_021b2bf4: release the record's live handle (unk90) if any, then
 * blank both engines' BG mode bits; return 1. */
#include "ov016_core.h"
extern void func_0201eee8(int a, void *b, void *c);
int func_ov016_021b2bf4(void *arg0) {
    char *p = arg0;
    if (*(int *)(p + 144) != 0) {
        func_0201eee8(*(int *)(p + 20), p + 28, p + 144);
        *(int *)(p + 148) = 0;
        *(int *)(p + 144) = 0;
    }
    *(int *)0x04000000 &= ~7936;
    *(int *)0x04001000 &= ~7936;
    return 1;
}
