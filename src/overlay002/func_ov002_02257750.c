typedef unsigned int u32;
typedef int s32;

extern char data_ov002_022cf16c[];

u32 func_ov002_02257750(void *ctx, s32 (*cb)(void *, s32, s32))
{
    u32 result = 0;
    s32 i = 0;
    s32 j;
    s32 shift = 0;
    char *p;

    for (; i < 2; i++) {
        p = data_ov002_022cf16c + (i & 1) * 0x868;
        j = 0;
        for (; j <= 10; j++) {
            if (((*(u32 *)(p + 0x40) >> 2) & 1) == 0) {
                if (cb(ctx, i, j) != 0) {
                    result |= 1 << (j + shift);
                }
            }
            p += 0x14;
        }
        shift += 16;
    }
    return result;
}
