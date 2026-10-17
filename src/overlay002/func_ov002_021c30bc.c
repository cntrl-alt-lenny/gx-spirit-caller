typedef unsigned int u32;
typedef unsigned short u16;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf188[];
extern void func_ov002_021b91c4(void *dst, void *src);

int func_ov002_021c30bc(u32 a, u32 i)
{
    u32 off = (a & 1) * 0x868;

    if (i < *(u32 *)(data_ov002_022cf188 + off)) {
        u32 *arr;
        u32 *p;
        char *base;
        u32 n = *(u32 *)(data_ov002_022cf188 + off) - 1;
        *(u32 *)(data_ov002_022cf188 + off) = n;
        if (i < n) {
            base = data_ov002_022cf16c + off;
            arr = (u32 *)(base + 0x5d0);
            p = arr + i;
            do {
                func_ov002_021b91c4(p, arr + (i + 1));
                ((u16 *)(base + 0x788))[i] = ((u16 *)(base + 0x788))[i + 1];
                i++;
                p++;
            } while (i < *(u32 *)(base + 0x1c));
        }
        return 1;
    }
    return 0;
}
