/* func_0207f4e8: thunk — pass `(a, b + 0x7000000)` to func_020944a4. */

extern int func_020944a4(int a, int b);

int func_0207f4e8(int a, int b) {
    return func_020944a4(a, b + 0x7000000);
}
