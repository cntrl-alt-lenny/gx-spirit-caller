typedef int s32;

extern char data_ov002_022ce288[];
extern s32 func_ov002_0220dd34(s32 a, s32 b);

s32 func_ov002_0220ddf4(s32 a, s32 b)
{
    if (*(s32 *)(data_ov002_022ce288 + 0x484) + 1 < 3) {
        return 0;
    }
    return func_ov002_0220dd34(a, b) != 0;
}
