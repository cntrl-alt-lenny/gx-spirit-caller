extern int func_0202e234(int x);
extern int func_ov002_021b9ecc(int player, int idx);
extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022d016c[];
int func_ov002_021bb65c(int player, int want)
{
    int i;
    int min = 0;
    if (func_0202e234(want)) {
        unsigned char *row = data_ov002_022cf16c + (player & 1) * 0x868;
        int bit = player << 4;
        for (i = 0; i < 5; i++, row += 0x14, bit++) {
            int check = func_ov002_021b9ecc(player, i);
            if (check == want) {
                unsigned int v = *(unsigned int *)(row + 0x40);
                unsigned short h = *(unsigned short *)(row + 0x38);
                if ((h & ~((v >> 6) & 1)) & ~(((v >> 1) | (v >> 2)) & 1)) {
                    if ((*(unsigned int *)(data_ov002_022d016c + 0xd4) & (1 << bit)) == 0) {
                        if (min == 0 || min > *(unsigned short *)(row + 0x34))
                            min = *(unsigned short *)(row + 0x34);
                    }
                }
            }
        }
    } else {
        unsigned char *row = data_ov002_022cf16c + (player & 1) * 0x868 + 0x64;
        for (i = 5; i <= 10; i++, row += 0x14) {
            int check = func_ov002_021b9ecc(player, i);
            if (check == want) {
                unsigned int v = *(unsigned int *)(row + 0x40);
                unsigned short h = *(unsigned short *)(row + 0x38);
                if ((h & ~((v >> 6) & 1)) & ~(((v >> 1) | (v >> 2)) & 1)) {
                    if (min == 0 || min > *(unsigned short *)(row + 0x34))
                        min = *(unsigned short *)(row + 0x34);
                }
            }
        }
    }
    return min;
}


