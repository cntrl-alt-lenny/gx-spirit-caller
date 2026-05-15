/* func_0209ed1c: thunk — `func_0209ed2c` with r1 = mov #0x1. */

extern int func_0209ed2c(int a, int b, int c, int d);

int func_0209ed1c(int a, int _unused, int c, int d) {
    return func_0209ed2c(a, 0x1, c, d);
}
