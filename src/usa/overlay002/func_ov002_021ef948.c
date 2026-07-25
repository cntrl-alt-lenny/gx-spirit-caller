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

extern char data_ov002_022cf08c[];
extern int func_0202e2a4(int);
extern int func_ov002_021c22cc(int, int);

int func_ov002_021ef948(S021efa38 *p, int arg1, int arg2) {
    int field;
    if (p->bit0 != arg1) {
        return 0;
    }
    if (arg2 >= 5) {
        return 0;
    }
    field = ((RowEntry021efa38 *)(data_ov002_022cf08c + (arg1 & 1) * 0x868 + arg2 * 0x14))->field0_13;
    if (field == 0) {
        return 0;
    }
    if (func_0202e2a4(field) != 0) {
        return 1;
    }
    return func_ov002_021c22cc(arg1, arg2) != 0;
}
