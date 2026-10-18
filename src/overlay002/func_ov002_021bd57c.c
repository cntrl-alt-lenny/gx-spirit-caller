typedef unsigned int u32;
typedef signed int s32;

typedef struct {
    u32 id : 13;
    u32 rest : 19;
} Entry;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf188[];
extern u32 func_0202b878(u32 a);

s32 func_ov002_021bd57c(u32 a, u32 b)
{
    u32 i;
    s32 n;
    u32 off = (a & 1) * 0x868;
    Entry *p;
    char *base;

    n = 0;
    i = 0;
    if (i < *(u32 *)(data_ov002_022cf188 + off)) {
        base = data_ov002_022cf16c + off;
        p = (Entry *)(base + 0x5d0);
        do {
            u32 r = func_0202b878(p->id);
            if (b == r) {
                n++;
            }
            p++;
        } while (++i < *(u32 *)(base + 0x1c));
    }
    return n;
}
