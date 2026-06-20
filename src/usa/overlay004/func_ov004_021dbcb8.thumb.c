#pragma thumb on
extern char data_ov004_0220a040[];
extern int data_0219ee3c[];
extern int func_ov004_021dbb70(int x);
extern int func_0206e748(void *p);
extern void func_02091680(int x);
int func_ov004_021dbcb8(int a0, int a1, int a2) {
    *(int *)(data_ov004_0220a040 + 16) = func_ov004_021dbb70(a0);
    *(int *)(data_ov004_0220a040 + 20) = func_ov004_021dbb70(a1);
    *(int *)(data_ov004_0220a040 + 24) = func_ov004_021dbb70(a2);
    if (func_0206e748(data_ov004_0220a040) < 0) return -1;
    while (data_0219ee3c[0] == 0)
        func_02091680(100);
    return 0;
}
