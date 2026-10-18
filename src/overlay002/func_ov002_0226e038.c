typedef struct {
    unsigned int w0;
    unsigned char pad4[4];
    unsigned char b8;
    unsigned char pad9[0x16 - 9];
    unsigned short h16;
} D;

extern char data_ov002_022cf288[];
extern D data_ov002_022cd300;
extern int func_ov002_021bb068(int a);
extern int func_ov002_02271608(int a, int b, int c);

int func_ov002_0226e038(int player)
{
    int i;
    int other;
    int zero;
    D *d;

    if ((*(unsigned int *)(data_ov002_022cf288 + (player & 1) * 0x868) >> 17) & 1) {
        return 0;
    }
    if (func_ov002_021bb068(0x13f2) > 0) {
        return 0;
    }
    d = &data_ov002_022cd300;
    d->w0 = (d->w0 & ~1) | ((unsigned)player % 2);
    other = 1 - player;
    i = 0;
    zero = i;
    d->h16 |= 2;
    d->b8 = 0;
    for (; i <= 4; i++) {
        if (func_ov002_02271608(other, i, zero) != 0) {
            return 1;
        }
    }
    return 0;
}
