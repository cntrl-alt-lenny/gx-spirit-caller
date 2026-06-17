/* func_0209ef3c: StyleA dd30-family (dc30 guard variant); K2=1. */
extern int func_0209da94(int a, int b);
extern int func_0209db3c(int a0);
extern void func_0209dd68(int code, int x);
extern int func_0209dc3c(int code, int z);
int func_0209ef3c(int a0) {
    int r = func_0209db3c(a0);
    if (r != 0) return r;
    func_0209dd68(1, a0);
    r = func_0209dc3c(1, 0);
    return r == 0 ? 2 : r;
}
