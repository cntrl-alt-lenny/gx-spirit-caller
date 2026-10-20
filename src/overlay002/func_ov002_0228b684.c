typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 id; u16 side:1; u16 slot:5; u16 rest:10; } Obj;
typedef struct { union { u32 raw; struct { u32 id:13; u32 rest:19; } bits; } data; char pad[16]; } Row;
typedef struct { char pad[0x30]; Row rows[11]; char tail[1884]; } Player;
extern Player data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern int func_ov002_021bcf18(int side, int a, int b, int c);
extern int func_ov002_0228b5f4(Obj *a, Obj *b);
extern unsigned int func_0202b8c0(int id);
extern unsigned short func_0202b9b0(unsigned short key);
extern int func_ov002_022815a4(int id, int flag);
int func_ov002_0228b684(Obj *a, Obj *b)
{
    if (b == 0) return 0;
    if (b->side == a->side) return 0;
    if (func_ov002_021bcf18(1 - a->side, 0, 1, 1)) {
        if (b->id == 0x131b) return 0;
        if (func_ov002_0228b5f4(a, b)) return 1;
    }
    if (b->slot > 10) return 0;
    switch (func_0202b8c0(b->id)) {
    case 2:
    case 3:
        if (b->id == 0x1322 && *(int *)(data_ov002_022d016c + 0xcf8) == 1) return 0;
        return 1;
    case 4: { int player; int value; u16 id; Row *row;
        player = b->side & 1;
        row = &data_ov002_022cf16c[player].rows[b->slot];
        id = row->data.raw << 3;
        id >>= 3;
        value = func_0202b9b0(id);
        if (value < 3) return 1;
        player = b->side & 1;
        if (func_ov002_022815a4(data_ov002_022cf16c[player].rows[b->slot].data.bits.id, 1)) return 1;
        break; }
    }
    return 0;
}






