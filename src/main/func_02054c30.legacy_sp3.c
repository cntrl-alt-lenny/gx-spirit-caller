extern int func_0206eb4c(int a);
extern void func_02054ea8(int a0, int a1);

void func_02054c30(int a, unsigned char *b, int *c) {
    int r;
    *b = (unsigned char)*c;
    r = func_0206eb4c(a);
    *c = *b;
    func_02054ea8(r, -1);
}
