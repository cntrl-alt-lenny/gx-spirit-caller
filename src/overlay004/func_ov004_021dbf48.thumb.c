#pragma thumb on
extern char data_ov004_022923d0[];
int func_ov004_021dbf48(int a0, int a1) {
    if (a1 > 0)
        return (*(int (**)(int))data_ov004_022923d0)(a1);
    return 0;
}
