/* func_02090968: thunk — `func_02090978` with r3 = mov #0x0. */

extern int func_02090978(int a, int b, int c, int d);

int func_02090968(int a, int b, int c, int _unused) {
    return func_02090978(a, b, c, 0x0);
}
