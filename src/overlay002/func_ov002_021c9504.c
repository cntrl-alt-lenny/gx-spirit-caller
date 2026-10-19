typedef struct { unsigned int value : 13; unsigned int rest : 19; } Card;
extern int data_ov002_022cd3f4[];
extern Card data_ov002_022cd4b8[];
extern Card data_ov002_022cd4cc[];
extern char data_ov002_022cf16c[];

int func_ov002_021c9504(int player, int kind, int extra) {
    int sum;
    Card *p;
    switch (kind) {
    case 12:
        return ((Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + extra * 4 + 0x3a0))->value;
    case 13:
        return ((Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + extra * 4 + 0x260))->value;
    case 14:
        return ((Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + extra * 4 + 0x418))->value;
    case 15:
        return ((Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + extra * 4 + 0x5d0))->value;
    case 11:
        return ((Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + extra * 4 + 0x120))->value;
    }
    sum = kind + extra;
    if (sum > 10) {
        if (player == data_ov002_022cd3f4[0] && kind == data_ov002_022cd3f4[7])
            p = data_ov002_022cd4b8;
        else
            p = data_ov002_022cd4cc;
        return p->value;
    }
    return ((Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + sum * 0x14 + 0x30))->value;
}

