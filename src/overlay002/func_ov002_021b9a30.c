typedef unsigned int u32;
typedef signed int s32;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf188[];

s32 func_ov002_021b9a30(u32 a, u32 b)
{
    u32 i;
    u32 off = (a & 1) * 0x868;
    char *base;
    u32 *p;

    i = 0;
    if (i < *(u32 *)(data_ov002_022cf188 + off)) {
        base = data_ov002_022cf16c + off;
        p = (u32 *)(base + 0x5d0);
        do {
            u32 w = *p;
            u32 hi = (w << 2) >> 24;
            u32 lo = (w << 18) >> 31;
            if (b == hi * 2 + lo) {
                return i;
            }
            i++;
            p++;
        } while (i < *(u32 *)(base + 0x1c));
    }
    return -1;
}
