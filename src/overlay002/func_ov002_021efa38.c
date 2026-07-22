typedef struct {
    char pad0[2];
    unsigned short bit0 : 1;
    unsigned short pad1 : 15;
} S021efa38;

typedef struct {
    unsigned int pad[0xc];
    unsigned int field0_13 : 13;
    unsigned int padhi : 19;
} RowEntry021efa38;

extern char data_ov002_022cf16c[];
extern int func_0202e2f8(int);
extern int func_ov002_021c23ac(int, int);

int func_ov002_021efa38(S021efa38 *p, int arg1, int arg2) {
    int field;
    if (p->bit0 != arg1) {
        return 0;
    }
    if (arg2 >= 5) {
        return 0;
    }
    field = ((RowEntry021efa38 *)(data_ov002_022cf16c + (arg1 & 1) * 0x868 + arg2 * 0x14))->field0_13;
    if (field == 0) {
        return 0;
    }
    if (func_0202e2f8(field) != 0) {
        return 1;
    }
    return func_ov002_021c23ac(arg1, arg2) != 0;
}
