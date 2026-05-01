/* func_ov002_0229d09c: 4-insn thunk to func_ov002_0229d01c. */

extern int func_ov002_0229d01c(int a, int b, int c, int d);

int func_ov002_0229d09c(int a, int unused1, int unused2, int d) {
    return func_ov002_0229d01c(a, 0, 0, d);
}
