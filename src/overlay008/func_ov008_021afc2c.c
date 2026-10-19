typedef struct {
    char pad0[4];
    unsigned short field4;
    char pad6[0xa2];
    unsigned short field_a8;
} Obj;
extern Obj data_ov008_021b2de4;
extern int func_020b3870(int a, int b);
extern void func_ov008_021abb08(int a0, int a1);
extern void func_ov008_021abba0(int a0, int a1);

void func_ov008_021afc2c(int index) {
    unsigned int count = data_ov008_021b2de4.field_a8;
    int step;
    int base;
    int row;
    if (count > 3) count = 3;
    step = func_020b3870(0x8a, count * 2);
    base = 0x15;
    row = data_ov008_021b2de4.field4;
    base += index * (step * 2);
    if (row == 0) {
        func_ov008_021abb08(0x24, base + step - 0x16);
    } else {
        func_ov008_021abba0((row - 1) * 0x1a + 0x47, base + step - 0xe);
    }
}

