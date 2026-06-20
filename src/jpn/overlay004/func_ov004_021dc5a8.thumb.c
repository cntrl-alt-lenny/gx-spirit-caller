#pragma thumb on
extern int func_ov004_021dcff8(int x);
extern int func_ov004_021dc450(int a, int b, int c);
extern int func_ov004_021dc35c(int a, int b, int c);
extern int func_ov004_021dc2ec(int a, int b, int c);
int func_ov004_021dc5a8(int a0, int a1, int a2, int a3) {
    switch (a0) {
    case 0:
        func_ov004_021dcff8(2);
        return func_ov004_021dc450(a1, a2, a3);
    case 1:
        func_ov004_021dcff8(3);
        return func_ov004_021dc35c(a1, a2, a3);
    case 2:
        func_ov004_021dcff8(5);
        return func_ov004_021dc2ec(a1, a2, a3);
    }
    return -1;
}
