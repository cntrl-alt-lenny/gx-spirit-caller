typedef unsigned int u32;
typedef struct { u32 id : 13; u32 rest : 19; } Ent;
extern char data_ov002_022cf16c[];
typedef struct { u32 count; char rest[0x864]; } CountRow;
extern CountRow data_ov002_022cf17c[];
extern int func_0202df78(int id, int other);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_02248bc0(int player, int id)
{
    u32 i;
    u32 side;
    u32 off;
    Ent *e;
    char *base;
    switch (id) {
    case 0x1293: id = 0x1291; break;
    case 0x1308: id = 0x12e5; break;
    case 0x139d: id = 0xfe4; break;
    case 0x1807: id = 0x180b; break;
    case 0x180b: id = 0x180c; break;
    case 0x180c: id = 0x1807; break;
    case 0x189f: id = 0x18a3; break;
    }
    i = 0;
    side = player & 1;
    off = 0x868 * side;
    if (i >= data_ov002_022cf17c[side].count) return;
    base = data_ov002_022cf16c + off;
    e = (Ent *)(base + 0x260);
    do {
        if (func_0202df78(e->id, id) != 0) {
            func_ov002_02253458(player, 13, i);
        }
        i++;
        e++;
    } while (i < *(u32 *)(base + 0x10));
}





