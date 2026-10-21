extern int func_0202e234(int x);
extern int func_ov002_021b9ecc(int player, int idx);
extern int func_ov002_021ba104(int a, int b, int c);
extern unsigned char data_ov002_022cf16c[];
int func_ov002_021bb7f8(int player, int want, int exclude)
{
    int i;
    int count = 0;
    if (func_0202e234(want)) {
        unsigned char *row = data_ov002_022cf16c + (player & 1) * 0x868;
        for (i = 0; i < 5; i++, row += 0x14) {
            if (func_ov002_021b9ecc(player, i) > 0 && i != exclude && func_ov002_021ba104(player, i, want) && *(unsigned short *)(row + 0x38)) {
                unsigned int v = *(unsigned int *)(row + 0x40);
                if ((((v >> 1) | (v >> 2)) & 1) == 0)
                    count++;
            }
        }
    } else {
        unsigned char *row = data_ov002_022cf16c + (player & 1) * 0x868 + 0x64;
        for (i = 5; i <= 10; i++, row += 0x14) {
            int check = func_ov002_021b9ecc(player, i);
            if (check > 0 && i != exclude && check == want && *(unsigned short *)(row + 0x38)) {
                unsigned int v = *(unsigned int *)(row + 0x40);
                if ((((v >> 1) | (v >> 2)) & 1) == 0)
                    count++;
            }
        }
    }
    return count;
}

