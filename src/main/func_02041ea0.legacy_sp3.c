extern void func_020927b8(char *p);
extern void func_02092748(void *p);
extern void func_02091af4(char *self);

void func_02041ea0(char *self) {
    if (*(unsigned char *)(self + 0x1000) != 0xff) {
        return;
    }
    func_020927b8(self + 0x1bf4);
    *(int *)(self + 0x1c0c) = 1;
    func_02092748(self + 0x1bf4);
    if (*(int *)(self + 0x1ba0) != 0) {
        func_02091af4(self + 0x1b34);
    }
}
