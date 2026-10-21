extern char data_ov002_022d016c[];
extern char data_ov002_022cf16c[];
extern int func_ov002_021b9ecc(int, int);
extern void func_ov002_021e2d94(int, int, int, int);
extern void func_ov002_021df62c(int, int, int);
extern void func_ov002_021d93e0(int, int, int);
typedef struct { unsigned int id:13; unsigned int bit:1; unsigned int pad:8; unsigned int index:8; unsigned int rest:2; } Card;
int func_ov002_02256e1c(void)
{
    int p, j, i;
    char *base, *q;
    unsigned int flags;
    for (i = 0; i < 2; i++) {
        p = *(int *)(data_ov002_022d016c + 0xcec) ^ i;
        base = data_ov002_022cf16c + (p & 1) * 0x868;
        q = base;
        for (j = 0; j <= 4; j++, q += 0x14) {
            if (func_ov002_021b9ecc(p, j) == 0x1a8d && ((*(unsigned int *)(q + 0x40) >> 5) & 1)) {
                func_ov002_021e2d94(p, j, 5, 0);
                flags = *(unsigned int *)(q + 0x40);
                if (*(unsigned short *)(q + 0x38) & ~((flags >> 6) & 1) & ~(((flags >> 1) | (flags >> 2)) & 1)) {
                    Card *card = (Card *)(base + 0x30 + j * 0x14);
                    func_ov002_021df62c(p, j, card->index * 2 + card->bit);
                    func_ov002_021d93e0(p, j, 2);
                    return 1;
                }
            }
        }
    }
    return 0;
}

