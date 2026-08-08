extern int func_0206ea00(int a);
extern void func_02054ea8(int a0, int a1);

void func_02054d68(int a, unsigned char *b, int *c) {
    int r;
    *b = (unsigned char)*c;
    r = func_0206ea00(a);
    *c = *b;
    func_02054ea8(r, -1);
}
