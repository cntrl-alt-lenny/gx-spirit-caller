extern void func_020aac30(int a0, int a1, void *args);

void func_020aac84(int a0, int a1, ...) {
    unsigned int addr = ((unsigned int)&a1 & ~3) + sizeof(a1);
    void *args = (void *)addr;
    func_020aac30(a0, a1, args);
}
