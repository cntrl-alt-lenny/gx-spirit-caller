typedef unsigned int u32;
typedef int s32;

typedef struct {
    u32 id : 13;
    u32 rest : 19;
} Ov2Card;

typedef struct {
    u32 pad0[6];
    u32 count;
    u32 pad1[0x3a0 / 4 - 7];
    Ov2Card cards[1];
} Ov2Side;

extern char data_ov002_022cf16c[];
extern u32 data_ov002_022cf184[];
extern s32 func_0202df78(s32 a, s32 b);

s32 func_ov002_021ba748(s32 side, s32 id)
{
    u32 i;
    s32 n;
    Ov2Card *p;
    Ov2Side *s;
    u32 offs = (side & 1) * 0x868;

    n = 0;
    i = n;
    if (i < *(u32 *)((char *)data_ov002_022cf184 + offs)) {
        s = (Ov2Side *)(data_ov002_022cf16c + offs);
        p = s->cards;
        do {
            if (func_0202df78(p->id, id) != 0) {
                n++;
            }
            i++;
            p++;
        } while (i < s->count);
    }
    return n;
}
