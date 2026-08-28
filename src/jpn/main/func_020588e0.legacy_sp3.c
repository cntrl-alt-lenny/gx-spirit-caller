extern int func_0206015c(void *a0, int a1, int *out);
extern void func_0205ff60(void *a0, int a1, void *a2);
extern void func_02058560(void *a0, int a1, int a2);
extern void func_020a6c60(void *a0, void *a1, int a2, int a3);
extern char data_02100290[];
extern char data_021002b8[];
extern char data_021002d0[];

int func_020588e0(void **a0) {
    void *p = *a0;
    int local;
    int ret = func_0206015c(a0, *(int *)((char *)p + 0x1d4), &local);

    if (ret != 0) {
        return ret;
    }
    if (local == 4) {
        func_0205ff60(a0, 0x107, data_02100290);
        func_02058560(a0, 4, 1);
        return 4;
    }
    if (local == 0) {
        return 0;
    }
    if (local != 3) {
        func_020a6c60(data_021002b8, data_021002d0, 0, 0x2ef);
    }
    *(int *)((char *)p + 0x1d8) = 2;
    return 0;
}
