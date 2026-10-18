typedef unsigned int u32;
typedef unsigned short u16;

typedef struct {
    u32 id : 13;
    u32 rest : 19;
} Slot;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern struct { char pad[0xd94]; u32 cur; } data_ov002_022d016c;
extern int func_0202e234(u32 a);
extern int func_0202e2f8(u32 a);
extern int func_02030808(u32 a);

int func_ov002_0226c708(u32 a, int b, int c)
{
    u32 id;
    int idx;
    int side;
    int off;
    char *row;
    idx = b + c;
    if (a != data_ov002_022d016c.cur) return 0;
    if (idx > 4) return 0;
    side = (a & 1) * 0x868;
    off = idx * 0x14;
    row = data_ov002_022cf16c + side;
    id = ((Slot *)(row + 0x30 + off))->id;
    if (id == 0) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + side + off) == 0) return 0;
    if (func_0202e234(id) == 0) return 0;
    if (func_0202e2f8(id) != 0) return 0;
    return (func_02030808(id) != 0) ? 0x800 : 0;
}
