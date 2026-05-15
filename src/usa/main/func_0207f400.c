/* func_0207f400: thunk — pass `(a, b + 0x7000000)` to func_020943b0. */

extern int func_020943b0(int a, int b);

int func_0207f400(int a, int b) {
    return func_020943b0(a, b + 0x7000000);
}
