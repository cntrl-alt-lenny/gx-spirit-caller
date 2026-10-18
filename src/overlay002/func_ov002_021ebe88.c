typedef struct {
    unsigned short flag : 1;
    unsigned short rest : 15;
} Hdr;

typedef struct {
    unsigned int cnt : 13;
    unsigned int rest : 19;
} Bits;

extern int func_ov002_021b8fcc(int a0, int a1);
extern int func_ov002_021c1ef0(void *a0, int a1, int a2);
extern int func_ov002_021c2084(void *a0, int a1, int a2, int a3);
extern char data_ov002_022cf16c[];

int func_ov002_021ebe88(void *a0, int a1, int a2) {
    if (a1 == ((Hdr *)((char *)a0 + 2))->flag) {
        return 0;
    }
    if (a2 < 5) {
        if (func_ov002_021b8fcc(a1, a2) == 0) {
            return 0;
        }
    }
    if (((Bits *)(data_ov002_022cf16c + (a1 & 1) * 0x868 + a2 * 0x14 + 0x30))->cnt == 0) {
        return 0;
    }
    if (func_ov002_021c1ef0(a0, a1, a2) == 0) {
        return 0;
    }
    return func_ov002_021c2084(a0, a1, a2, 1) != 0;
}
