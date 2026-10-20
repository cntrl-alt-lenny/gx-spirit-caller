extern int func_0202e234(int x);
extern unsigned int func_0202b8c0(int id);
extern int func_ov002_021b9ecc(int player, int idx);
extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022d016c[];
int func_ov002_021bb068(int id) {
    int i;
    int player;
    int count = 0;

    if (func_0202e234(id)) {
        int offset;

        for (player = 0, offset = 0; player < 2; player++, offset += 16) {
            unsigned char *row = data_ov002_022cf16c + (player & 1) * 0x868;
            for (i = 0; i < 5; i++, row += 0x14) {
                if (id == func_ov002_021b9ecc(player, i)) {
                    unsigned int flags = *(unsigned int *)(row + 0x40);
                    unsigned short active = *(unsigned short *)(row + 0x38);
                    if ((active & ~((flags >> 6) & 1)) & ~(((flags >> 1) | (flags >> 2)) & 1)) {
                        if ((*(unsigned int *)(data_ov002_022d016c + 0xd4) & (1 << (i + offset))) == 0)
                            count++;
                    }
                }
            }
        }
    } else if (func_0202b8c0(id) != 2) {
        int offset;

        for (player = 0, offset = 0; player < 2; player++, offset += 16) {
            unsigned char *row = data_ov002_022cf16c + (player & 1) * 0x868 + 0x64;
            for (i = 5; i < 10; i++, row += 0x14) {
                if (id == func_ov002_021b9ecc(player, i)) {
                    unsigned int flags = *(unsigned int *)(row + 0x40);
                    unsigned short active = *(unsigned short *)(row + 0x38);
                    if ((active & ~((flags >> 6) & 1)) & ~(((flags >> 1) | (flags >> 2)) & 1)) {
                        if ((*(unsigned int *)(data_ov002_022d016c + 0xd4) & (1 << (i + offset))) == 0)
                            count++;
                    }
                }
            }
        }
    } else {

        for (player = 0; player < 2; player++) {
            if (id == func_ov002_021b9ecc(player, 10)) {
                unsigned char *row = data_ov002_022cf16c + (player & 1) * 0x868;
                unsigned int flags = *(unsigned int *)(row + 0x108);
                unsigned short active = *(unsigned short *)(row + 0x100);
                if ((active & ~((flags >> 6) & 1)) & ~(((flags >> 1) | (flags >> 2)) & 1)) {
                    if ((*(unsigned int *)(data_ov002_022d016c + 0xd4) & (1 << (10 + player * 16))) == 0)
                        count++;
                }
            }
        }
    }
    return count;
}





