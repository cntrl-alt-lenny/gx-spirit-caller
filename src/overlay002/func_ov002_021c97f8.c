/* func_ov002_021c97f8: kind dispatcher. kind in [11,15] -> 0. Otherwise if
 * (kind+extra) <= 10, read a u16 from the per-player cf1a2 table at
 * (kind+extra)*0x14. Else pick between cd4b8/cd4cc based on whether
 * (player, kind) match the cd3f4 globals, and read u16 field +6. */
extern int data_ov002_022cd3f4[];
extern unsigned short data_ov002_022cd4b8[];
extern unsigned short data_ov002_022cd4cc[];
extern unsigned short data_ov002_022cf1a2[];

int func_ov002_021c97f8(int player, int kind, int extra) {
    int sum;
    unsigned short *p;
    switch (kind) {
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
        return 0;
    }
    sum = kind + extra;
    if (sum > 10) {
        if (player == data_ov002_022cd3f4[0] && kind == data_ov002_022cd3f4[7])
            p = data_ov002_022cd4b8;
        else
            p = data_ov002_022cd4cc;
        return *(unsigned short *)((char *)p + 6);
    }
    return *(unsigned short *)((char *)data_ov002_022cf1a2 + (player & 1) * 0x868 + sum * 0x14);
}
