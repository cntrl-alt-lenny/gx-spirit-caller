typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 pad0;
    u16 a : 1;
    u16 b : 5;
    u16 rest1 : 10;
    u16 pad2 : 6;
    u16 c : 9;
    u16 rest2 : 1;
} Arg;

typedef struct {
    u32 lo : 13;
    u32 bit : 1;
    u32 mid : 8;
    u32 hi : 8;
    u32 top : 2;
} Word;

typedef struct {
    Word w;
    u32 pad[4];
} Ent;

typedef struct {
    u32 pad[12];
    Ent ent[32];
    u32 tail[0x16e];
} Side;

typedef struct {
    u16 v;
    u16 pad[9];
} Ent2;

typedef struct {
    Ent2 ent[32];
    u32 tail[0x17a];
} Side2;

extern Side data_ov002_022cf16c[];
extern Side2 data_ov002_022cf1a4[];

int func_ov002_021f51dc(Arg *p)
{
    int a = p->a & 1;
    int b = p->b;
    Word *w = &data_ov002_022cf16c[a].ent[b].w;

    if (p->c != w->hi * 2 + w->bit) {
        return -1;
    }
    if (data_ov002_022cf1a4[a].ent[b].v != 0) {
        return 1;
    }
    return -1;
}
