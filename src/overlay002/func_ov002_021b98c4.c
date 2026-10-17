typedef unsigned int u32;
typedef int s32;

typedef struct {
    u32 pad0[4];
    u32 count;
    u32 pad1[0x260 / 4 - 5];
    u32 entries[1];
} Ov2Side;

extern char data_ov002_022cf16c[];
extern u32 data_ov002_022cf17c[];

s32 func_ov002_021b98c4(s32 side, s32 id)
{
    u32 i = 0;
    u32 offs = (side & 1) * 0x868;

    if (i < *(u32 *)((char *)data_ov002_022cf17c + offs)) {
        Ov2Side *s = (Ov2Side *)(data_ov002_022cf16c + offs);
        u32 *p = s->entries;
        do {
            u32 v = *p;
            u32 hi = (v << 2) >> 24;
            u32 lo = (v << 18) >> 31;
            if (id == (s32)(hi * 2 + lo)) {
                return i;
            }
            i++;
            p++;
        } while (i < s->count);
    }
    return -1;
}
