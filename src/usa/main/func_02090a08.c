/* func_02090a08: thunk — `func_02090a18` with r3 = mov #0x0. */

extern int func_02090a18(int a, int b, int c, int d);

int func_02090a08(int a, int b, int c, int _unused) {
    return func_02090a18(a, b, c, 0x0);
}
