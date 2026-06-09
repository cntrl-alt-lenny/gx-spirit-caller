#pragma thumb on
extern int func_ov004_021dd20c(int x);
extern int func_ov004_021dc664(int a, int b, int c);
extern int func_ov004_021dc570(int a, int b, int c);
extern int func_ov004_021dc500(int a, int b, int c);
int func_ov004_021dc7bc(int a0, int a1, int a2, int a3) {
    switch (a0) {
    case 0:
        func_ov004_021dd20c(2);
        return func_ov004_021dc664(a1, a2, a3);
    case 1:
        func_ov004_021dd20c(3);
        return func_ov004_021dc570(a1, a2, a3);
    case 2:
        func_ov004_021dd20c(5);
        return func_ov004_021dc500(a1, a2, a3);
    }
    return -1;
}
