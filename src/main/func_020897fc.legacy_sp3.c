extern void *func_0207dab4(void *pool, int size, int align);
extern void *func_0207cfc8(void *p, int flag);
extern void func_0207d12c(void *a, void *b);

void *func_020897fc(void *self, int size, int param3, int param4, int param5) {
    int alignedSize = ((size + 0x1f) & ~0x1f) + 0x20;
    void *block = func_0207dab4(*(void **)self, alignedSize, 0x20);
    void *ret;
    if (block == 0) {
        return 0;
    }
    ret = func_0207cfc8((char *)self + 4, 0);
    *(int *)((char *)block + 8) = size;
    *(int *)((char *)block + 0xc) = param3;
    *(int *)((char *)block + 0x10) = param4;
    *(int *)((char *)block + 0x14) = param5;
    func_0207d12c(ret, block);
    return (char *)block + 0x20;
}
