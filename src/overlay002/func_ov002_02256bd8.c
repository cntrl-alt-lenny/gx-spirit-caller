extern char data_ov002_022d016c[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a8[];
extern int func_ov002_021b9ecc(int, int);
extern int func_ov002_021d9144(int, int, int);
extern int func_ov002_021d90c0(int, int, int);

int func_ov002_02256bd8(void)
{
    int p, i, offset;
    char *q;
    unsigned int flags;
    unsigned short count;
    if (*(int *)(data_ov002_022d016c + 0xcf8) == 7) return 0;
    p = *(int *)(data_ov002_022d016c + 0xcec);
    offset = (p & 1) * 0x868;
    q = data_ov002_022cf16c + offset;
    for (i = 0; i <= 4; i++, q += 0x14) {
        if (func_ov002_021b9ecc(p, i) == 0x1810 && *(unsigned short *)(q + 0x38) != 0) {
            flags = *(unsigned int *)(q + 0x40);
            if (!(((flags >> 1) | (flags >> 2)) & 1) && *(int *)(data_ov002_022d016c + 0xcf0) + 1 != (unsigned short)(*(unsigned int *)(q + 0x3c) >> 16)) {
                count = (unsigned short)*(unsigned int *)(data_ov002_022cf1a8 + offset + i * 0x14);
                func_ov002_021d9144(p, i, 1);
                func_ov002_021d90c0(p, i, (unsigned short)(count + 1) | ((unsigned short)(*(int *)(data_ov002_022d016c + 0xcf0) + 1) << 16));
                return 1;
            }
        }
    }
    return 0;
}
