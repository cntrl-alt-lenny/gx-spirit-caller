/* func_020ac368: thunk — `func_020ac288` with r1 = mov #0x0. */

extern int func_020ac288(int a, int b, int c, int d);

int func_020ac368(int a, int _unused, int c, int d) {
    return func_020ac288(a, 0x0, c, d);
}
