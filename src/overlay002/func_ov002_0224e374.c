/* func_ov002_0224e374: 3-arg dispatch — `arg3 ? T1(...) : T2(...)`. */

extern int func_ov002_0224a618(int a, int b, int c);
extern int func_ov002_0224848c(int a, int b);

int func_ov002_0224e374(int a, int b, int c) {
    if (c != 0) return func_ov002_0224a618(a, b, c);
    return func_ov002_0224848c(a, b);
}
