typedef struct { int scale; int mode; int unused[2]; void *entry; } Record;
extern char data_ov004_0220b500[];
extern void func_ov004_021ca0a4(Record *self, int a, int x, int y, void *p, int index);
void func_ov004_021d9b98(void) {
    char *b = data_ov004_0220b500;
    int i, y;
    for (i = 0, y = 0x58; i < 2; i++, y += 0x1a) {
        int active = 0;
        if (*(int *)(b + 0x234) && *(int *)(b + 0x22c) == i) active = 1;
        func_ov004_021ca0a4((Record *)(b + 0x5f90), 2, 0x2e, y, 2, active + 0x12);
    }
    if (*(int *)(b + 0x54) != 4 && *(int *)(b + 0x54) != 2) {
        int row = *(int *)(b + 0x22c);
        if (row >= 1) row = 1;
        if (*(int *)(b + 0x224)) {
            if (*(int *)(b + 0x224) & ~0x1b)
                func_ov004_021ca0a4((Record *)(b + 0x5f90), 2, 0xe, row * 0x1a + 0x58, 1, 0x16);
        } else {
            func_ov004_021ca0a4((Record *)(b + 0x5f90), 2, 0xe, row * 0x1a + 0x5a, 1, 0x18);
        }
        row = *(int *)(b + 0x230);
        if (row >= 1) row = 1;
        if (*(int *)(b + 0x228)) {
            if (*(int *)(b + 0x228) & ~0x1b)
                func_ov004_021ca0a4((Record *)(b + 0x5f90), 2, 0xd2, row * 0x1a + 0x58, 1, 0x17);
        } else {
            func_ov004_021ca0a4((Record *)(b + 0x5f90), 2, 0xd7, row * 0x1a + 0x5a, 1, 0x19);
        }
    }
    func_ov004_021ca0a4((Record *)(b + 0x5f90), 2, 0xe4, 3, 2, *(int *)(b + 0xa0));
}
