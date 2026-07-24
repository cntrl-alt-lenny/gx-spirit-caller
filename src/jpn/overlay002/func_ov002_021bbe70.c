extern char data_ov002_022cf08c[];

struct Ov002Slot0 { unsigned int id : 13; char _pad[16]; }; /* 0x14 */

int func_ov002_021bbe70(int arg0) {
    struct Ov002Slot0 *p =
        (struct Ov002Slot0 *)((char *)data_ov002_022cf08c +
                              (arg0 & 1) * 0x868 + 0x30);
    int i;
    int count = 0;
    for (i = 0; i < 5; i++) {
        if (p[i].id)
            count++;
    }
    return count;
}
