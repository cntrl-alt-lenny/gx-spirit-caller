extern int func_ov002_021b9ecc(int player, int kind);
extern char data_ov002_022cf16c[];

int func_ov002_021bc000(int player, int (*fn)(int))
{
    int i;
    int count = 0;
    char *row = data_ov002_022cf16c + (player & 1) * 0x868;

    for (i = 0; i < 5; i++, row += 0x14) {
        unsigned int flags;
        if (*(unsigned short *)(row + 0x38) == 0) {
            continue;
        }
        flags = *(unsigned int *)(row + 0x40);
        if (((flags >> 1) | (flags >> 2)) & 1) {
            continue;
        }
        if (fn(func_ov002_021b9ecc(player, i)) != 0) {
            count++;
        }
    }
    return count;
}
