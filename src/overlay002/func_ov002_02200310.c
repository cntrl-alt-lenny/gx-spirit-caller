typedef struct {
    char _pad0[2];
    unsigned short bit0 : 1;
    unsigned short pad1 : 5;
    unsigned short field6 : 6;
    unsigned short pad12 : 4;
    char _pad4[0x10];
    int f14;
} S02200310;

typedef struct {
    int f0;
    char _pad[0x18];
    int f1c;
} D022cd3f4;

extern D022cd3f4 data_ov002_022cd3f4;
extern int func_ov002_021c1ef0(void *, int, int);

int func_ov002_02200310(S02200310 *p) {
    int bit0;
    int f0;

    if (p->field6 != 0x12) {
        return 0;
    }
    if (p->f14 == 0) {
        return 0;
    }
    bit0 = p->bit0;
    f0 = data_ov002_022cd3f4.f0;
    if (f0 != (1 - bit0)) {
        return 0;
    }
    return func_ov002_021c1ef0(p, f0, data_ov002_022cd3f4.f1c) != 0;
}
