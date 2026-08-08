extern char *func_020498f0(void);
extern int func_02045280(void);
extern int func_02051618(int a);

int func_02051ec0(void) {
    if (func_020498f0() == 0) {
        goto ret0;
    }
    if (*(int *)(func_020498f0() + 0x200) == 0) {
        goto ret0;
    }
    if (func_02045280() == 0) {
        goto work;
    }
ret0:
    return 0;
work:
    {
        int r = func_02051618(*(int *)(func_020498f0() + 0x200));
        return r == 0;
    }
}
