/* func_0209f030: StyleA dd30-family (dc30 guard variant); K2=1. */
extern int func_0209db88(int a, int b);
extern int func_0209dc30(int a0);
extern void func_0209de5c(int code, int x);
extern int func_0209dd30(int code, int z);
int func_0209f030(int a0) {
    int r = func_0209dc30(a0);
    if (r != 0) return r;
    func_0209de5c(1, a0);
    r = func_0209dd30(1, 0);
    return r == 0 ? 2 : r;
}
