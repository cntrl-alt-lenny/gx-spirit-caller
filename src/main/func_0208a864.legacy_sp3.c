extern void func_0208a7c8(void *self, int flag);
extern void func_0208b0a4(void *p, int a1, int a2);

void func_0208a864(void *self, int param2) {
    int flag = ((int)(*(unsigned int *)((char *)self + 0x110) << 30)) >> 31;
    if (flag == 0) {
        func_0208a7c8(self, flag);
        return;
    }
    if (param2 == 0) {
        func_0208a7c8(self, flag);
        return;
    }
    func_0208b0a4((char *)self + 0xe8, 0, param2);
    *(int *)((char *)self + 0x110) |= 0x8;
    *(int *)((char *)self + 0x150) = 0;
}
