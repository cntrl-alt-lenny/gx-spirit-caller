/* func_020ace88: thunk — pass `(a, b, c*2)` to func_020a7368. */

extern int func_020a7368(int a, int b, int c);

int func_020ace88(int a, int b, int c) {
    return func_020a7368(a, b, c << 1);
}
