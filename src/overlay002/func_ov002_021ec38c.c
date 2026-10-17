typedef struct {
    unsigned int cnt : 13;
    unsigned int rest : 19;
} Bits;

extern int func_ov002_021b4054(int a0, int a1, int a2, int a3);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];

int func_ov002_021ec38c(unsigned short *a0, int a1, int a2) {
    int side;
    int idx;

    if (a2 >= 5) {
        return 0;
    }
    side = (a1 & 1) * 0x868;
    idx = a2 * 0x14;
    if (((Bits *)(data_ov002_022cf16c + side + 0x30 + idx))->cnt == 0) {
        return 0;
    }
    if (*(unsigned short *)(data_ov002_022cf1a4 + side + idx) == 0) {
        return 0;
    }
    return func_ov002_021b4054(a1, a2, *a0, 4) != 0;
}
