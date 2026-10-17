typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef int s32;

typedef struct {
    u16 pad0;
    u16 f0 : 1;
    u16 f1 : 5;
    u16 f2 : 10;
    u16 g0 : 6;
    u16 g1 : 9;
    u16 g2 : 1;
    u16 pad6[9];
} Entry;

extern u8 data_ov002_022ce288[];
extern Entry data_ov002_022ce588[];

u32 func_ov002_02253748(u32 x, u32 y, u32 z)
{
    s32 i = 0;
    Entry *p;
    s32 n = *(s32 *)(data_ov002_022ce288 + 0x480);
    u32 m;
    u32 j;
    Entry *q;

    if (n > 0) {
        p = data_ov002_022ce588;
        do {
            if (x == p->f0 && y == p->f1 && z == p->g1) return 1;
            i++;
            p++;
        } while (i < n);
    }
    q = (Entry *)data_ov002_022ce288;
    m = *(u32 *)(data_ov002_022ce288 + 0x490);
    for (j = 0; j < m; j++, q++) {
        if (x == q->f0 && y == q->f1 && z == q->g1) return 1;
    }
    return 0;
}
