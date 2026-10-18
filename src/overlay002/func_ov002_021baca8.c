extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern char data_ov002_022d016c[];
extern int func_ov002_021b9ecc(int a0, int a1);

int func_ov002_021baca8(int a0, int a1, int a2) {
    int r = 0;
    int ok = 0;
    if (a2 == func_ov002_021b9ecc(a0, a1)) {
        int off = (a0 & 1) * 0x868;
        unsigned short h = *(unsigned short *)(data_ov002_022cf1a4 + off + a1 * 20);
        unsigned int f = *(unsigned int *)(data_ov002_022cf1ac + off + a1 * 20);
        if ((h & ~((f >> 6) & 1)) & ~(((f >> 1) | (f >> 2)) & 1)) {
            ok = 1;
        }
    }
    if (ok) {
        if (!(*(unsigned int *)(data_ov002_022d016c + 0xd4) & (1 << (a1 + a0 * 16)))) {
            r = 1;
        }
    }
    return r;
}
