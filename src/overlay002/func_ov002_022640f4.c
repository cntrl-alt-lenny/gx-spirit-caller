typedef unsigned int u32;

typedef struct {
    u32 id : 13;
    u32 rest : 19;
    u32 pad2[4];
} Slot;

typedef struct {
    char pad0[0x30];
    Slot slots[5];
    char pad1[0x868 - 0x30 - 100];
} Side;

extern Side data_ov002_022cf16c[2];
extern struct { char pad[0xd28]; u32 idx; } data_ov002_022d016c;
extern int func_ov002_021de480(u32 a, u32 b, u32 c, u32 d);

int func_ov002_022640f4(u32 a)
{
    while (data_ov002_022d016c.idx < 10) {
        u32 i = data_ov002_022d016c.idx;
        u32 side = a ^ (i / 5);
        if (data_ov002_022cf16c[side & 1].slots[i % 5].id == 0x1608) {
            func_ov002_021de480(side, i % 5, 0, 0);
            data_ov002_022d016c.idx++;
            return 0;
        }
        data_ov002_022d016c.idx++;
    }
    return 1;
}
