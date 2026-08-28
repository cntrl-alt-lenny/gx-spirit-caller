extern int func_0202b998(int a, int b);
extern void func_0202b9e4(int a, int b);
extern int func_0202bacc(int a);
extern void func_0202bb10(int a, int b);
extern void func_0202bab8(int a, int b);

void func_0202ba40(int arg0, int arg1) {
    int v = func_0202b998(arg0, arg1);
    int sum = arg1 + v;

    if (sum > 9) {
        sum = 9;
    }
    func_0202b9e4(arg0, sum);

    if (func_0202bacc(arg0) == 0) {
        func_0202bb10(arg0, 1);
    }
    func_0202bab8(arg0, 1);
}
