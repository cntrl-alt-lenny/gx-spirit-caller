typedef unsigned int u32;
typedef struct { u32 pad0:13; u32 flag:1; u32 pad1:8; u32 value:8; u32 pad2:2; } Card;
typedef struct { char pad[0x260]; Card cards[386]; } Side;
extern Side data_ov002_022cf16c[];
extern char data_ov002_022cf8f4[];
extern char data_ov002_022cf1a4[];
extern u32 data_ov002_022d016c[];
extern int data_ov002_022cd73c[];
extern int data_ov002_022cd3f4[];
extern unsigned short data_ov002_022cd4b8[];
extern unsigned short data_ov002_022cd4cc[];
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021c3cc8(int a0);
int func_ov002_021c988c(int player, int kind, int extra) {
    int sum;
    unsigned short *p;
    switch (kind) {
    case 12: return 0;
    case 13: {
        Card *c = &data_ov002_022cf16c[player & 1].cards[extra];
        return func_ov002_021b3fd8(player, 11, 0x12a1, c->value * 2 + c->flag) ^ ((data_ov002_022d016c[0x34] >> 2) & 1);
    }
    case 14: return 1;
    case 15: {
        int v = *(unsigned short *)(data_ov002_022cf8f4 + (player & 1) * 0x868 + extra * 2);
        switch (v & 0xff) {
        case 0x80: return 0;
        case 0x40: return ((v >> 8) & 0xff) >> 1 & 1;
        default: return 1;
        }
    }
    case 11:
        if (player == data_ov002_022cd73c[1] || func_ov002_021c3cc8(player)) return 1;
        return 0;
    }
    sum = kind + extra;
    if (sum > 10) {
        if (player == data_ov002_022cd3f4[0] && kind == data_ov002_022cd3f4[7]) p = data_ov002_022cd4b8;
        else p = data_ov002_022cd4cc;
        return p[4];
    }
    return *(unsigned short *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + sum * 0x14);
}

