typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 pad0;
    u16 side : 1;
    u16 rest : 15;
} Hdr;

typedef struct {
    u32 val : 13;
    u32 rest : 19;
    u32 pad[4];
} Slot;

typedef struct {
    u32 hdr[12];
    Slot slot[1];
} SideA;

typedef struct {
    u16 v;
    u16 pad[9];
} SlotB;

typedef struct {
    SlotB slot[1];
} SideB;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021b9e00(int a, int b);

int func_ov002_021f82b8(Hdr *p, int side, int idx)
{
    char *a;
    char *b;

    if (p->side != side) {
        return 0;
    }
    a = data_ov002_022cf16c + (side & 1) * 0x868;
    if (((SideA *)a)->slot[idx].val == 0) {
        return 0;
    }
    b = data_ov002_022cf1a4 + (side & 1) * 0x868;
    if (((SideB *)b)->slot[idx].v == 0) {
        return 0;
    }
    return func_ov002_021b9e00(side, idx) != 0;
}
