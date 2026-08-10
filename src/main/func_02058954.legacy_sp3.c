extern int func_020601d0(void *a0, int a1, int *out);
extern void func_0205ffd4(void *a0, int a1, void *a2);
extern void func_020585d4(void *a0, int a1, int a2);
extern void func_020a6d54(void *a0, void *a1, int a2, int a3);
extern char data_02100370[];
extern char data_02100398[];
extern char data_021003b0[];

int func_02058954(void **a0) {
    void *p = *a0;
    int local;
    int ret = func_020601d0(a0, *(int *)((char *)p + 0x1d4), &local);

    if (ret != 0) {
        return ret;
    }
    if (local == 4) {
        func_0205ffd4(a0, 0x107, data_02100370);
        func_020585d4(a0, 4, 1);
        return 4;
    }
    if (local == 0) {
        return 0;
    }
    if (local != 3) {
        func_020a6d54(data_02100398, data_021003b0, 0, 0x2ef);
    }
    *(int *)((char *)p + 0x1d8) = 2;
    return 0;
}
