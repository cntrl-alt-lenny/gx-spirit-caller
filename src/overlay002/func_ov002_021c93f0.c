extern int data_ov002_022cd3f4[];
extern char data_ov002_022cd4b8[];
extern char data_ov002_022cd4cc[];
extern char data_ov002_022cf16c[];

void *func_ov002_021c93f0(int player, int kind, int extra) {
    int sum;
    switch (kind) {
    case 12:
        return data_ov002_022cf16c + (player & 1) * 0x868 + 0x3a0 + extra * 4;
    case 13:
        return data_ov002_022cf16c + (player & 1) * 0x868 + 0x260 + extra * 4;
    case 14:
        return data_ov002_022cf16c + (player & 1) * 0x868 + 0x418 + extra * 4;
    case 15:
        return data_ov002_022cf16c + (player & 1) * 0x868 + 0x5d0 + extra * 4;
    case 11:
        return data_ov002_022cf16c + (player & 1) * 0x868 + 0x120 + extra * 4;
    }
    sum = kind + extra;
    if (sum > 10) {
        if (player == data_ov002_022cd3f4[0] && kind == data_ov002_022cd3f4[7])
            return data_ov002_022cd4b8;
        else
            return data_ov002_022cd4cc;
    }
    return data_ov002_022cf16c + (player & 1) * 0x868 + 0x30 + sum * 0x14;
}
