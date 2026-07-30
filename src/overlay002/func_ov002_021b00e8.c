extern int data_ov002_022cf17c[];
extern int data_ov002_022cf180[];
extern int data_ov002_022cf184[];
extern int data_ov002_022cf188[];

int func_ov002_021b00e8(int player, int type) {
    switch (type) {
    case 12:
        return *(int *)((char *)data_ov002_022cf184 + (player & 1) * 0x868);
    case 13:
        return *(int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868);
    case 14:
        return *(int *)((char *)data_ov002_022cf180 + (player & 1) * 0x868);
    case 15:
        return *(int *)((char *)data_ov002_022cf188 + (player & 1) * 0x868);
    default:
        return 0;
    }
}
