extern int func_ov004_021c9d60(int a, int b);
extern int func_ov004_021d8798(void *ctx, int value, int flags);
extern int data_ov004_0220b500[];
extern int data_ov004_022915e8[];
int func_ov004_021d44cc(void *rec) {
    char *p = rec;
    int flag;
    if (*(int *)(p + 0x38) != 0) {
        *(int *)(p + 0x38) = 0;
        flag = 1;
    } else {
        flag = 0;
    }
    if (flag) {
        data_ov004_0220b500[0x12] = 1;
        func_ov004_021d8798(data_ov004_022915e8, func_ov004_021c9d60(0, 14), 4);
    }
    if (data_ov004_022915e8[0] != 0) flag = 1;
    else flag = 0;
    if (flag) return flag;
    if (1 - data_ov004_022915e8[2]) {
        *(int *)(p + 0x30) = 9;
        *(int *)(p + 0x38) = 1;
        *(int *)(p + 0x3c) = 0;
        return 0;
    }
    *(int *)(p + 0x30) = 41;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3c) = 0;
    return 0;
}
