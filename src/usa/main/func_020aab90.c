extern void func_020aab3c(int a0, int a1, void *args);

void func_020aab90(int a0, int a1, ...) {
    unsigned int addr = ((unsigned int)&a1 & ~3) + sizeof(a1);
    void *args = (void *)addr;
    func_020aab3c(a0, a1, args);
}
