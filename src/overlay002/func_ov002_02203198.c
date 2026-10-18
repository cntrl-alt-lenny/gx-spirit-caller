typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 pad0;
    u16 side : 1;
    u16 rest1 : 15;
    u16 lo : 6;
    u16 val : 9;
    u16 hi : 1;
} Arg;

typedef struct {
    u32 lo : 13;
    u32 b13 : 1;
    u32 mid : 8;
    u32 top8 : 8;
    u32 hi : 2;
} Ent;

typedef struct {
    char pad[0xc];
    u32 count;
    char pad2[0x120 - 0x10];
    Ent ents[1];
    char pad3[0x868 - 0x124];
} Side;

extern Side data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_ov002_021bbf50(int side);
extern Ent *func_ov002_021c93f0(int side, int kind, int idx);

int func_ov002_02203198(Arg *arg) {
    u32 cnt;
    u32 i;
    u32 off;
    int side;
    int s;

    if (func_ov002_021bbf50(arg->side) == 0) {
        return 0;
    }
    side = arg->side;
    cnt = *(u32 *)(data_ov002_022cf178 + (side & 1) * 0x868);
    i = 0;
    if (i < cnt) {
        off = i;
        do {
            Ent *e;
            s = arg->side;
            e = (Ent *)((char *)data_ov002_022cf16c[s & 1].ents + off);
            if (arg->val != e->top8 * 2 + e->b13) {
                side = s;
                if (s != func_ov002_021c93f0(s, 0xb, i)->b13) {
                    return 0;
                }
            }
            i++;
            off += 4;
        } while (i < data_ov002_022cf16c[side & 1].count);
    }
    return 1;
}
