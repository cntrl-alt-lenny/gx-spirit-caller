extern int data_ov002_022cf09c[];
extern int data_ov002_022cf0a0[];
extern int data_ov002_022cf0a4[];
extern int data_ov002_022cf0a8[];

int func_ov002_021b0008(int player, int type) {
    switch (type) {
    case 12:
        return *(int *)((char *)data_ov002_022cf0a4 + (player & 1) * 0x868);
    case 13:
        return *(int *)((char *)data_ov002_022cf09c + (player & 1) * 0x868);
    case 14:
        return *(int *)((char *)data_ov002_022cf0a0 + (player & 1) * 0x868);
    case 15:
        return *(int *)((char *)data_ov002_022cf0a8 + (player & 1) * 0x868);
    default:
        return 0;
    }
}
