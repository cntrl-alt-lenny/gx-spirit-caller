typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u32 pad : 21;
    u32 flag : 1;
    u32 rest : 10;
} Entry;

typedef struct {
    Entry e[105];
    char pad[0x868 - 105 * 4];
} Bank;

typedef struct {
    u16 a;
    u16 side : 1;
    u16 idx : 5;
    u16 mid : 6;
    u16 state : 2;
    u16 rest : 2;
} Obj;

extern Bank data_ov002_022cf1ac[];
extern int func_ov002_02257ab8(Obj *o, int v);

int func_ov002_02295fb8(Obj *o)
{
    int r;
    u32 s = o->side & 1;
    u32 i = o->idx;
    if (((u32 *)((char *)&data_ov002_022cf1ac[s] + i * 0x14))[0] >> 21 & 1) {
        return 0;
    }
    o->state = 1;
    r = func_ov002_02257ab8(o, 1 - o->side);
    o->state = 3;
    return r != 0;
}
