extern void func_02076788(void *self, int b, int c);
extern void func_0207667c(void *self);
extern void func_02077b20(void *self, int a, int b);
extern void func_02076474(void *self);

void func_02076434(void *self, int b) {
    func_02076788(self, b, *(int *)((char *)self + 0x81c));
    func_0207667c(self);
    func_02077b20(self, 0, 0);
    func_02076474(self);
    *(unsigned char *)((char *)self + 0x455) = 5;
}
