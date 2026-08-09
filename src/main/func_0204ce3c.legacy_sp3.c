extern void *func_020498f0(void);
extern void *func_0204ead0(int a, int b, int c, int d, int e, int f);

void *func_0204ce3c(int a0) {
    void *ctx1 = func_020498f0();
    void *ctx2 = func_020498f0();
    void *ret = func_0204ead0(5, a0, *(int *)((char *)ctx1 + 0x24),
                               *(unsigned short *)((char *)ctx2 + 0xa4), 0, 0);

    *(int *)((char *)func_020498f0() + 0x204) = 0;

    return ret;
}
