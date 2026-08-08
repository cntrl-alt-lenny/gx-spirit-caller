extern int  func_020536a0(void);
extern void func_0205362c(void *self, int flags);

void func_02053600(void *self, int flags) {
    int v = func_020536a0();
    func_0205362c(self, (v & ~3) | flags);
}
