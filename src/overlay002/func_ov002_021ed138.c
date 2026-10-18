typedef struct {
    unsigned short flag : 1;
    unsigned short rest : 15;
} Hdr;

typedef struct {
    unsigned int cnt : 13;
    unsigned int rest : 19;
} Bits;

extern int func_ov002_021c1e44(void *a0, int a1, int a2);
extern int func_ov002_021c84e0();
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];

int func_ov002_021ed138(void *a0, int a1, int a2) {
    int side = (a1 & 1) * 0x868;
    int idx = a2 * 0x14;
    unsigned int cnt = ((Bits *)(data_ov002_022cf16c + side + 0x30 + idx))->cnt;

    if (a2 >= 5) {
        return 0;
    }
    if (cnt == 0) {
        return 0;
    }
    if (func_ov002_021c1e44(a0, a1, a2) != 0) {
        return 0;
    }
    if (a1 != 1 - ((Hdr *)((char *)a0 + 2))->flag) {
        return 0;
    }
    if (*(unsigned short *)(data_ov002_022cf1a4 + side + idx) == 0) {
        return 0;
    }
    return func_ov002_021c84e0(a1, a2) == 4;
}
