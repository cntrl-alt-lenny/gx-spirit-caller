/* func_020535b8: thunk — `func_020536d4(a, b, 0xb, 0x1fffff)`. */

extern int func_020536d4(int a, int b, int c, int d);

int func_020535b8(int a, int b, int unused1, int unused2) {
    return func_020536d4(a, b, 0xb, 0x1fffff);
}
