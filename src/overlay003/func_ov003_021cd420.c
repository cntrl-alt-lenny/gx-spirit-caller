extern char data_021040ac[];
extern int data_02104c68[];
extern char data_02104f4c[];
extern void func_ov003_021cd628(int, int, int, int, int, int, int);
extern int func_ov003_021cce58(int dummy, int sel);
void func_ov003_021cd420(int base, int side) {
    unsigned value;
    int idx = *(int *)(data_021040ac + 0xc3c) ^ side;
    if (data_02104c68[idx] == 0) {
        if (side != 0) value = *(unsigned *)(data_021040ac + 0xba8);
        else value = *(unsigned *)(data_02104f4c + 0xa64);
        func_ov003_021cd628(base, side, 0, 0, 0, 0, 3);
        func_ov003_021cd628(base, side, 0, 0, 1, 4, 3);
        func_ov003_021cd628(base, side, 1, 0, 0, 1, 3);
        func_ov003_021cd628(base, side, 2, 0, 0, 3, 3);
        if (((value & 0x7c00) >> 10) != 6 && ((value & 0x7c00) >> 10) != 11)
            func_ov003_021cd628(base, side, 3, 0, 0, 2, 3);
        if ((value & 0x1f00000) >> 20)
            func_ov003_021cd628(base, side, 4, 0, 0, 5, 3);
    } else {
        func_ov003_021cd628(base, side, 0, 0, 0, 3, 3);
        func_ov003_021cd628(base, side, 0, 1, 0, 2, 3);
        func_ov003_021cd628(base, side, 0, 2, 0, 2, 3);
        if (func_ov003_021cce58(base, data_02104c68[idx]))
            func_ov003_021cd628(base, side, 4, 0, 0, 5, 3);
    }
}
