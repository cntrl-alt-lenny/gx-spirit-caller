typedef struct {
    char pad_000[0xd48];
    int field_d48;
    int field_d4c;
} data_ov002_022d016c_t;
extern data_ov002_022d016c_t data_ov002_022d016c;

extern int func_ov002_0229c7f8(int a);
extern void func_ov002_0229ade0(int a, int b, int c, int d);

int func_ov002_021b1254(void) {
    if (func_ov002_0229c7f8(3) != 0) {
        return 1;
    }
    if (data_ov002_022d016c.field_d48 == 0) {
        goto is_zero;
    }
    if (data_ov002_022d016c.field_d4c != 0) {
        goto is_one;
    }
    data_ov002_022d016c.field_d4c = 1;
    func_ov002_0229ade0(3, 0, 0, 0);
is_one:
    return 1;
is_zero:
    data_ov002_022d016c.field_d4c = 0;
    return 0;
}
