extern char data_ov002_022cf0c6[];
extern char data_ov002_022d0570[];
extern void func_ov002_021de390(int lo, int hi, int c, int d);

struct Ov002Node0650 {
    unsigned short f0;
    unsigned short f2lo : 4;
    unsigned short f2hi : 12;
    unsigned short f4;
    unsigned short f6;
};

void func_ov002_021d628c(int player, int arg1, int c) {
    unsigned short value = *(unsigned short *)(data_ov002_022cf0c6 + (player & 1) * 0x868 + arg1 * 20);

    if (value == 0) {
        return;
    }
    do {
        struct Ov002Node0650 *node = (struct Ov002Node0650 *)(data_ov002_022d0570 + value * 8);
        value = node->f6;
        if (c == node->f2lo) {
            int lo = node->f0 & 0xff;
            int hi = (node->f0 >> 8) & 0xff;
            func_ov002_021de390(lo, hi, 0, 0);
        }
    } while (value != 0);
}
