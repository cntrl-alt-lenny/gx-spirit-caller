typedef unsigned int u32;
typedef unsigned short u16;

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
extern struct { char pad[0xd94]; u32 cur; } data_ov002_022d016c;
extern struct { char pad[0xa2]; u16 v; } data_ov002_022d0e6c;
extern int func_ov002_021c1a2c(u32 a, u32 b, u32 c);
extern int func_ov002_021c1d28(u32 a, u32 b, u32 c);

int func_ov002_0226c5f4(u32 a, int b, int c)
{
    int i = b + c;
    if (a != data_ov002_022d016c.cur) return 0;
    if (i > 4) return 0;
    if (data_ov002_022cf16c[a & 1].slots[i].id == 0) return 0;
    if (func_ov002_021c1a2c(a, i, 0x142a) == 0) return 0;
    if (func_ov002_021c1d28(a, i, a != data_ov002_022d0e6c.v) != 0) return 0;
    return 0x800;
}
