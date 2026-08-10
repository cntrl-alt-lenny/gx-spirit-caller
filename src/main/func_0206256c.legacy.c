extern void func_02064db0(int *a, int *b);
extern int func_02054140(int a);
extern void func_020618a8(void *self, int flag, int b, int c, int d);
extern void func_0206280c(void *self, int b, int c, int d);

void func_0206256c(void *self, int b, int c, int d) {
    if (*(int *)((char *)self + 0xc) != 5) {
        return;
    }
    func_02064db0(&b, &c);
    if (func_02054140(*(int *)((char *)self + 0x98)) != 0) {
        func_020618a8(self, 0, b, c, d);
    } else {
        func_0206280c(self, b, c, d);
    }
}
