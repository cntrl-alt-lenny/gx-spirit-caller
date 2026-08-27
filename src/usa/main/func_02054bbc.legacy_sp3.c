extern int func_0206ead8(int a);
extern void func_02054e34(int a0, int a1);

void func_02054bbc(int a, unsigned char *b, int *c) {
    int r;
    *b = (unsigned char)*c;
    r = func_0206ead8(a);
    *c = *b;
    func_02054e34(r, -1);
}
