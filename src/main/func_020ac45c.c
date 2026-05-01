/* func_020ac45c: thunk — `func_020ac37c` with r1 = mov #0x0. */

extern int func_020ac37c(int a, int b, int c, int d);

int func_020ac45c(int a, int _unused, int c, int d) {
    return func_020ac37c(a, 0x0, c, d);
}
