extern int func_0206e98c(int a);
extern void func_02054e34(int a0, int a1);

void func_02054cf4(int a, unsigned char *b, int *c) {
    int r;
    *b = (unsigned char)*c;
    r = func_0206e98c(a);
    *c = *b;
    func_02054e34(r, -1);
}
