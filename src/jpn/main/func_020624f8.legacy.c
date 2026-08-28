extern void func_02064d3c(int *a, int *b);
extern int func_020540cc(int a);
extern void func_02061834(void *self, int flag, int b, int c, int d);
extern void func_02062798(void *self, int b, int c, int d);

void func_020624f8(void *self, int b, int c, int d) {
    if (*(int *)((char *)self + 0xc) != 5) {
        return;
    }
    func_02064d3c(&b, &c);
    if (func_020540cc(*(int *)((char *)self + 0x98)) != 0) {
        func_02061834(self, 0, b, c, d);
    } else {
        func_02062798(self, b, c, d);
    }
}
