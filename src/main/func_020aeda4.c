extern void func_020aedcc(int a0, int a1, int a2, void *args);

void func_020aeda4(int a0, int a1, int a2, ...) {
    unsigned int addr = ((unsigned int)&a2 & ~3) + sizeof(a2);
    void *args = (void *)addr;
    func_020aedcc(a0, a1, a2, args);
}
