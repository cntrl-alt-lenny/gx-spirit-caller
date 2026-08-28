extern int  func_0205362c(void);
extern void func_020535b8(void *self, int flags);

void func_0205358c(void *self, int flags) {
    int v = func_0205362c();
    func_020535b8(self, (v & ~3) | flags);
}
