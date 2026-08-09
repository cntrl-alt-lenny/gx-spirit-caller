extern int func_0206ed7c(int a, int b, int c, int d, void *e);
extern void func_02054ea8(int a0, int a1);

void func_02054d14(int a, int b, int c, int d, unsigned char *e, int *f) {
    *e = (unsigned char)*f;
    int r = func_0206ed7c(a, b, c, d, e);
    int v = *e;
    *f = v;
    func_02054ea8(r, -1);
}
