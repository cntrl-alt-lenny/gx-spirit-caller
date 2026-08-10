extern void func_02076870(void *self, int b, int c);
extern void func_02076764(void *self);
extern void func_02077c08(void *self, int a, int b);
extern void func_0207655c(void *self);

void func_0207651c(void *self, int b) {
    func_02076870(self, b, *(int *)((char *)self + 0x81c));
    func_02076764(self);
    func_02077c08(self, 0, 0);
    func_0207655c(self);
    *(unsigned char *)((char *)self + 0x455) = 5;
}
