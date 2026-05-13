/* func_ov002_0227d4ec: 4-arg dispatch — `arg4 ? T1(...) : T2(...)`. */

extern int func_ov002_021bc64c(int a, int b, int c, int d);
extern int func_ov002_021bc7e8(int a, int b, int c);

int func_ov002_0227d4ec(int a, int b, int c, int d) {
    if (d != 0) return func_ov002_021bc64c(a, b, c, d);
    return func_ov002_021bc7e8(a, b, c);
}
