/* func_02090a50: thunk — `func_02090a60` with r3 = mov #0x0. */

extern int func_02090a60(int a, int b, int c, int d);

int func_02090a50(int a, int b, int c, int _unused) {
    return func_02090a60(a, b, c, 0x0);
}
