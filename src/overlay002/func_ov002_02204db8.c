typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 a;
    u16 side : 1;
    u16 idx : 5;
    u16 rest : 10;
} Arg;

struct Duel {
    char pad[0xcec];
    u32 cur;
};

struct Slot {
    u32 v;
    char pad[0x868 - 4];
};

extern struct Duel data_ov002_022d016c;
extern struct Slot data_ov002_022cf178[];
extern int func_ov002_021b3ecc(u32 side, u32 idx, u32 a);

int func_ov002_02204db8(Arg *p)
{
    if (data_ov002_022d016c.cur != p->side) {
        return data_ov002_022cf178[p->side & 1].v < 4;
    }
    return func_ov002_021b3ecc(p->side, p->idx, p->a);
}
