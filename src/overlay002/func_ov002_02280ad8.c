extern char data_ov002_022cf16c[];
extern void func_ov002_0227b090(int player, int i, void *buf);

int func_ov002_02280ad8(int player) {
    int i;
    char *cursor;
    char *row;
    int max;
    char buf[0x2c];

    row = data_ov002_022cf16c + (player & 1) * 0x868;
    max = 0;
    i = 0;
    cursor = row + 0x30;

    for (; i < 5; i++, cursor += 0x14, row += 0x14) {
        int id = *(int *)cursor;
        id = (unsigned int)(id << 19) >> 19;
        if (id != 0) {
            func_ov002_0227b090(player, i, buf);
            if (*(unsigned short *)(row + 0x36) != 0) {
                int v = *(int *)(buf + 0x18);
                if (max <= v)
                    max = v;
            } else {
                int v = *(int *)(buf + 0x14);
                if (max <= v)
                    max = v;
            }
        }
    }
    return max;
}
