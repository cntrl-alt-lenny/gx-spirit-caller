extern int func_02062eec(void *a0, int mode, void *arg2, int *out);
extern void func_020613d8(void *dst, void *src, unsigned int len);
extern int func_02062e6c(void *a0);

int func_02062d88(unsigned char *a0, void *name) {
    int local;

    if (func_02062eec(a0, 1, (void *)0x27, &local) == 0) {
        return 0;
    }
    if (local != 0) {
        return 1;
    }
    func_020613d8(a0 + 0x50, name, 0x20);
    return func_02062e6c(a0) != 0;
}
