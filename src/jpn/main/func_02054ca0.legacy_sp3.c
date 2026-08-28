extern int func_0206ed08(int a, int b, int c, int d, void *e);
extern void func_02054e34(int a0, int a1);

void func_02054ca0(int a, int b, int c, int d, unsigned char *e, int *f) {
    *e = (unsigned char)*f;
    int r = func_0206ed08(a, b, c, d, e);
    int v = *e;
    *f = v;
    func_02054e34(r, -1);
}
