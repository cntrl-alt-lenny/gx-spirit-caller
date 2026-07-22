typedef struct {
    char pad0[2];
    unsigned short bit0 : 1;
    unsigned short field1_5 : 5;
    unsigned short pad6 : 10;
} S021ec110;

typedef struct {
    unsigned int pad[0xc];
    unsigned int field0_13 : 13;
    unsigned int padhi : 19;
} RowEntry021ec110;

extern char data_ov002_022cf16c[];
extern int func_ov002_021b33b0(int, int, int, int);
extern int func_ov002_021c23ac(int, int);

int func_ov002_021ec110(S021ec110 *p, int arg1, int arg2) {
    if (arg2 < 5) {
        return 0;
    }
    if (((RowEntry021ec110 *)(data_ov002_022cf16c + (arg1 & 1) * 0x868 + arg2 * 0x14))->field0_13 == 0) {
        return 0;
    }
    if (func_ov002_021b33b0(arg1, arg2, p->bit0, p->field1_5) == 0) {
        return 0;
    }
    return func_ov002_021c23ac(arg1, arg2) != 0;
}
