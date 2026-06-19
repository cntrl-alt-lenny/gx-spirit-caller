/* func_ov002_0224e28c: 3-arg dispatch — `arg3 ? T1(...) : T2(...)`. */

extern int func_ov002_0224a530(int a, int b, int c);
extern int func_ov002_022483a4(int a, int b);

int func_ov002_0224e28c(int a, int b, int c) {
    if (c != 0) return func_ov002_0224a530(a, b, c);
    return func_ov002_022483a4(a, b);
}
