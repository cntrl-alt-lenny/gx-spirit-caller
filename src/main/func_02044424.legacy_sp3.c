extern char *data_0219da78;
extern int func_02043c28(int a0, int a1, int a2);
extern int func_02043bdc(void *a0, void *a1, void *a2, void *a3);
extern int func_02043b70(void);

int func_02044424(char *dst, int *flags, void *arg) {
    int i;
    char *src = data_0219da78;
    for (i = 0; i < 4; i++) {
        if (flags[i] != 0) {
            do {
                func_02043c28((int)src, 0x100, (int)dst);
            } while (func_02043bdc(dst, src, (void *)0x100, arg) == 0);
        }
        dst += 0x100;
        src += 0x100;
    }
    return func_02043b70() != 0;
}
