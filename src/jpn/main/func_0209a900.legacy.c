typedef struct {
    char _pad0[0x4];
    int field_4;
    int field_8;
} data_021a83e4_t;

extern data_021a83e4_t data_021a8304;
extern int func_0209b3f0(int a, int b, int c);
extern void func_0209acc0(int x);

int func_0209a900(int a, int b, int c) {
    if (func_0209b3f0(a, b, c) == 0) {
        return 1;
    }
    data_021a8304.field_4 = b;
    data_021a8304.field_8 = c;
    func_0209acc0((a & 0xff) | 0x03006600);
    return 0;
}
