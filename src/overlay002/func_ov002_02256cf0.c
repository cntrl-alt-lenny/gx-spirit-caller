extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern int func_ov002_021b9ecc(int, int);
extern int func_ov002_021d90c0(int, int, int);
extern int func_ov002_021e30b4(int, int, int);
typedef struct { unsigned int id:13; unsigned int bit:1; unsigned int pad:8; unsigned int index:8; unsigned int rest:2; } Card;
int func_ov002_02256cf0(void)
{
    int p, i, other, shift;
    char *q;
    unsigned int flags;
    for (p = 0; p < 2; p++) {
        if (func_ov002_021b9ecc(p, 10) == 0x183f) {
            q = data_ov002_022cf16c + (p & 1) * 0x868;
            if (*(unsigned short *)(q + 0x100) != 0) {
                flags = *(unsigned int *)(q + 0x108);
                if (!(((flags >> 1) | (flags >> 2)) & 1) && *(unsigned int *)(q + 0x104) != 0) {
                    for (i = 0; i < 2; i++) {
                        flags = *(unsigned int *)(q + 0x104);
                        other = *(int *)(data_ov002_022d016c + 0xcec) ^ i;
                        shift = other * 16;
                        if ((0xffff << shift) & flags) {
                            Card *card = (Card *)(q + 0xf8);
                            func_ov002_021e30b4(((p << 31) & 0x80000000) | (((p != other) << 24) & 0x1000000) | 0x2a183f, (unsigned short)(card->index * 2 + card->bit), 0);
                        }
                    }
                    func_ov002_021d90c0(p, 10, 0);
                    return 1;
                }
            }
        }
    }
    return 0;
}




