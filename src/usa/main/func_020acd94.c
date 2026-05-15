/* func_020acd94: thunk — pass `(a, b, c*2)` to func_020a7274. */

extern int func_020a7274(int a, int b, int c);

int func_020acd94(int a, int b, int c) {
    return func_020a7274(a, b, c << 1);
}
