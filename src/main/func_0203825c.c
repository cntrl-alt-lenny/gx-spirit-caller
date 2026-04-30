/* func_0203825c: thunk — `func_020381bc(a, -1, b, d)` (drop arg 2). */

extern int func_020381bc(int a, int b, int c, int d);

int func_0203825c(int a, int b, int unused, int d) {
    return func_020381bc(a, -1, b, d);
}
