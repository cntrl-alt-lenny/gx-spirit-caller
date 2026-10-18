typedef unsigned short u16;
typedef unsigned int u32;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021b9ecc(int, int);
extern int func_ov002_021ba104(int, int, int);

int func_ov002_021bd5f4(int a, int b) {
    int i, j, count, r;
    char *p;
    r = func_ov002_021b9ecc(a, b);
    if (*(u16 *)(data_ov002_022cf1a4 + (a & 1) * 0x868 + b * 0x14) == 0) {
        return 0;
    }
    if (r == 0) {
        return 0;
    }
    count = 0;
    for (i = 0; i < 2; i++) {
        p = data_ov002_022cf16c + (i & 1) * 0x868;
        for (j = 0; j < 5; j++, p += 0x14) {
            u32 f;
            if (i == a && j == b) continue;
            if (*(u16 *)(p + 0x38) == 0) continue;
            f = *(u32 *)(p + 0x40);
            if ((((f >> 1) | (f >> 2)) & 1) != 0) continue;
            if (func_ov002_021ba104(i, j, r) != 0) count++;
        }
    }
    return count;
}
