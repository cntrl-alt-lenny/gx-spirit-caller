extern int data_02102b9c;
extern void func_020037b0(int, int, int, int, int, int);
extern void func_02003a2c(int, int, int, int, int, int);

void func_02003aa0(int a0, int a1, int a2, int a3, int a4, int a5) {
    if (data_02102b9c != 0) {
        func_020037b0(a0, a1, a2, a3, a4, a5);
        return;
    }
    func_02003a2c(a0, a1, a2, a3, a4, a5);
}
