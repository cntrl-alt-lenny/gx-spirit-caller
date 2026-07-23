extern int data_02102c7c;
extern void func_02003d98(int, int, int, int, int, int);
extern void func_02003e98(int, int, int, int, int, int);

void func_02003f1c(int a0, int a1, int a2, int a3, int a4, int a5) {
    if (data_02102c7c != 0) {
        func_02003d98(a0, a1, a2, a3, a4, a5);
        return;
    }
    func_02003e98(a0, a1, a2, a3, a4, a5);
}
