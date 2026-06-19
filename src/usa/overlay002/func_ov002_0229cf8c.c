/* func_ov002_0229cf8c: 4-insn thunk to func_ov002_0229cf0c. */

extern int func_ov002_0229cf0c(int a, int b, int c, int d);

int func_ov002_0229cf8c(int a, int unused1, int unused2, int d) {
    return func_ov002_0229cf0c(a, 0, 0, d);
}
