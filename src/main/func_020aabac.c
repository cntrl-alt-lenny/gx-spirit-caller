#include <nitro/types.h>

s32 func_020aabac(void *a0, s32 a1, s32 a2) {
    switch (a2) {
    case 0: {
        char *p = *(char **)a0;
        char c = *p;
        if (c == 0) {
            *(s32 *)((u8 *)a0 + 4) = 1;
            return -1;
        }
        *(char **)a0 = p + 1;
        return (u8)c;
    }
    case 1:
        if (*(s32 *)((u8 *)a0 + 4) == 0) {
            *(s32 *)a0 = *(s32 *)a0 - 1;
        } else {
            *(s32 *)((u8 *)a0 + 4) = 0;
        }
        return a1;
    case 2:
        return *(s32 *)((u8 *)a0 + 4);
    default:
        return 0;
    }
}
