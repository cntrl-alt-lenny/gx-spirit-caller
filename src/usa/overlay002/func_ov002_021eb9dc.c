typedef struct {
    char _pad[0x30];
    unsigned int id : 13;
} Row021ebacc;

extern char data_ov002_022cf08c[];
extern char data_ov002_022cf0c4[];

int func_ov002_021eb9dc(void *self, int player, int idx) {
    if (idx >= 5)
        return 0;
    int off = idx * 0x14;
    int poff = (player & 1) * 0x868;
    int row = (int)data_ov002_022cf08c + poff;
    Row021ebacc *slot = (Row021ebacc *)(row + off);
    if (slot->id == 0)
        return 0;
    int row2 = (int)data_ov002_022cf0c4 + poff;
    return *(unsigned short *)(off + row2) == 0;
}
