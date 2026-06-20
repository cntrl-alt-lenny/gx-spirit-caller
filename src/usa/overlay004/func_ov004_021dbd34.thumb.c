#pragma thumb on
extern char data_ov004_02292170[];
int func_ov004_021dbd34(int a0, int a1) {
    if (a1 > 0)
        return (*(int (**)(int))data_ov004_02292170)(a1);
    return 0;
}
