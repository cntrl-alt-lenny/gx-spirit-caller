typedef unsigned int u32;
typedef struct { u32 pad0:13; u32 flag:1; u32 pad1:8; u32 value:8; u32 pad2:2; } Card;
extern int data_ov002_022cd3f4[];
extern Card data_ov002_022cd4b8[];
extern Card data_ov002_022cd4cc[];
extern char data_ov002_022cf16c[];

int func_ov002_021c9650(int player, int kind, int extra) {
    int sum;
    Card *p;
    switch (kind) {
    case 12:
        p = (Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x3a0) + extra;
        return p->value * 2 + p->flag;
    case 13:
        p = (Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x260) + extra;
        return p->value * 2 + p->flag;
    case 14:
        p = (Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x418) + extra;
        return p->value * 2 + p->flag;
    case 15:
        p = (Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x5d0) + extra;
        return p->value * 2 + p->flag;
    case 11:
        p = (Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x120) + extra;
        return p->value * 2 + p->flag;
    }
    sum = kind + extra;
    if (sum > 10) {
        if (player == data_ov002_022cd3f4[0] && kind == data_ov002_022cd3f4[7])
            p = data_ov002_022cd4b8;
        else
            p = data_ov002_022cd4cc;
        return p->value * 2 + p->flag;
    }
    p = (Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30 + sum * 0x14);
    return p->value * 2 + p->flag;
}

