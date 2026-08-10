extern void func_020453b4(void *a0);
extern void func_02054684(void *a0);
extern void func_020586c8(void *a0, int a1);

void func_020566f4(void **a0) {
    char *p = *(char **)a0;

    func_020586c8(a0, 1);
    func_020453b4(*(void **)(p + 0x460));
    *(void **)(p + 0x460) = 0;
    func_02054684(*(void **)(p + 0x428));
    func_020453b4(p);
    *a0 = 0;
}
