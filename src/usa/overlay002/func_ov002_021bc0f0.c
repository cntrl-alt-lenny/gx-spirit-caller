extern char data_ov002_022cf08c[];

struct Ov002Slot0 { unsigned int id : 13; char _pad[16]; };

int func_ov002_021bc0f0(int side, int val) {
    int i;
    int count = 0;
    struct Ov002Slot0 *p;
    char *row = data_ov002_022cf08c + (side & 1) * 0x868;
    p = (struct Ov002Slot0 *)(row + 0x30);
    for (i = 0; i < 5; i++, p++, row += 0x14) {
        if (p->id) {
            unsigned short f8 = *(unsigned short *)(row + 0x38);
            if (val == f8) count++;
        }
    }
    return count;
}
