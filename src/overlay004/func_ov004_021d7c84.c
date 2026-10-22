extern char data_ov004_0220b500[];
extern int data_ov004_022915e8;
extern unsigned short data_02104bac[];
extern void func_02006110(int *out_a, int *out_b);
extern unsigned int func_0200617c(void);
extern unsigned int func_02006194(void);
extern int func_02037208(int a0, int r1, int r2, int r3);
static inline int active(void) {
    if (data_ov004_022915e8) return 1;
    else return 0;
}
void func_ov004_021d7c84(void) {
    char *b = data_ov004_0220b500;
    int x, y;
    int row;
    if (*(int *)(b + 0x88)) return;
    if ((data_ov004_022915e8 ? 1 : 0) != 0) return;
    if (*(int *)(b + 0x90) < 0) *(int *)(b + 0x90) = 0;
    *(int *)(b + 0x60) = 0;
    if (func_02006194() || func_0200617c()) {
        func_02006110(&x, &y);
        *(int *)(b + 0x60) = 1;
        if (x >= 20 && x < 236 && y >= 7 && y < 163) {
            row = y - 7;
            if (row % 52 < 45) {
                *(int *)(b + 0x60) = 0;
                *(int *)(b + 0x90) = row / 52;
                *(int *)(b + 0x9c) = 1;
                if (func_0200617c()) {
                    func_02037208(58, -1, 0, 1);
                    if (*(int *)(b + 0x90) == 0) *(int *)(b + 0x54) = 5;
                    else *(int *)(b + 0x88) = *(int *)(b + 0x90) + 1;
                }
            }
        }
        if (x >= 224 && x < 250 && y >= 164 && y < 190) {
            *(int *)(b + 0xa0) = 1;
            if (func_0200617c()) {
                func_02037208(66, -1, 0, 1);
                *(int *)(b + 0x90) = -1;
                *(int *)(b + 0x88) = -1;
            }
        }
    } else {
        if (*(int *)(b + 0x90) != 0 && (data_02104bac[42] & 64)) {
            --*(int *)(b + 0x90);
            func_02037208(56, -1, 0, 1);
        } else if (*(int *)(b + 0x90) < 2 && (data_02104bac[42] & 128)) {
            ++*(int *)(b + 0x90);
            func_02037208(56, -1, 0, 1);
        } else if (data_02104bac[42] & 1) {
            func_02037208(58, -1, 0, 1);
            if (*(int *)(b + 0x90) == 0) *(int *)(b + 0x54) = 5;
            else *(int *)(b + 0x88) = *(int *)(b + 0x90) + 1;
        } else if (data_02104bac[42] & 2) {
            func_02037208(66, -1, 0, 1);
            *(int *)(b + 0x90) = -1;
            *(int *)(b + 0xa0) = 1;
            *(int *)(b + 0x88) = -1;
        }
    }
}

