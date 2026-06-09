#pragma thumb on
extern char data_ov004_0220a2a0[];
extern int data_0219ef1c[];
extern int func_ov004_021dbd84(int x);
extern int func_0206e7bc(void *p);
extern void func_02091768(int x);
int func_ov004_021dbecc(int a0, int a1, int a2) {
    *(int *)(data_ov004_0220a2a0 + 16) = func_ov004_021dbd84(a0);
    *(int *)(data_ov004_0220a2a0 + 20) = func_ov004_021dbd84(a1);
    *(int *)(data_ov004_0220a2a0 + 24) = func_ov004_021dbd84(a2);
    if (func_0206e7bc(data_ov004_0220a2a0) < 0) return -1;
    while (data_0219ef1c[0] == 0)
        func_02091768(100);
    return 0;
}
