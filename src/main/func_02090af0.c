/* func_02090af0: thunk — `func_02090b00` with r3 = mov #0x0. */

extern int func_02090b00(int a, int b, int c, int d);

int func_02090af0(int a, int b, int c, int _unused) {
    return func_02090b00(a, b, c, 0x0);
}
