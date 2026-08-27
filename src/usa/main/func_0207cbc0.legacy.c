extern char *func_0207b450(void);
extern int func_0207c8a8(void *a0);
extern int func_0209f62c(void *a0, void *a1, void *a2, int a3);
extern void func_0207c84c(void *a0);
extern int func_0207c8f4(void);
extern char data_021a07bc[];

void func_0207cbc0(void) {
    char *p = func_0207b450();

    if (p == 0) {
        return;
    }
    if (*(int *)(p + 0x2260) != 9) {
        return;
    }
    if (*(unsigned char *)(p + 0x226b) == 1) {
        return;
    }
    if (func_0207c8a8(data_021a07bc) == 0) {
        return;
    }
    if (func_0209f62c((void *)func_0207c8f4, p + 0x2144, p + 0xf00, 0) == 2) {
        return;
    }
    func_0207c84c(data_021a07bc);
}
