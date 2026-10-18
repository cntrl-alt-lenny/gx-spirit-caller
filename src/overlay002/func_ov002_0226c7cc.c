typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;

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
extern int func_ov002_021c1e20(u32 a, u32 b, u32 c);

int func_ov002_0226c7cc(u32 a, int b, int c)
{
    u16 val;
    if (a != data_ov002_022d016c.cur) goto fail;
    if (b == 11) return 0x800;
    b = b + c;
    if (b > 10) goto fail;
    if (data_ov002_022cf16c[a & 1].slots[b].id == 0) return 0;
    val = data_ov002_022d0e6c.v;
    if (val == (u16)((u8)a | ((u8)b << 8))) return 0;
    if (func_ov002_021c1e20(a, b, a != (val & 0xff)) != 0) return 0;
    return 0x800;
fail:
    return 0;
}
