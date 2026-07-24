extern int data_02102b9c;
extern void func_02003d78(int, int, int, int, int, int);
extern void func_02003e78(int, int, int, int, int, int);

void func_02003efc(int a0, int a1, int a2, int a3, int a4, int a5) {
    if (data_02102b9c != 0) {
        func_02003d78(a0, a1, a2, a3, a4, a5);
        return;
    }
    func_02003e78(a0, a1, a2, a3, a4, a5);
}
