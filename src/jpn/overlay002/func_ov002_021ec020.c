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

extern char data_ov002_022cf08c[];
extern int func_ov002_021b32d0(int, int, int, int);
extern int func_ov002_021c22cc(int, int);

int func_ov002_021ec020(S021ec110 *p, int arg1, int arg2) {
    if (arg2 < 5) {
        return 0;
    }
    if (((RowEntry021ec110 *)(data_ov002_022cf08c + (arg1 & 1) * 0x868 + arg2 * 0x14))->field0_13 == 0) {
        return 0;
    }
    if (func_ov002_021b32d0(arg1, arg2, p->bit0, p->field1_5) == 0) {
        return 0;
    }
    return func_ov002_021c22cc(arg1, arg2) != 0;
}
