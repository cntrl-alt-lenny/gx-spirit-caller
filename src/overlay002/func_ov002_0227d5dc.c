/* func_ov002_0227d5dc: 4-arg dispatch — `arg4 ? T1(...) : T2(...)`. */

extern int func_ov002_021bc72c(int a, int b, int c, int d);
extern int func_ov002_021bc8c8(int a, int b, int c);

int func_ov002_0227d5dc(int a, int b, int c, int d) {
    if (d != 0) return func_ov002_021bc72c(a, b, c, d);
    return func_ov002_021bc8c8(a, b, c);
}
