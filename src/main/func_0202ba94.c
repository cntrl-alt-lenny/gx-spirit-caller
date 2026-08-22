extern int func_0202b9ec(int a, int b);
extern void func_0202ba38(int a, int b);
extern int func_0202bb20(int a);
extern void func_0202bb64(int a, int b);
extern void func_0202bb0c(int a, int b);

void func_0202ba94(int arg0, int arg1) {
    int v = func_0202b9ec(arg0, arg1);
    int sum = arg1 + v;

    if (sum > 9) {
        sum = 9;
    }
    func_0202ba38(arg0, sum);

    if (func_0202bb20(arg0) == 0) {
        func_0202bb64(arg0, 1);
    }
    func_0202bb0c(arg0, 1);
}
