typedef struct {
    unsigned short flag : 1;
    unsigned short rest : 15;
} Hdr;

typedef struct {
    unsigned int cnt : 13;
    unsigned int rest : 19;
} Bits;

typedef struct {
    int a;
    char pad[0x18];
    int b;
} Sel;

extern int func_ov002_021c1ef0(void *a0, int a1, int a2);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern Sel data_ov002_022cd3f4;

int func_ov002_021ed408(void *a0, int a1, int a2) {
    int side;
    int idx;

    if (a2 >= 5) {
        return 0;
    }
    if (a1 == ((Hdr *)((char *)a0 + 2))->flag) {
        return 0;
    }
    side = (a1 & 1) * 0x868;
    idx = a2 * 0x14;
    if (*(unsigned short *)(data_ov002_022cf1a4 + side + idx) == 0) {
        return 0;
    }
    if (((Bits *)(data_ov002_022cf16c + side + 0x30 + idx))->cnt == 0) {
        return 0;
    }
    if (func_ov002_021c1ef0(a0, a1, a2) == 0) {
        return 0;
    }
    if (data_ov002_022cd3f4.a == a1 && data_ov002_022cd3f4.b == a2) {
        return 0;
    }
    return 1;
}
